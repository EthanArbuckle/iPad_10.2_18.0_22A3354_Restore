@implementation SFStartPageCustomizationViewController

- (SFStartPageCustomizationViewController)initWithDataSource:(id)a3
{
  id v4;
  SFStartPageCustomizationViewController *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  WBSStartPageBackgroundImagesDataSource *backgroundImagesDataSource;
  uint64_t v15;
  NSMutableDictionary *identifierToFixedCustomizationItemMap;
  uint64_t v17;
  NSMutableDictionary *identifierToCustomizationItemMap;
  uint64_t v19;
  NSMutableDictionary *identifierToSuggestionsDataSourceCustomizationItemMap;
  void *v21;
  void *v22;
  uint64_t v23;
  NSArray *mobileAssetFileNames;
  uint64_t v25;
  NSMutableArray *mobileAssetItemProviders;
  void *v27;
  void *v28;
  SFStartPageCustomizationViewController *v29;
  objc_super v31;

  v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)SFStartPageCustomizationViewController;
  v5 = -[SFStartPageCustomizationViewController initWithNibName:bundle:](&v31, sel_initWithNibName_bundle_, 0, 0);
  if (v5)
  {
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFStartPageCustomizationViewController setTitle:](v5, "setTitle:", v6);

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0C99E98];
    _SFSafariContainerPath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fileURLWithPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library"), 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "URLByAppendingPathComponent:isDirectory:", CFSTR("Caches"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D8AC98]), "initWithBundle:localCachesDirectory:", v7, v12);
    backgroundImagesDataSource = v5->_backgroundImagesDataSource;
    v5->_backgroundImagesDataSource = (WBSStartPageBackgroundImagesDataSource *)v13;

    objc_storeWeak((id *)&v5->_dataSource, v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = objc_claimAutoreleasedReturnValue();
    identifierToFixedCustomizationItemMap = v5->_identifierToFixedCustomizationItemMap;
    v5->_identifierToFixedCustomizationItemMap = (NSMutableDictionary *)v15;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v17 = objc_claimAutoreleasedReturnValue();
    identifierToCustomizationItemMap = v5->_identifierToCustomizationItemMap;
    v5->_identifierToCustomizationItemMap = (NSMutableDictionary *)v17;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v19 = objc_claimAutoreleasedReturnValue();
    identifierToSuggestionsDataSourceCustomizationItemMap = v5->_identifierToSuggestionsDataSourceCustomizationItemMap;
    v5->_identifierToSuggestionsDataSourceCustomizationItemMap = (NSMutableDictionary *)v19;

    -[SFStartPageCustomizationViewController _updateHasGeneratedBackgroundImage:](v5, "_updateHasGeneratedBackgroundImage:", v4);
    objc_msgSend(v4, "backgroundImageAssetControllerForCustomizationViewController:", v5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fileNames");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "copy");
    mobileAssetFileNames = v5->_mobileAssetFileNames;
    v5->_mobileAssetFileNames = (NSArray *)v23;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = objc_claimAutoreleasedReturnValue();
    mobileAssetItemProviders = v5->_mobileAssetItemProviders;
    v5->_mobileAssetItemProviders = (NSMutableArray *)v25;

    -[SFStartPageCustomizationViewController _createMobileAssetBackgroundImageItemProviders](v5, "_createMobileAssetBackgroundImageItemProviders");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addObserver:selector:name:object:", v5, sel_mobileAssetBackgroundImageInstalled_, *MEMORY[0x1E0D8AE90], v5->_backgroundImagesDataSource);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v5, sel_backgroundImagesDidChange_, *MEMORY[0x1E0D8B5E8], v5->_backgroundImagesDataSource);

    v29 = v5;
  }

  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SFStartPageCustomizationViewController;
  -[SFStartPageCustomizationViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  UICollectionView *v6;
  UICollectionView *rootCollectionView;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  UICollectionView *v12;
  UICollectionView *backgroundImagesCollectionView;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SFStartPageCustomizationViewController;
  -[SFStartPageCustomizationViewController viewDidLoad](&v14, sel_viewDidLoad);
  -[SFStartPageCustomizationViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeRootCollectionViewLayout](self, "makeRootCollectionViewLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0DC35B8]);
  objc_msgSend(v3, "bounds");
  v6 = (UICollectionView *)objc_msgSend(v5, "initWithFrame:collectionViewLayout:", v4);
  rootCollectionView = self->_rootCollectionView;
  self->_rootCollectionView = v6;

  -[UICollectionView setAutoresizingMask:](self->_rootCollectionView, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionView setBackgroundColor:](self->_rootCollectionView, "setBackgroundColor:", v8);

  -[UICollectionView setDelegate:](self->_rootCollectionView, "setDelegate:", self);
  -[UICollectionView setAccessibilityIdentifier:](self->_rootCollectionView, "setAccessibilityIdentifier:", CFSTR("StartPageCustomizationMenu"));
  -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_rootCollectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(), CFSTR("background-images-grid"));
  objc_msgSend(v3, "addSubview:", self->_rootCollectionView);
  -[SFStartPageCustomizationViewController setUpRootCollectionViewDataSource](self, "setUpRootCollectionViewDataSource");
  -[SFStartPageCustomizationViewController makeBackgroundImagesCollectionViewLayout](self, "makeBackgroundImagesCollectionViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0DC35B8]);
  -[SFStartPageCustomizationViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v12 = (UICollectionView *)objc_msgSend(v10, "initWithFrame:collectionViewLayout:", v9);
  backgroundImagesCollectionView = self->_backgroundImagesCollectionView;
  self->_backgroundImagesCollectionView = v12;

  -[UICollectionView setDelegate:](self->_backgroundImagesCollectionView, "setDelegate:", self);
  -[UICollectionView setAccessibilityIdentifier:](self->_backgroundImagesCollectionView, "setAccessibilityIdentifier:", CFSTR("StartPageBackgroundImageCollection"));
  -[SFStartPageCustomizationViewController setUpBackgroundImagesCollectionViewDataSource](self, "setUpBackgroundImagesCollectionViewDataSource");
  -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  id WeakRetained;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFStartPageCustomizationViewController;
  -[SFStartPageCustomizationViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "startPageCustomizationViewControllerDidFinish:", self);

}

- (void)_updateGeneratedBackgroundImageItemProviderWithImage:(id)a3
{
  id v4;
  void *v5;
  NSItemProvider *v6;
  NSItemProvider *generatedBackgroundImageItemProvider;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v4, "CGImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSItemProvider *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v5);
  generatedBackgroundImageItemProvider = self->_generatedBackgroundImageItemProvider;
  self->_generatedBackgroundImageItemProvider = v6;

  -[NSItemProvider setSuggestedName:](self->_generatedBackgroundImageItemProvider, "setSuggestedName:", CFSTR("GeneratedProfileImage"));
  if (v5)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __95__SFStartPageCustomizationViewController__updateGeneratedBackgroundImageItemProviderWithImage___block_invoke;
    v8[3] = &unk_1E21E6BF0;
    v9 = v5;
    -[NSItemProvider setPreviewImageHandler:](self->_generatedBackgroundImageItemProvider, "setPreviewImageHandler:", v8);

  }
}

uint64_t __95__SFStartPageCustomizationViewController__updateGeneratedBackgroundImageItemProviderWithImage___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

- (void)_createGeneratedBackgroundImageItemProvider
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "profileProviderForCustomizationViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_hasGeneratedBackgroundImage)
  {
    -[SFStartPageCustomizationViewController _backgroundImageIdentifier](self, "_backgroundImageIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeProfile");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageForIdentifier:forProfile:", v6, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SFStartPageCustomizationViewController _updateGeneratedBackgroundImageItemProviderWithImage:](self, "_updateGeneratedBackgroundImageItemProviderWithImage:", v9);
  }
  else
  {
    objc_initWeak(&location, self);
    objc_msgSend(v4, "activeProfile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "symbolImageName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeProfileIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeProfile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "color");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __85__SFStartPageCustomizationViewController__createGeneratedBackgroundImageItemProvider__block_invoke;
    v15[3] = &unk_1E21E6C18;
    objc_copyWeak(&v17, &location);
    v16 = v5;
    objc_msgSend(v16, "generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:", v11, v12, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

}

void __85__SFStartPageCustomizationViewController__createGeneratedBackgroundImageItemProvider__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchImage:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "_updateGeneratedBackgroundImageItemProviderWithImage:", v4);

  }
}

- (void)_updateHasGeneratedBackgroundImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  objc_msgSend(a3, "profileProviderForCustomizationViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "hasMultipleProfiles") & 1) != 0)
  {
    -[SFStartPageCustomizationViewController _backgroundImageIdentifier](self, "_backgroundImageIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activeProfile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __77__SFStartPageCustomizationViewController__updateHasGeneratedBackgroundImage___block_invoke;
    v9[3] = &unk_1E21E6C40;
    v9[4] = self;
    objc_msgSend(v6, "getHasGeneratedBackgroundImage:forProfileWithIdentifier:completionHandler:", v5, v8, v9);

  }
  else if (self->_hasGeneratedBackgroundImage)
  {
    self->_hasGeneratedBackgroundImage = 0;
    -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 0);
  }

}

uint64_t __77__SFStartPageCustomizationViewController__updateHasGeneratedBackgroundImage___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(result + 32);
  if (*(unsigned __int8 *)(v2 + 1064) != a2)
  {
    *(_BYTE *)(v2 + 1064) = a2;
    return objc_msgSend(*(id *)(result + 32), "reloadDataAnimatingDifferences:", 0);
  }
  return result;
}

- (id)_backgroundImageIdentifier
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "profileProviderForCustomizationViewController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "activeTabGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isNamed"))
  {
    objc_msgSend(v4, "activeTabGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "uuid");
  }
  else
  {
    objc_msgSend(v4, "activeProfile");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
  }
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v8 = -[__CFString isEqualToString:](v7, "isEqualToString:", *MEMORY[0x1E0D89E20]);
  v9 = &stru_1E21FE780;
  if (!v8)
    v9 = v7;
  v10 = v9;

  return v10;
}

- (void)_updateMobileAssetBackgroundImageItemProviderWithImage:(id)a3 fileName:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:", objc_msgSend(v6, "CGImage"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v8);
    objc_msgSend(v9, "setSuggestedName:", v7);
    if (v8)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __106__SFStartPageCustomizationViewController__updateMobileAssetBackgroundImageItemProviderWithImage_fileName___block_invoke;
      v10[3] = &unk_1E21E6BF0;
      v11 = v8;
      objc_msgSend(v9, "setPreviewImageHandler:", v10);

    }
    -[NSMutableArray addObject:](self->_mobileAssetItemProviders, "addObject:", v9);

  }
}

uint64_t __106__SFStartPageCustomizationViewController__updateMobileAssetBackgroundImageItemProviderWithImage_fileName___block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32), 0);
}

- (void)_createMobileAssetBackgroundImageItemProviders
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFURL *v9;
  CGImageSource *v10;
  void *v11;
  NSArray *obj;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  obj = self->_mobileAssetFileNames;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v14;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v14 != v4)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safari_startPageBackgroundImageThumbnailMobileAssetFolderURL");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URLByAppendingPathComponent:", v6);
        v9 = (const __CFURL *)objc_claimAutoreleasedReturnValue();

        v10 = CGImageSourceCreateWithURL(v9, 0);
        objc_msgSend(MEMORY[0x1E0D8A0C0], "imageByAdoptingCGImage:", CGImageSourceCreateImageAtIndex(v10, 0, 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CFRelease(v10);
        -[SFStartPageCustomizationViewController _updateMobileAssetBackgroundImageItemProviderWithImage:fileName:](self, "_updateMobileAssetBackgroundImageItemProviderWithImage:fileName:", v11, v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }

}

- (void)setCustomizationItemIdentifier:(id)a3 inSection:(id)a4 enabled:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v5 = a5;
  v20 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isEqual:", CFSTR("fixed-customization-items")) & 1) != 0)
  {
    v9 = 1;
  }
  else if ((objc_msgSend(v8, "isEqual:", CFSTR("customization-items")) & 1) != 0)
  {
    v9 = 0;
  }
  else if (objc_msgSend(v8, "isEqual:", CFSTR("suggestions-data")))
  {
    v9 = 2;
  }
  else
  {
    v9 = 0;
  }

  -[SFStartPageCustomizationViewController identifierToCustomizationItemMapForItemVariant:](self, "identifierToCustomizationItemMapForItemVariant:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v20);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "isEnabled") != v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "startPageCustomizationViewController:willModifySectionWithIdentifier:enabled:", self, v14, v5);

    }
    objc_msgSend(v12, "itemWithEnabled:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, v16);

    -[UICollectionViewDiffableDataSource snapshot](self->_rootCollectionViewDataSource, "snapshot");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "itemIdentifiersInSectionWithIdentifier:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    ++self->_reloadDataSuppressionCount;
    -[SFStartPageCustomizationViewController didChangeCustomizationItemOrder:forVariant:](self, "didChangeCustomizationItemOrder:forVariant:", v18, v9);
    --self->_reloadDataSuppressionCount;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && objc_msgSend(v20, "isEqualToString:", *MEMORY[0x1E0D8A648])
      && !v5)
    {
      objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safari_setBool:andNotifyForKey:", 0, *MEMORY[0x1E0D8A268]);

    }
  }

}

- (void)didChangeCustomizationItemOrder:(id)a3 forVariant:(int64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v14 = a3;
  -[SFStartPageCustomizationViewController identifierToCustomizationItemMapForItemVariant:](self, "identifierToCustomizationItemMapForItemVariant:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__SFStartPageCustomizationViewController_didChangeCustomizationItemOrder_forVariant___block_invoke;
  v15[3] = &unk_1E21E6C68;
  v7 = v6;
  v16 = v7;
  objc_msgSend(v14, "safari_mapObjectsUsingBlock:", v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v11 = WeakRetained;
  if (a4 == 2)
  {
    objc_msgSend(WeakRetained, "startPageCustomizationViewController:customizationItemsForCustomizationVariant:", self, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);
    goto LABEL_5;
  }
  if (!a4)
  {
    objc_msgSend(WeakRetained, "startPageCustomizationViewController:customizationItemsForCustomizationVariant:", self, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v12);
LABEL_5:

  }
  ++self->_reloadDataSuppressionCount;
  v13 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v11, "startPageCustomizationViewController:didCustomizeItems:withVariant:", self, v13, a4);

  --self->_reloadDataSuppressionCount;
}

id __85__SFStartPageCustomizationViewController_didChangeCustomizationItemOrder_forVariant___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)identifierToCustomizationItemMapForItemVariant:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    a2 = (SEL)*(id *)((char *)&self->super.super.super.isa + *(&off_1E21E7050)[a3]);
  return (id)(id)a2;
}

