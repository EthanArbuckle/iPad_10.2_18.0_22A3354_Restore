@implementation MKPlaceCollectionViewModel

- (MKPlaceCollectionViewModel)initWithGEOPlaceCollection:(id)a3 usingSyncCoordinator:(id)a4 inContext:(int64_t)a5 usingTitleFont:(id)a6
{
  id v11;
  id v12;
  id v13;
  MKPlaceCollectionViewModel *v14;
  MKPlaceCollectionViewModel *v15;
  uint64_t v16;
  OS_dispatch_queue *imageLoadingQueue;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MKPlaceCollectionViewModel;
  v14 = -[MKPlaceCollectionViewModel init](&v23, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_placeCollection, a3);
    geo_dispatch_queue_create_with_qos();
    v16 = objc_claimAutoreleasedReturnValue();
    imageLoadingQueue = v15->_imageLoadingQueue;
    v15->_imageLoadingQueue = (OS_dispatch_queue *)v16;

    +[MKSystemController sharedInstance](MKSystemController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "screenScale");
    v15->_screenScale = v19;

    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "isEqualToString:", CFSTR("com.apple.Maps"));

    objc_storeStrong((id *)&v15->_syncCoordinator, a4);
    v15->_context = a5;
    if (v13)
    {
      v15->_isUsingInjectedFont = 1;
      objc_storeStrong((id *)&v15->_titleFont, a6);
    }
    else
    {
      -[MKPlaceCollectionViewModel initializeFonts](v15, "initializeFonts");
      v15->_isUsingInjectedFont = 0;
    }
  }

  return v15;
}

- (void)contentCategorySizeDidChange
{
  NSAttributedString *collectionTitle;
  NSAttributedString *collectionLongTitle;
  NSAttributedString *secondaryCollectionTitle;

  collectionTitle = self->_collectionTitle;
  self->_collectionTitle = 0;

  collectionLongTitle = self->_collectionLongTitle;
  self->_collectionLongTitle = 0;

  secondaryCollectionTitle = self->_secondaryCollectionTitle;
  self->_secondaryCollectionTitle = 0;

  if (!self->_isUsingInjectedFont)
    -[MKPlaceCollectionViewModel initializeFonts](self, "initializeFonts");
}

- (void)initializeFonts
{
  uint64_t v3;
  UIFont *v4;
  UIFont *titleFont;
  CGFloat v6;
  CTFontRef UIFontForLanguage;
  UIFont *CopyOfSystemUIFontWithGrade;
  UIFont *v9;
  UIFont *v10;

  v3 = *MEMORY[0x1E0CEB538];
  if (self->_context == 9)
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:weight:", v3, *MEMORY[0x1E0CEB5F8]);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    titleFont = self->_titleFont;
    self->_titleFont = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", v3, *MEMORY[0x1E0CEB3E0]);
    v10 = (UIFont *)objc_claimAutoreleasedReturnValue();
    -[UIFont pointSize](v10, "pointSize");
    UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuTitleFontType|0x60, v6, 0);
    CopyOfSystemUIFontWithGrade = (UIFont *)CTFontCreateCopyOfSystemUIFontWithGrade();
    CFRelease(UIFontForLanguage);
    v9 = self->_titleFont;
    self->_titleFont = CopyOfSystemUIFontWithGrade;

    titleFont = v10;
  }

}

- (UIColor)backgroundColor
{
  UIColor *backgroundColor;
  void *v4;
  UIColor *v5;
  UIColor *v6;

  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    +[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "joeColorForCuratedCollection:", self->_placeCollection);
    v5 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v6 = self->_backgroundColor;
    self->_backgroundColor = v5;

    backgroundColor = self->_backgroundColor;
  }
  return backgroundColor;
}

- (NSAttributedString)collectionTitle
{
  NSAttributedString *collectionTitle;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  UIFont *titleFont;
  void *v10;
  NSAttributedString *v11;
  NSAttributedString *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  collectionTitle = self->_collectionTitle;
  if (!collectionTitle)
  {
    -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      titleFont = self->_titleFont;
      v14 = *MEMORY[0x1E0CEA098];
      v15[0] = titleFont;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSAttributedString *)objc_msgSend(v6, "initWithString:attributes:", v8, v10);
      v12 = self->_collectionTitle;
      self->_collectionTitle = v11;

    }
    collectionTitle = self->_collectionTitle;
  }
  return collectionTitle;
}

- (NSAttributedString)collectionLongTitle
{
  NSAttributedString *collectionLongTitle;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  UIFont *titleFont;
  void *v10;
  NSAttributedString *v11;
  NSAttributedString *v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  collectionLongTitle = self->_collectionLongTitle;
  if (!collectionLongTitle)
  {
    -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionLongTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3498]);
      -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "collectionLongTitle");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      titleFont = self->_titleFont;
      v14 = *MEMORY[0x1E0CEA098];
      v15[0] = titleFont;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (NSAttributedString *)objc_msgSend(v6, "initWithString:attributes:", v8, v10);
      v12 = self->_collectionLongTitle;
      self->_collectionLongTitle = v11;

    }
    collectionLongTitle = self->_collectionLongTitle;
  }
  return collectionLongTitle;
}

- (NSAttributedString)secondaryCollectionTitle
{
  NSAttributedString *secondaryCollectionTitle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSAttributedString *v19;
  NSAttributedString *v20;
  NSAttributedString *v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  secondaryCollectionTitle = self->_secondaryCollectionTitle;
  if (secondaryCollectionTitle)
    return secondaryCollectionTitle;
  v5 = (void *)MEMORY[0x1E0CB3940];
  _MKLocalizedStringFromThisBundle(CFSTR("[Guides Home] Place Count In Collection List Cell"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringWithFormat:", v6, objc_msgSend(v7, "numberOfItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceLayoutDirection");

  v11 = (void *)MEMORY[0x1E0CB3940];
  -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherAttribution");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayName");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v10 == 1)
    objc_msgSend(v11, "localizedStringWithFormat:", CFSTR("%@ · %@"), v8, v14);
  else
    objc_msgSend(v11, "localizedStringWithFormat:", CFSTR("%@ · %@"), v14, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = *MEMORY[0x1E0CEA098];
  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB590]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (NSAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v16, v18);
  v20 = self->_secondaryCollectionTitle;
  self->_secondaryCollectionTitle = v19;

  v21 = self->_secondaryCollectionTitle;
  return v21;
}

- (BOOL)shouldDisplayMetadata
{
  return self->_context == 9;
}

- (BOOL)isSaved
{
  MKPlaceCollectionViewModel *v2;
  void *v3;

  v2 = self;
  -[MKPlaceCollectionViewModel syncCoordinator](self, "syncCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "collectionIsSaved:", v2->_placeCollection);

  return (char)v2;
}

- (void)_publisherImageWithIdentifier:(unsigned int)a3 completion:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD, _QWORD);
  unint64_t context;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *imageLoadingQueue;
  id v17;
  _QWORD block[4];
  id v19;
  MKPlaceCollectionViewModel *v20;
  void (**v21)(_QWORD, _QWORD);
  id v22;
  unsigned int v23;
  id location;
  _QWORD v25[4];
  id v26;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke;
  v25[3] = &unk_1E20DCDC0;
  v8 = v6;
  v26 = v8;
  v9 = MEMORY[0x18D778DB8](v25);
  v10 = (void (**)(_QWORD, _QWORD))v9;
  context = self->_context;
  if (context <= 9)
  {
    if (context == 2)
    {
      (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
    }
    else
    {
      -[MKPlaceCollectionViewModel publisherLogoImage](self, "publisherLogoImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        ((void (**)(_QWORD, void *))v10)[2](v10, v12);
      }
      else
      {
        -[MKPlaceCollectionViewModel placeCollection](self, "placeCollection");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "publisherAttribution");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayName");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_initWeak(&location, self);
        imageLoadingQueue = self->_imageLoadingQueue;
        block[0] = v7;
        block[1] = 3221225472;
        block[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_3;
        block[3] = &unk_1E20DCE10;
        v23 = a3;
        v19 = v15;
        v20 = self;
        v17 = v15;
        objc_copyWeak(&v22, &location);
        v21 = v10;
        dispatch_async(imageLoadingQueue, block);

        objc_destroyWeak(&v22);
        objc_destroyWeak(&location);
      }

    }
  }

}

void __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v3 = a2;
  if (*(_QWORD *)(a1 + 32))
  {
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    }
    else
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_2;
      v4[3] = &unk_1E20D7F70;
      v6 = *(id *)(a1 + 32);
      v5 = v3;
      dispatch_async(MEMORY[0x1E0C80D38], v4);

    }
  }

}

uint64_t __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  _QWORD v6[4];
  id v7;
  id v8;

  +[MKPlaceCollectionsPublisherIconManager sharedInstance](MKPlaceCollectionsPublisherIconManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(unsigned int *)(a1 + 64);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(double *)(*(_QWORD *)(a1 + 40) + 24);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_4;
  v6[3] = &unk_1E20DCDE8;
  objc_copyWeak(&v8, (id *)(a1 + 56));
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v2, "iconForPublisherNamed:usingId:contentScale:onCompletion:", v4, v3, v6, v5);

  objc_destroyWeak(&v8);
}