- (void)backgroundImagesDidChange:(id)a3
{
  -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
}

- (BOOL)showsBackgroundImagesCell
{
  char v2;
  id WeakRetained;

  if (self->_backgroundSectionUnconditionallyVisible)
    return 1;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v2 = objc_msgSend(WeakRetained, "isBackgroundImageEnabledForStartPageCustomizationViewController:", self);

  return v2;
}

- (void)mobileAssetBackgroundImageInstalled:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D8AE98]);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);

}

- (void)setShowsCloseButton:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (self->_showsCloseButton != a3)
  {
    self->_showsCloseButton = a3;
    if (a3)
    {
      v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 24, self, sel__dismiss_);
      -[SFStartPageCustomizationViewController navigationItem](self, "navigationItem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sf_setPreferredDismissOrDoneButtonItem:", v6);

      -[SFStartPageCustomizationViewController navigationItem](self, "navigationItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sf_preferredDismissOrDoneButtonItem");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("StartPageCustomizationMenuCloseButton"));

    }
    else
    {
      -[SFStartPageCustomizationViewController navigationItem](self, "navigationItem");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sf_setPreferredDismissOrDoneButtonItem:", 0);
    }

  }
}

- (void)_dismiss:(id)a3
{
  -[SFStartPageCustomizationViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)reloadDataAnimatingDifferences:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  WBSStartPageBackgroundImagesDataSource *backgroundImagesDataSource;
  void *v22;
  uint64_t v23;
  void *v24;
  _BOOL4 hasGeneratedBackgroundImage;
  _BOOL4 v26;
  SFStartPageBackgroundImageModel *v27;
  NSItemProvider *generatedBackgroundImageItemProvider;
  void *v29;
  void *v30;
  SFStartPageBackgroundImageModel *v31;
  SFStartPageBackgroundImageModel *v32;
  uint64_t v33;
  uint64_t i;
  SFStartPageBackgroundImageModel *v35;
  uint64_t v36;
  NSArray *mobileAssetFileNames;
  void *v38;
  uint64_t v39;
  uint64_t j;
  SFStartPageBackgroundImageModel *v41;
  void *v42;
  void *v43;
  SFStartPageBackgroundImageModel *v44;
  void *v45;
  void *v46;
  SFStartPageBackgroundImageModel *v47;
  id *location;
  id *locationa;
  _BOOL4 v50;
  id v51;
  void *v52;
  void *v53;
  SFStartPageBackgroundImageModel *v54;
  void *v55;
  void *v56;
  id WeakRetained;
  id obj;
  id obja;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  const __CFString *v64;
  _BYTE v65[128];
  const __CFString *v66;
  const __CFString *v67;
  const __CFString *v68;
  const __CFString *v69;
  _QWORD v70[3];

  v70[1] = *MEMORY[0x1E0C80C00];
  if (!self->_reloadDataSuppressionCount)
  {
    v50 = a3;
    location = (id *)&self->_dataSource;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (self->_rootCollectionViewDataSource)
    {
      v51 = objc_alloc_init(MEMORY[0x1E0DC3398]);
      if (objc_msgSend(WeakRetained, "isCloudSyncAvailableForStartPageCustomizationViewController:", self))
      {
        v70[0] = CFSTR("customization-sync");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendSectionsWithIdentifiers:", v4);

        v69 = CFSTR("customization-sync::toggle");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v5, CFSTR("customization-sync"));

      }
      objc_msgSend(WeakRetained, "startPageCustomizationViewController:customizationItemsForCustomizationVariant:", self, 1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      configureSnapshotWithCustomizationItemsSection(v51, CFSTR("fixed-customization-items"), v55, self->_identifierToFixedCustomizationItemMap);
      objc_msgSend(WeakRetained, "startPageCustomizationViewController:customizationItemsForCustomizationVariant:", self, 0);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      configureSnapshotWithCustomizationItemsSection(v51, CFSTR("customization-items"), v53, self->_identifierToCustomizationItemMap);
      if (objc_msgSend(WeakRetained, "isSuggestionsCustomizationAvailableForStartPageCustomizationViewController:", self))
      {
        objc_msgSend(WeakRetained, "startPageCustomizationViewController:customizationItemsForCustomizationVariant:", self, 2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        configureSnapshotWithCustomizationItemsSection(v51, CFSTR("suggestions-data"), v6, self->_identifierToSuggestionsDataSourceCustomizationItemMap);

      }
      v68 = CFSTR("background-image");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appendSectionsWithIdentifiers:", v7);

      v67 = CFSTR("background-image::toggle");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v67, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v8, CFSTR("background-image"));

      if (-[SFStartPageCustomizationViewController showsBackgroundImagesCell](self, "showsBackgroundImagesCell"))
      {
        v66 = CFSTR("background-image::grid");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v66, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v9, CFSTR("background-image"));

      }
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_rootCollectionViewDataSource, "applySnapshot:animatingDifferences:", v51, v50);
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      -[UICollectionView indexPathsForVisibleItems](self->_rootCollectionView, "indexPathsForVisibleItems");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v61;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v61 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v12);
            -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_rootCollectionViewDataSource, "sectionIdentifierForIndex:", objc_msgSend(v13, "section"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_rootCollectionViewDataSource, "itemIdentifierForIndexPath:", v13);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqualToString:", CFSTR("customization-sync::toggle")))
            {
              -[UICollectionView cellForItemAtIndexPath:](self->_rootCollectionView, "cellForItemAtIndexPath:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setOn:", objc_msgSend(WeakRetained, "isCloudSyncEnabledForStartPageCustomizationViewController:", self));
LABEL_21:

              goto LABEL_22;
            }
            if (objc_msgSend(v14, "isEqual:", CFSTR("fixed-customization-items")))
            {
              -[UICollectionView cellForItemAtIndexPath:](self->_rootCollectionView, "cellForItemAtIndexPath:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setOn:", objc_msgSend(v17, "isEnabled"));
LABEL_20:

              goto LABEL_21;
            }
            if (objc_msgSend(v14, "isEqual:", CFSTR("customization-items")))
            {
              -[UICollectionView cellForItemAtIndexPath:](self->_rootCollectionView, "cellForItemAtIndexPath:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v53, "objectAtIndexedSubscript:", objc_msgSend(v13, "row"));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setOn:", objc_msgSend(v17, "isEnabled"));
              goto LABEL_20;
            }
            if (objc_msgSend(v15, "isEqual:", CFSTR("background-image::toggle")))
            {
              -[UICollectionView cellForItemAtIndexPath:](self->_rootCollectionView, "cellForItemAtIndexPath:", v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "setOn:", -[SFStartPageCustomizationViewController showsBackgroundImagesCell](self, "showsBackgroundImagesCell"));
              goto LABEL_21;
            }