void __71__MKPlaceCollectionViewModel__publisherImageWithIdentifier_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setPublisherLogoImage:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)publisherIconImageWithCompletion:(id)a3
{
  id v4;
  NSObject *imageLoadingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  imageLoadingQueue = self->_imageLoadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MKPlaceCollectionViewModel_publisherIconImageWithCompletion___block_invoke;
  block[3] = &unk_1E20DCE38;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(imageLoadingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__MKPlaceCollectionViewModel_publisherIconImageWithCompletion___block_invoke(uint64_t a1)
{
  id *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id WeakRetained;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v2);
    objc_msgSend(v3, "placeCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "publisherAttribution");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "iconIdentifier");

    objc_msgSend(WeakRetained, "_publisherImageWithIdentifier:completion:", v6, *(_QWORD *)(a1 + 32));
  }

}

- (void)publisherLogoImageWithCompletion:(id)a3
{
  id v4;
  NSObject *imageLoadingQueue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  imageLoadingQueue = self->_imageLoadingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__MKPlaceCollectionViewModel_publisherLogoImageWithCompletion___block_invoke;
  block[3] = &unk_1E20DCE38;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(imageLoadingQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __63__MKPlaceCollectionViewModel_publisherLogoImageWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "placeCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "publisherAttribution");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v4, "logoWithoutPaddingIdentifier"))
      v5 = objc_msgSend(v4, "logoWithoutPaddingIdentifier");
    else
      v5 = objc_msgSend(v4, "logoIdentifier");
    objc_msgSend(v6, "_publisherImageWithIdentifier:completion:", v5, *(_QWORD *)(a1 + 32));

    WeakRetained = v6;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GEOPlaceCollection collectionLongTitle](self->_placeCollection, "collectionLongTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    -[GEOPlaceCollection collectionTitle](self->_placeCollection, "collectionTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[GEOPlaceCollection collectionIdentifier](self->_placeCollection, "collectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Guide: %@, MUID: %llu"), v5, objc_msgSend(v6, "muid"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  return v7;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setCollectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_collectionTitle, a3);
}

- (void)setCollectionLongTitle:(id)a3
{
  objc_storeStrong((id *)&self->_collectionLongTitle, a3);
}

- (void)setSecondaryCollectionTitle:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryCollectionTitle, a3);
}

- (void)setIsSaved:(BOOL)a3
{
  self->_isSaved = a3;
}

- (GEOPlaceCollection)placeCollection
{
  return self->_placeCollection;
}

- (MKCuratedCollectionsSyncCoordinator)syncCoordinator
{
  return self->_syncCoordinator;
}

- (void)setSyncCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_syncCoordinator, a3);
}

- (CGSize)photoSize
{
  double width;
  double height;
  CGSize result;

  width = self->_photoSize.width;
  height = self->_photoSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setPhotoSize:(CGSize)a3
{
  self->_photoSize = a3;
}

- (UIImage)publisherLogoImage
{
  return (UIImage *)objc_getProperty(self, a2, 120, 1);
}

- (void)setPublisherLogoImage:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisherLogoImage, 0);
  objc_storeStrong((id *)&self->_syncCoordinator, 0);
  objc_storeStrong((id *)&self->_placeCollection, 0);
  objc_storeStrong((id *)&self->_secondaryCollectionTitle, 0);
  objc_storeStrong((id *)&self->_collectionLongTitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_publisherLogoImageQueue, 0);
  objc_storeStrong((id *)&self->_imageLoadingQueue, 0);
  objc_storeStrong((id *)&self->_collectionImage, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
}

- (void)collectionImageForSize:(CGSize)a3 onCompletion:(id)a4
{
  double height;
  double width;
  void (**v7)(id, UIImage *, _QWORD, uint64_t, uint64_t);
  UIImage *collectionImage;
  NSObject *imageLoadingQueue;
  _QWORD v10[5];
  void (**v11)(id, UIImage *, _QWORD, uint64_t, uint64_t);
  double v12;
  double v13;

  height = a3.height;
  width = a3.width;
  v7 = (void (**)(id, UIImage *, _QWORD, uint64_t, uint64_t))a4;
  -[MKPlaceCollectionViewModel setPhotoSize:](self, "setPhotoSize:", width, height);
  collectionImage = self->_collectionImage;
  if (collectionImage)
  {
    v7[2](v7, collectionImage, 0, 1, 1);
  }
  else
  {
    imageLoadingQueue = self->_imageLoadingQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke;
    v10[3] = &unk_1E20DCE60;
    v10[4] = self;
    v12 = width;
    v13 = height;
    v11 = v7;
    dispatch_async(imageLoadingQueue, v10);

  }
}

void __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  +[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "placeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) - 1;
  if (v4 > 9)
    v5 = 0;
  else
    v5 = qword_18B2AF108[v4];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke_2;
  v6[3] = &unk_1E20DC5E0;
  objc_copyWeak(&v8, &location);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "loadGradientCoverImageWithCuratedCollection:size:contentSizeCategory:usingImageSource:completion:", v3, 0, v5, v6, *(double *)(a1 + 48), *(double *)(a1 + 56));

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __82__MKPlaceCollectionViewModel_ImageUtilities__collectionImageForSize_onCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v9;
  id *WeakRetained;
  void (*v11)(void);
  id v12;

  v12 = a2;
  v9 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v12 && !v9 && a5)
    {
      objc_storeStrong(WeakRetained + 4, a2);
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    else
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
    }
    v11();
  }

}

@end