LABEL_22:

            ++v12;
          }
          while (v10 != v12);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
          v10 = v18;
        }
        while (v18);
      }

    }
    if (self->_backgroundImagesCollectionViewDataSource)
    {
      obja = objc_alloc_init(MEMORY[0x1E0DC3398]);
      v64 = CFSTR("background-image");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obja, "appendSectionsWithIdentifiers:", v19);

      objc_msgSend(WeakRetained, "backgroundImageForStartPageCustomizationViewController:", self);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      backgroundImagesDataSource = self->_backgroundImagesDataSource;
      v56 = v20;
      objc_msgSend(v20, "suggestedName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[WBSStartPageBackgroundImagesDataSource indexOfBackgroundImageWithName:](backgroundImagesDataSource, "indexOfBackgroundImageWithName:", v22);

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      locationa = (id *)objc_loadWeakRetained(location);
      objc_msgSend(locationa, "profileProviderForCustomizationViewController:", self);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "hasMultipleProfiles"))
      {
        hasGeneratedBackgroundImage = self->_hasGeneratedBackgroundImage;
        v26 = self->_hasGeneratedBackgroundImage;
        if (!self->_generatedBackgroundImageItemProvider)
          -[SFStartPageCustomizationViewController _createGeneratedBackgroundImageItemProvider](self, "_createGeneratedBackgroundImageItemProvider");
        v27 = [SFStartPageBackgroundImageModel alloc];
        generatedBackgroundImageItemProvider = self->_generatedBackgroundImageItemProvider;
        objc_msgSend(v52, "activeProfile");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "symbolImageName");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "activeProfile");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "identifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = -[SFStartPageBackgroundImageModel initWithItemProvider:symbolName:profileIdentifier:selected:](v27, "initWithItemProvider:symbolName:profileIdentifier:selected:", generatedBackgroundImageItemProvider, v46, v30, hasGeneratedBackgroundImage);

      }
      else
      {
        v26 = 0;
        v54 = 0;
      }
      if (!v26 && v56 && v23 == 0x7FFFFFFFFFFFFFFFLL)
        v31 = -[SFStartPageBackgroundImageModel initWithItemProvider:]([SFStartPageBackgroundImageModel alloc], "initWithItemProvider:", v56);
      else
        v31 = -[SFStartPageBackgroundImageModel initWithItemProvider:]([SFStartPageBackgroundImageModel alloc], "initWithItemProvider:", 0);
      v32 = v31;
      objc_msgSend(v24, "addObject:", v31);
      if (v54)
        objc_msgSend(v24, "addObject:", v54);
      v47 = v32;
      v33 = -[WBSStartPageBackgroundImagesDataSource itemCount](self->_backgroundImagesDataSource, "itemCount");
      if (v33 >= 1)
      {
        for (i = 0; i != v33; ++i)
        {
          v35 = -[SFStartPageBackgroundImageModel initWithIndex:inDataSource:selected:]([SFStartPageBackgroundImageModel alloc], "initWithIndex:inDataSource:selected:", i, self->_backgroundImagesDataSource, v23 == i);
          objc_msgSend(v24, "addObject:", v35);

        }
      }
      v36 = -[NSArray count](self->_mobileAssetFileNames, "count");
      mobileAssetFileNames = self->_mobileAssetFileNames;
      objc_msgSend(v56, "suggestedName");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = -[NSArray indexOfObject:](mobileAssetFileNames, "indexOfObject:", v38);

      if (v36 >= 1)
      {
        for (j = 0; j != v36; ++j)
        {
          v41 = [SFStartPageBackgroundImageModel alloc];
          -[NSMutableArray objectAtIndexedSubscript:](self->_mobileAssetItemProviders, "objectAtIndexedSubscript:", j);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndexedSubscript:](self->_mobileAssetFileNames, "objectAtIndexedSubscript:", j);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v44 = -[SFStartPageBackgroundImageModel initWithItemProvider:fileName:selected:](v41, "initWithItemProvider:fileName:selected:", v42, v43, v39 == j);

          objc_msgSend(v24, "addObject:", v44);
        }
      }
      objc_msgSend(obja, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v24, CFSTR("background-image"));
      -[UICollectionViewDiffableDataSource applySnapshot:animatingDifferences:](self->_backgroundImagesCollectionViewDataSource, "applySnapshot:animatingDifferences:", obja, v50);

    }
  }
}

- (void)setUpRootCollectionViewDataSource
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  UICollectionViewDiffableDataSource *v11;
  UICollectionViewDiffableDataSource *rootCollectionViewDataSource;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id location[2];

  -[SFStartPageCustomizationViewController makeCustomizationSyncToggleRegistration](self, "makeCustomizationSyncToggleRegistration");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeCustomizationSyncFooterRegistration](self, "makeCustomizationSyncFooterRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeFixedCustomizationItemRegistration](self, "makeFixedCustomizationItemRegistration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeCustomizationItemRegistration](self, "makeCustomizationItemRegistration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeBackgroundImageToggleRegistration](self, "makeBackgroundImageToggleRegistration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeSuggestionDataSourcesToggleRegistration](self, "makeSuggestionDataSourcesToggleRegistration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFStartPageCustomizationViewController makeSuggestionsDataSourcesHeaderRegistration](self, "makeSuggestionsDataSourcesHeaderRegistration", v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke;
  aBlock[3] = &unk_1E21E6C90;
  objc_copyWeak(&v32, location);
  v6 = v19;
  v27 = v6;
  v20 = v17;
  v28 = v20;
  v7 = v18;
  v29 = v7;
  v8 = v16;
  v30 = v8;
  v9 = v4;
  v31 = v9;
  v10 = _Block_copy(aBlock);
  v11 = (UICollectionViewDiffableDataSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", self->_rootCollectionView, v10);
  rootCollectionViewDataSource = self->_rootCollectionViewDataSource;
  self->_rootCollectionViewDataSource = v11;

  -[SFStartPageCustomizationViewController makeReorderingHandlers](self, "makeReorderingHandlers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource setReorderingHandlers:](self->_rootCollectionViewDataSource, "setReorderingHandlers:", v13);

  v22[0] = v5;
  v22[1] = 3221225472;
  v22[2] = __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke_2;
  v22[3] = &unk_1E21E6CB8;
  objc_copyWeak(&v25, location);
  v14 = v3;
  v23 = v14;
  v15 = v21;
  v24 = v15;
  -[UICollectionViewDiffableDataSource setSupplementaryViewProvider:](self->_rootCollectionViewDataSource, "setSupplementaryViewProvider:", v22);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v32);
  objc_destroyWeak(location);

}

id __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id *WeakRetained;
  id *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[131], "sectionIdentifierForIndex:", objc_msgSend(v8, "section"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", CFSTR("customization-sync"))
      && objc_msgSend(v9, "isEqualToString:", CFSTR("customization-sync::toggle")))
    {
      v13 = *(_QWORD *)(a1 + 32);
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v15 = objc_loadWeakRetained(v11 + 138);
      objc_msgSend(v14, "numberWithBool:", objc_msgSend(v15, "isCloudSyncEnabledForStartPageCustomizationViewController:", v11));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v13, v8, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_18:
      goto LABEL_19;
    }
    if (objc_msgSend(v12, "isEqual:", CFSTR("customization-items")))
    {
      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v11[126], "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v18, v8, v15);
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v12, "isEqual:", CFSTR("fixed-customization-items")))
      {
        if (objc_msgSend(v12, "isEqual:", CFSTR("background-image")))
        {
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("background-image::toggle")))
          {
            v21 = *(_QWORD *)(a1 + 56);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v11, "showsBackgroundImagesCell"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v21, v8, v15);
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_17;
          }
          if (objc_msgSend(v9, "isEqualToString:", CFSTR("background-image::grid")))
          {
            objc_msgSend(v7, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("background-images-grid"), v8);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setCollectionView:", v11[122]);
LABEL_19:

            goto LABEL_20;
          }
        }
        if (!objc_msgSend(v12, "isEqual:", CFSTR("suggestions-data")))
        {
          v17 = 0;
          goto LABEL_19;
        }
        v22 = *(_QWORD *)(a1 + 64);
        objc_msgSend(v11[128], "objectForKeyedSubscript:", v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v22, v8, v15);
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      v20 = *(_QWORD *)(a1 + 48);
      objc_msgSend(v11[127], "objectForKeyedSubscript:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", v20, v8, v15);
      v19 = objc_claimAutoreleasedReturnValue();
    }
LABEL_17:
    v17 = (void *)v19;
    goto LABEL_18;
  }
  v17 = 0;
LABEL_20:

  return v17;
}

id __75__SFStartPageCustomizationViewController_setUpRootCollectionViewDataSource__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *WeakRetained;
  id *v9;
  void *v10;
  int v11;
  _QWORD *v12;
  void *v13;
  int v14;
  void *v15;

  v6 = a2;
  v7 = a4;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v9 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_7;
  objc_msgSend(WeakRetained[131], "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("customization-sync"));

  if (!v11)
  {
    objc_msgSend(v9[131], "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", CFSTR("suggestions-data"));

    if (v14)
    {
      v12 = (_QWORD *)(a1 + 40);
      goto LABEL_6;
    }
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v12 = (_QWORD *)(a1 + 32);
LABEL_6:
  objc_msgSend(v6, "dequeueConfiguredReusableSupplementaryViewWithRegistration:forIndexPath:", *v12, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v15;
}

- (void)setUpBackgroundImagesCollectionViewDataSource
{
  void *v3;
  id v4;
  void *v5;
  UICollectionViewDiffableDataSource *v6;
  UICollectionViewDiffableDataSource *backgroundImagesCollectionViewDataSource;
  _QWORD aBlock[4];
  id v9;

  -[SFStartPageCustomizationViewController makeBackgroundImageRegistration](self, "makeBackgroundImageRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __87__SFStartPageCustomizationViewController_setUpBackgroundImagesCollectionViewDataSource__block_invoke;
  aBlock[3] = &unk_1E21E6CE0;
  v4 = v3;
  v9 = v4;
  v5 = _Block_copy(aBlock);
  v6 = (UICollectionViewDiffableDataSource *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35E8]), "initWithCollectionView:cellProvider:", self->_backgroundImagesCollectionView, v5);
  backgroundImagesCollectionViewDataSource = self->_backgroundImagesCollectionViewDataSource;
  self->_backgroundImagesCollectionViewDataSource = v6;

}

id __87__SFStartPageCustomizationViewController_setUpBackgroundImagesCollectionViewDataSource__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_msgSend(a2, "dequeueConfiguredReusableCellWithRegistration:forIndexPath:item:", *(_QWORD *)(a1 + 32), a3, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)makeReorderingHandlers
{
  id v2;
  uint64_t v3;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  objc_initWeak(&location, self);
  v2 = objc_alloc_init(MEMORY[0x1E0DC35F0]);
  v3 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke;
  v7[3] = &unk_1E21E6D08;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v2, "setCanReorderItemHandler:", v7);
  v5[0] = v3;
  v5[1] = 3221225472;
  v5[2] = __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke_2;
  v5[3] = &unk_1E21E6D30;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v2, "setDidReorderHandler:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v2;
}

uint64_t __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = (void *)*((_QWORD *)WeakRetained + 131);
    objc_msgSend(v6, "indexPathForItemIdentifier:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sectionIdentifierForIndex:", objc_msgSend(v7, "section"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqual:", CFSTR("customization-items"));

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __64__SFStartPageCustomizationViewController_makeReorderingHandlers__block_invoke_2(uint64_t a1, void *a2)
{
  id *WeakRetained;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v7, "finalSnapshot");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "itemIdentifiersInSectionWithIdentifier:", CFSTR("customization-items"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(WeakRetained, "didChangeCustomizationItemOrder:forVariant:", v5, 0);
    v6 = objc_loadWeakRetained(WeakRetained + 138);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v6, "didReorderSectionIdentifiersForStartPageCustomizationViewController:", WeakRetained);

  }
}

- (id)makeRootCollectionViewLayout
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__SFStartPageCustomizationViewController_makeRootCollectionViewLayout__block_invoke;
  v5[3] = &unk_1E21E6D58;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithSectionProvider:", v5);
}

id __70__SFStartPageCustomizationViewController_makeRootCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  int v17;
  double v18;

  v5 = a3;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC35A8]), "initWithAppearance:", 2);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "sectionIdentifierForIndex:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqual:", CFSTR("background-image")))
  {
    objc_msgSend(v6, "separatorConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTopSeparatorVisibility:", 2);
    objc_msgSend(v8, "setBottomSeparatorVisibility:", 2);
    objc_msgSend(v6, "setSeparatorConfiguration:", v8);

  }
  if (objc_msgSend(v7, "isEqual:", CFSTR("customization-sync")))
    objc_msgSend(v6, "setFooterMode:", 1);
  if (objc_msgSend(v7, "isEqual:", CFSTR("suggestions-data")))
    objc_msgSend(v6, "setHeaderMode:", 1);
  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithListConfiguration:layoutEnvironment:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contentInsets");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  if (a2 < 1)
  {
    v16 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "sectionIdentifierForIndex:", a2 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17 = objc_msgSend(v16, "isEqual:", CFSTR("customization-sync"));
  v18 = 0.0;
  if (v17)
    v18 = 8.0;
  objc_msgSend(v9, "setContentInsets:", v18, v11, v13, v15);

  return v9;
}

- (id)makeBackgroundImagesCollectionViewLayout
{
  id v3;
  _QWORD v5[5];

  v3 = objc_alloc(MEMORY[0x1E0DC35D0]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__SFStartPageCustomizationViewController_makeBackgroundImagesCollectionViewLayout__block_invoke;
  v5[3] = &unk_1E21E6D58;
  v5[4] = self;
  return (id)objc_msgSend(v3, "initWithSectionProvider:", v5);
}

id __82__SFStartPageCustomizationViewController_makeBackgroundImagesCollectionViewLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unint64_t v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
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
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "preferredBackgroundImagesCollectionViewColumnCount");
  if (v5)
  {
    v6 = (double)v5;
  }
  else
  {
    objc_msgSend(v4, "container");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "effectiveContentSize");
    if (v8 < 430.0)
      v6 = 3.0;
    else
      v6 = 5.0;

  }
  objc_msgSend(v4, "container");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "effectiveContentSize");
  v11 = (v10 + -32.0 + (v6 + -1.0) * -8.0) / v6;

  objc_msgSend(MEMORY[0x1E0DC3340], "absoluteDimension:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3370], "sizeWithWidthDimension:heightDimension:", v12, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3360], "itemWithLayoutSize:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0DC3370];
  objc_msgSend(MEMORY[0x1E0DC3340], "fractionalWidthDimension:", 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3340], "estimatedDimension:", 100.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sizeWithWidthDimension:heightDimension:", v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)MEMORY[0x1E0DC3350];
  v25[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "horizontalGroupWithLayoutSize:subitems:", v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3378], "flexibleSpacing:", 8.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setInterItemSpacing:", v22);

  objc_msgSend(MEMORY[0x1E0DC3368], "sectionWithGroup:", v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setContentInsets:", 1.0, 16.0, 15.0, 16.0);
  objc_msgSend(v23, "setInterGroupSpacing:", 8.0);

  return v23;
}

- (id)makeCustomizationItemRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __75__SFStartPageCustomizationViewController_makeCustomizationItemRegistration__block_invoke;
  v8 = &unk_1E21E6D80;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __75__SFStartPageCustomizationViewController_makeCustomizationItemRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
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
  id v21;
  void *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "setOn:", objc_msgSend(v7, "isEnabled"));
    objc_msgSend(v6, "setDelegate:", WeakRetained);
    objc_msgSend(v6, "defaultContentConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v7, "title");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    sectionTextAttributes();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v10, "initWithString:attributes:", v11, v12);
    objc_msgSend(v9, "setAttributedText:", v13);

    objc_msgSend(v7, "icon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v14);

    objc_msgSend(v9, "textProperties");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "color");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setTintColor:", v16);

    objc_msgSend(v6, "setContentConfiguration:", v9);
    v18 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", CFSTR("%@MenuRow"), v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", v20);

    v21 = objc_alloc_init(MEMORY[0x1E0DC3598]);
    objc_msgSend(v21, "setDisplayedState:", 0);
    objc_msgSend(v21, "setShowsVerticalSeparator:", 0);
    v23[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessories:", v22);

  }
}

- (id)makeBackgroundImageToggleRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __79__SFStartPageCustomizationViewController_makeBackgroundImageToggleRegistration__block_invoke;
  v8 = &unk_1E21E6DA8;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __79__SFStartPageCustomizationViewController_makeBackgroundImageToggleRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v14, "setOn:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v14, "setDelegate:", WeakRetained);
    objc_msgSend(v14, "defaultContentConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("photo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v10);

    objc_msgSend(v8, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v12);

    objc_msgSend(v14, "setContentConfiguration:", v8);
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("backgroundImageItemIdentifierMenuRow"));

  }
}

- (id)makeSuggestionDataSourcesToggleRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __85__SFStartPageCustomizationViewController_makeSuggestionDataSourcesToggleRegistration__block_invoke;
  v8 = &unk_1E21E6D80;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __85__SFStartPageCustomizationViewController_makeSuggestionDataSourcesToggleRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
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
  id v20;

  v20 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v20, "setOn:", objc_msgSend(v6, "isEnabled"));
    objc_msgSend(v20, "setDelegate:", WeakRetained);
    objc_msgSend(v20, "defaultContentConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(v6, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    sectionTextAttributes();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "initWithString:attributes:", v10, v11);
    objc_msgSend(v8, "setAttributedText:", v12);

    objc_msgSend(v6, "icon");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v13);

    objc_msgSend(v8, "textProperties");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "color");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageProperties");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTintColor:", v15);

    objc_msgSend(v20, "setContentConfiguration:", v8);
    v17 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "identifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringWithFormat:", CFSTR("%@MenuRow"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAccessibilityIdentifier:", v19);

  }
}

- (id)makeSuggestionsDataSourcesHeaderRegistration
{
  objc_msgSend(MEMORY[0x1E0DC3640], "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), *MEMORY[0x1E0DC48A8], &__block_literal_global_57);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __86__SFStartPageCustomizationViewController_makeSuggestionsDataSourcesHeaderRegistration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(MEMORY[0x1E0DC39A8], "headerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

  objc_msgSend(v4, "setContentConfiguration:", v2);
}

- (id)makeBackgroundImageRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke;
  v8 = &unk_1E21E6E38;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  id *v8;
  id *WeakRetained;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, int);
  void *v19;
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v6 = a2;
  v7 = a4;
  v8 = (id *)(a1 + 32);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v6, "setShowsSelectionRing:", objc_msgSend(v7, "isSelected"));
    objc_msgSend(v6, "setShowsCustomImageControls:", objc_msgSend(v7, "isCustomImage"));
    objc_msgSend(v6, "setDelegate:", WeakRetained);
    objc_msgSend(v7, "mobileAssetFileName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v7, "mobileAssetFileName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMobileAssetFileName:", v11);

      v12 = objc_loadWeakRetained(WeakRetained + 138);
      objc_msgSend(v12, "backgroundImageAssetControllerForCustomizationViewController:", WeakRetained);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "mobileAssetFileName");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDownloadState:", objc_msgSend(v13, "downloadStateForFileName:", v14));

    }
    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke_2;
    v19 = &unk_1E21E6E10;
    objc_copyWeak(&v23, v8);
    v15 = v6;
    v20 = v15;
    v22 = &v24;
    v21 = v7;
    objc_msgSend(v21, "getThumbnailImageWithCompletionHandler:", &v16);
    if (!*((_BYTE *)v25 + 24))
      objc_msgSend(v15, "setImage:", 0, v16, v17, v18, v19, v20);

    objc_destroyWeak(&v23);
    _Block_object_dispose(&v24, 8);
  }

}

void __73__SFStartPageCustomizationViewController_makeBackgroundImageRegistration__block_invoke_2(uint64_t a1, void *a2, int a3)
{
  id *WeakRetained;
  id *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "setImage:", v9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      objc_msgSend(WeakRetained[123], "indexPathForItemIdentifier:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_msgSend(v6[122], "cellForItemAtIndexPath:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setImage:", v9);

      }
    }
  }

}

- (id)makeCustomizationSyncToggleRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __81__SFStartPageCustomizationViewController_makeCustomizationSyncToggleRegistration__block_invoke;
  v8 = &unk_1E21E6DA8;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __81__SFStartPageCustomizationViewController_makeCustomizationSyncToggleRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v10, "setOn:", objc_msgSend(v6, "BOOLValue"));
    objc_msgSend(v10, "setDelegate:", WeakRetained);
    objc_msgSend(v10, "defaultContentConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    objc_msgSend(v10, "setContentConfiguration:", v8);
  }

}

- (id)makeCustomizationSyncFooterRegistration
{
  objc_msgSend(MEMORY[0x1E0DC3640], "registrationWithSupplementaryClass:elementKind:configurationHandler:", objc_opt_class(), *MEMORY[0x1E0DC48A0], &__block_literal_global_116);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __81__SFStartPageCustomizationViewController_makeCustomizationSyncFooterRegistration__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "defaultContentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v3);

  objc_msgSend(v4, "setContentConfiguration:", v2);
}

- (id)makeFixedCustomizationItemRegistration
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, void *, uint64_t, void *);
  void *v8;
  id v9;
  id location;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v6 = 3221225472;
  v7 = __80__SFStartPageCustomizationViewController_makeFixedCustomizationItemRegistration__block_invoke;
  v8 = &unk_1E21E6D80;
  objc_copyWeak(&v9, &location);
  v2 = _Block_copy(&v5);
  objc_msgSend(MEMORY[0x1E0DC35C8], "registrationWithCellClass:configurationHandler:", objc_opt_class(), v2, v5, v6, v7, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
  return v3;
}

void __80__SFStartPageCustomizationViewController_makeFixedCustomizationItemRegistration__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a2;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v14, "setOn:", objc_msgSend(v6, "isEnabled"));
    objc_msgSend(v14, "setDelegate:", WeakRetained);
    objc_msgSend(v14, "defaultContentConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "title");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);

    objc_msgSend(v6, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v10);

    objc_msgSend(v8, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "color");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "imageProperties");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTintColor:", v12);

    objc_msgSend(v14, "setContentConfiguration:", v8);
  }

}

- (void)backgroundImageCellDidSelectClearButton:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "startPageCustomizationViewController:didSelectCustomBackgroundImage:", self, 0);

  -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
}

- (void)startPageCustomizationCellDidChangeValue:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  id v9;

  v9 = a3;
  -[UICollectionView indexPathForCell:](self->_rootCollectionView, "indexPathForCell:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UICollectionViewDiffableDataSource sectionIdentifierForIndex:](self->_rootCollectionViewDataSource, "sectionIdentifierForIndex:", objc_msgSend(v4, "section"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqual:", CFSTR("customization-sync")))
  {
    -[SFStartPageCustomizationViewController _setCustomizationSyncWithValue:](self, "_setCustomizationSyncWithValue:", v9);
  }
  else if ((objc_msgSend(v5, "isEqual:", CFSTR("fixed-customization-items")) & 1) != 0
         || (objc_msgSend(v5, "isEqual:", CFSTR("customization-items")) & 1) != 0
         || objc_msgSend(v5, "isEqual:", CFSTR("suggestions-data")))
  {
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_rootCollectionViewDataSource, "itemIdentifierForIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[SFStartPageCustomizationViewController setCustomizationItemIdentifier:inSection:enabled:](self, "setCustomizationItemIdentifier:inSection:enabled:", v6, v5, objc_msgSend(v9, "isOn"));
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0D8A698]))
        -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
    }

  }
  else if (objc_msgSend(v5, "isEqual:", CFSTR("background-image")))
  {
    v7 = objc_msgSend(v9, "isOn");
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "startPageCustomizationViewController:didModifyBackgroundImageEnabled:", self, v7);

    self->_backgroundSectionUnconditionallyVisible = v7;
    -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
  }

}

- (void)_setCustomizationSyncWithValue:(id)a3
{
  id v4;
  void *WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[5];
  _QWORD v21[5];

  v4 = a3;
  if ((objc_msgSend(v4, "isOn") & 1) != 0)
  {
    _WBSLocalizedString();
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", WeakRetained, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke;
    v21[3] = &unk_1E21E6750;
    v21[4] = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 0, v21);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v11);

    objc_msgSend(MEMORY[0x1E0D89BD0], "currentDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "deviceClass");

    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v10;
    v20[1] = 3221225472;
    v20[2] = __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_2;
    v20[3] = &unk_1E21E6750;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v13, 0, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v14);

    v15 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_3;
    v18[3] = &unk_1E21E6750;
    v19 = v4;
    objc_msgSend(v15, "actionWithTitle:style:handler:", v16, 1, v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAction:", v17);

    -[SFStartPageCustomizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(WeakRetained, "startPageCustomizationViewControllerDidDisableCloudSync:", self);
  }

}

void __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1104));
  objc_msgSend(WeakRetained, "startPageCustomizationViewControllerDidEnableCloudSync:withPreference:", *(_QWORD *)(a1 + 32), 0);

}

void __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1104));
  objc_msgSend(WeakRetained, "startPageCustomizationViewControllerDidEnableCloudSync:withPreference:", *(_QWORD *)(a1 + 32), 1);

}

uint64_t __73__SFStartPageCustomizationViewController__setCustomizationSyncWithValue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setOn:", 0);
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return self->_backgroundImagesCollectionView == a3;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  UICollectionView *v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSMutableArray *mobileAssetItemProviders;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  SFStartPageCustomizationViewController *v32;
  id v33;
  id v34;

  v6 = (UICollectionView *)a3;
  v7 = a4;
  if (self->_rootCollectionView != v6)
  {
    -[UICollectionView deselectItemAtIndexPath:animated:](v6, "deselectItemAtIndexPath:animated:", v7, 1);
    -[UICollectionViewDiffableDataSource itemIdentifierForIndexPath:](self->_backgroundImagesCollectionViewDataSource, "itemIdentifierForIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_hasGeneratedBackgroundImage = 0;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v8, "imageDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "url");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "luminance");
      objc_msgSend(WeakRetained, "startPageCustomizationViewController:didSelectBuiltInBackgroundImageAtURL:precomputedLuminance:", self, v12);

      -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
    }
    else
    {
      objc_msgSend(v8, "profileIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v27 = WeakRetained;
        objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "profileProviderForCustomizationViewController:", self);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "activeProfile");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "symbolImageName");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "color");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
        v30[3] = &unk_1E21E6F38;
        v18 = v14;
        v31 = v18;
        v32 = self;
        v19 = v25;
        v33 = v19;
        v20 = v26;
        v34 = v20;
        objc_msgSend(v18, "generateProfileSpecificBackgroundImageWithSymbol:forProfile:withColor:completionHandler:", v16, v19, v17, v30);

        WeakRetained = v27;
      }
      else
      {
        objc_msgSend(v8, "mobileAssetFileName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          mobileAssetItemProviders = self->_mobileAssetItemProviders;
          v28[0] = MEMORY[0x1E0C809B0];
          v28[1] = 3221225472;
          v28[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_6;
          v28[3] = &unk_1E21E6F60;
          v29 = v8;
          -[NSMutableArray objectAtIndexedSubscript:](self->_mobileAssetItemProviders, "objectAtIndexedSubscript:", -[NSMutableArray indexOfObjectPassingTest:](mobileAssetItemProviders, "indexOfObjectPassingTest:", v28));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "startPageCustomizationViewController:didSelectMobileAssetBackgroundImageWithProvider:", self, v23);

          -[UICollectionView cellForItemAtIndexPath:](v6, "cellForItemAtIndexPath:", v7);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFStartPageCustomizationViewController _didSelectMobileAssetBackgroundImageCell:](self, "_didSelectMobileAssetBackgroundImageCell:", v24);

        }
        else
        {
          -[SFStartPageCustomizationViewController showPhotoPicker](self, "showPhotoPicker");
        }
      }
    }

  }
}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  id v8;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
  v5[3] = &unk_1E21E6F10;
  v4 = *(void **)(a1 + 32);
  v5[4] = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 32);
  objc_msgSend(v4, "cacheImageFromURL:completion:", a2, v5);

}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD block[5];
  id v6;
  id v7;
  id v8;
  id v9;

  v3 = a2;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3;
    block[3] = &unk_1E21E6EE8;
    v4 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v6 = v4;
    v7 = *(id *)(a1 + 48);
    v8 = *(id *)(a1 + 56);
    v9 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundImageIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "activeTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isNamed") ^ 1;

  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4;
  v6[3] = &unk_1E21E6EC0;
  v5 = *(void **)(a1 + 56);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 64);
  objc_msgSend(v5, "processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:", v2, 1, v3, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  id v2;
  _BYTE *WeakRetained;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_136, 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    WeakRetained[1064] = 1;
    objc_msgSend(WeakRetained, "_updateGeneratedBackgroundImageItemProviderWithImage:", *(_QWORD *)(a1 + 48));
    objc_msgSend(WeakRetained, "reloadDataAnimatingDifferences:", 0);
  }

}

uint64_t __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markBackgroundImageAsModified");
}

uint64_t __82__SFStartPageCustomizationViewController_collectionView_didSelectItemAtIndexPath___block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "suggestedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "mobileAssetFileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)collectionView:(id)a3 targetIndexPathForMoveOfItemFromOriginalIndexPath:(id)a4 atCurrentIndexPath:(id)a5 toProposedIndexPath:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = -[UICollectionViewDiffableDataSource indexForSectionIdentifier:](self->_rootCollectionViewDataSource, "indexForSectionIdentifier:", CFSTR("customization-items"));
  if (objc_msgSend(v11, "section") == v12)
  {
    v13 = v11;
  }
  else
  {
    if (objc_msgSend(v11, "section") <= v12)
      v14 = 0;
    else
      v14 = objc_msgSend(v9, "numberOfItemsInSection:", objc_msgSend(v10, "section")) - 1;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v14, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;

  return v15;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);
  if (objc_msgSend(v6, "count"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "startPageCustomizationViewController:didSelectCustomBackgroundImage:", self, v9);

    -[SFStartPageCustomizationViewController reloadDataAnimatingDifferences:](self, "reloadDataAnimatingDifferences:", 1);
  }

}

- (void)showPhotoPicker
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v3 = (void *)getPHPickerConfigurationClass(void)::softClass;
  v20 = getPHPickerConfigurationClass(void)::softClass;
  if (!getPHPickerConfigurationClass(void)::softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = ___ZL29getPHPickerConfigurationClassv_block_invoke;
    v15 = &unk_1E21E32A8;
    v16 = &v17;
    ___ZL29getPHPickerConfigurationClassv_block_invoke((uint64_t)&v12);
    v3 = (void *)v18[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v17, 8);
  v5 = (void *)objc_msgSend([v4 alloc], "init");
  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v6 = (void *)getPHPickerFilterClass(void)::softClass;
  v20 = getPHPickerFilterClass(void)::softClass;
  if (!getPHPickerFilterClass(void)::softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = ___ZL22getPHPickerFilterClassv_block_invoke;
    v15 = &unk_1E21E32A8;
    v16 = &v17;
    ___ZL22getPHPickerFilterClassv_block_invoke((uint64_t)&v12);
    v6 = (void *)v18[3];
  }
  v7 = objc_retainAutorelease(v6);
  _Block_object_dispose(&v17, 8);
  objc_msgSend(v7, "imagesFilter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFilter:", v8);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v9 = (void *)getPHPickerViewControllerClass(void)::softClass;
  v20 = getPHPickerViewControllerClass(void)::softClass;
  if (!getPHPickerViewControllerClass(void)::softClass)
  {
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = ___ZL30getPHPickerViewControllerClassv_block_invoke;
    v15 = &unk_1E21E32A8;
    v16 = &v17;
    ___ZL30getPHPickerViewControllerClassv_block_invoke((uint64_t)&v12);
    v9 = (void *)v18[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v17, 8);
  v11 = (void *)objc_msgSend([v10 alloc], "initWithConfiguration:", v5);
  objc_msgSend(v11, "setDelegate:", self);
  -[SFStartPageCustomizationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)_didSelectMobileAssetBackgroundImageCell:(id)a3
{
  id v4;
  id WeakRetained;
  NSString *v6;
  NSString *lastSelectedMobileAssetFileName;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SFStartPageCustomizationViewController *v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(v4, "mobileAssetFileName");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  lastSelectedMobileAssetFileName = self->_lastSelectedMobileAssetFileName;
  self->_lastSelectedMobileAssetFileName = v6;

  objc_msgSend(WeakRetained, "backgroundImageAssetControllerForCustomizationViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mobileAssetFileName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "downloadStateForFileName:", v9);

  if (v10 != 1)
  {
    if (v10 == 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safari_startPageBackgroundImageMobileAssetFolderURL");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mobileAssetFileName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFStartPageCustomizationViewController _updateImageWithURL:](self, "_updateImageWithURL:", v14);
    }
    else
    {
      objc_msgSend(v4, "setDownloadState:", 1);
      objc_msgSend(WeakRetained, "backgroundImageAssetControllerForCustomizationViewController:", self);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "mobileAssetFileName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke;
      v17[3] = &unk_1E21E6FB0;
      v18 = v4;
      v19 = self;
      objc_msgSend(v15, "downloadMobileAssetBackgroundImage:completionHandler:", v16, v17);

    }
  }

}

void __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke_2;
  v11[3] = &unk_1E21E6F88;
  v12 = v5;
  v13 = v6;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v14 = v7;
  v15 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __83__SFStartPageCustomizationViewController__didSelectMobileAssetBackgroundImageCell___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = *(void **)(a1 + 32);
  if (v2 && !*(_QWORD *)(a1 + 40))
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 56) + 1088);
    objc_msgSend(v2, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v3) = objc_msgSend(v3, "isEqualToString:", v4);

    if ((_DWORD)v3)
      objc_msgSend(*(id *)(a1 + 56), "_updateImageWithURL:", *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "setDownloadState:", 3);
  }
}

- (void)_updateImageWithURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "profileProviderForCustomizationViewController:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activeProfile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke;
  v12[3] = &unk_1E21E6FF8;
  v12[4] = self;
  v10 = v8;
  v13 = v10;
  v11 = v6;
  v14 = v11;
  objc_msgSend(v9, "cacheImageFromURL:completion:", v4, v12);

}

void __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  _QWORD block[5];
  id v5;
  id v6;

  if (a2)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_2;
    block[3] = &unk_1E21E6AB0;
    v3 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

void __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_2(id *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  objc_msgSend(a1[4], "_backgroundImageIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[5], "isEqualToString:", *MEMORY[0x1E0D89E20]) & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(a1[6], "activeTabGroup");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isNamed") ^ 1;

  }
  objc_msgSend(MEMORY[0x1E0D8ACA0], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_3;
  v8[3] = &unk_1E21E6AB0;
  v9 = a1[6];
  v6 = a1[5];
  v7 = a1[4];
  v10 = v6;
  v11 = v7;
  objc_msgSend(v5, "processImageForIdentifier:isGeneratedImage:withinProfile:completionHandler:", v2, 0, v3, v8);

}

uint64_t __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "updateProfileWithIdentifier:persist:usingBlock:completionHandler:", *(_QWORD *)(a1 + 40), 1, &__block_literal_global_142, 0);
  return objc_msgSend(*(id *)(a1 + 48), "reloadDataAnimatingDifferences:", 0);
}

uint64_t __62__SFStartPageCustomizationViewController__updateImageWithURL___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "markBackgroundImageAsModified");
}

- (SFStartPageCustomizationDataSource)dataSource
{
  return (SFStartPageCustomizationDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (unint64_t)preferredBackgroundImagesCollectionViewColumnCount
{
  return self->_preferredBackgroundImagesCollectionViewColumnCount;
}

- (void)setPreferredBackgroundImagesCollectionViewColumnCount:(unint64_t)a3
{
  self->_preferredBackgroundImagesCollectionViewColumnCount = a3;
}

- (BOOL)showsCloseButton
{
  return self->_showsCloseButton;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_lastSelectedMobileAssetFileName, 0);
  objc_storeStrong((id *)&self->_mobileAssetItemProviders, 0);
  objc_storeStrong((id *)&self->_mobileAssetFileNames, 0);
  objc_storeStrong((id *)&self->_generatedBackgroundImageItemProvider, 0);
  objc_storeStrong((id *)&self->_rootCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_rootCollectionView, 0);
  objc_storeStrong((id *)&self->_identifierToSuggestionsDataSourceCustomizationItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToFixedCustomizationItemMap, 0);
  objc_storeStrong((id *)&self->_identifierToCustomizationItemMap, 0);
  objc_storeStrong((id *)&self->_backgroundImagesDataSource, 0);
  objc_storeStrong((id *)&self->_backgroundImagesCollectionViewDataSource, 0);
  objc_storeStrong((id *)&self->_backgroundImagesCollectionView, 0);
  objc_storeStrong((id *)&self->_backgroundImages, 0);
}

@end
