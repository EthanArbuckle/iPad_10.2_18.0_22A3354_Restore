@implementation MKPlaceCompactCollectionViewModel

- (MKPlaceCompactCollectionViewModel)initWithGuideLocation:(id)a3 context:(int64_t)a4 useBorderHighlight:(BOOL)a5
{
  id v9;
  MKPlaceCompactCollectionViewModel *v10;
  MKPlaceCompactCollectionViewModel *v11;
  id v12;
  uint64_t v13;
  NSArray *supportedSizeCategories;
  objc_super v16;

  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MKPlaceCompactCollectionViewModel;
  v10 = -[MKPlaceCompactCollectionViewModel init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_guideLocation, a3);
    v11->_context = a4;
    v11->_useBorderHighlight = a5;
    v12 = objc_alloc(MEMORY[0x1E0C99D20]);
    v13 = objc_msgSend(v12, "initWithObjects:", *MEMORY[0x1E0CEB410], *MEMORY[0x1E0CEB438], *MEMORY[0x1E0CEB428], *MEMORY[0x1E0CEB420], *MEMORY[0x1E0CEB408], 0);
    supportedSizeCategories = v11->_supportedSizeCategories;
    v11->_supportedSizeCategories = (NSArray *)v13;

    -[MKPlaceCompactCollectionViewModel initializeFonts](v11, "initializeFonts");
  }

  return v11;
}

- (void)initializeFonts
{
  CGFloat v3;
  CTFontRef UIFontForLanguage;
  void *CopyOfSystemUIFontWithGrade;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_preferredFontForTextStyle:maximumContentSizeCategory:", *MEMORY[0x1E0CEB538], *MEMORY[0x1E0CEB3F8]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pointSize");
  UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontMenuTitleFontType|0x60, v3, 0);
  CopyOfSystemUIFontWithGrade = (void *)CTFontCreateCopyOfSystemUIFontWithGrade();
  CFRelease(UIFontForLanguage);
  -[MKPlaceCompactCollectionViewModel setTitleFont:](self, "setTitleFont:", CopyOfSystemUIFontWithGrade);

  objc_msgSend(MEMORY[0x1E0CEA5E8], "_mapkit_preferredFontForTextStyleInTableViewCell:", *MEMORY[0x1E0CEB590]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKPlaceCompactCollectionViewModel setSubTitleFont:](self, "setSubTitleFont:", v6);

}

- (void)contentCategorySizeDidChange:(id)a3
{
  id v4;
  void *v5;
  NSAttributedString *title;
  NSAttributedString *subTitle;
  id v8;

  v8 = a3;
  -[MKPlaceCompactCollectionViewModel preferredSizeCategory](self, "preferredSizeCategory");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v8;
  if (v4 != v8)
  {
    -[MKPlaceCompactCollectionViewModel setPreferredSizeCategory:](self, "setPreferredSizeCategory:", v8);
    title = self->_title;
    self->_title = 0;

    subTitle = self->_subTitle;
    self->_subTitle = 0;

    -[MKPlaceCompactCollectionViewModel initializeFonts](self, "initializeFonts");
    v5 = v8;
  }

}

- (NSAttributedString)title
{
  NSAttributedString *title;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSAttributedString *v14;
  NSAttributedString *v15;
  NSAttributedString *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  title = self->_title;
  if (title)
    return title;
  -[MKPlaceCompactCollectionViewModel guideLocation](self, "guideLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    title = self->_title;
    return title;
  }
  v17[0] = *MEMORY[0x1E0CEA098];
  -[MKPlaceCompactCollectionViewModel titleFont](self, "titleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v7;
  v17[1] = *MEMORY[0x1E0CEA0B0];
  LODWORD(v8) = 1045220557;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[MKPlaceCompactCollectionViewModel guideLocation](self, "guideLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "title");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSAttributedString *)objc_msgSend(v11, "initWithString:attributes:", v13, v10);
  v15 = self->_title;
  self->_title = v14;

  v16 = self->_title;
  return v16;
}

- (NSAttributedString)subTitle
{
  NSAttributedString *subTitle;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSAttributedString *v12;
  NSAttributedString *v13;
  NSAttributedString *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  subTitle = self->_subTitle;
  if (subTitle)
    return subTitle;
  -[MKPlaceCompactCollectionViewModel guideLocation](self, "guideLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "country");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    subTitle = self->_subTitle;
    return subTitle;
  }
  v15 = *MEMORY[0x1E0CEA098];
  -[MKPlaceCompactCollectionViewModel subTitleFont](self, "subTitleFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[MKPlaceCompactCollectionViewModel guideLocation](self, "guideLocation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "country");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (NSAttributedString *)objc_msgSend(v9, "initWithString:attributes:", v11, v8);
  v13 = self->_subTitle;
  self->_subTitle = v12;

  v14 = self->_subTitle;
  return v14;
}

- (BOOL)shouldShowSubtitleForCategory:(id)a3
{
  return -[NSArray containsObject:](self->_supportedSizeCategories, "containsObject:", a3);
}

- (UIColor)backgroundColor
{
  UIColor *backgroundColor;
  void *v4;
  void *v5;
  UIColor *v6;
  UIColor *v7;

  backgroundColor = self->_backgroundColor;
  if (!backgroundColor)
  {
    +[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCompactCollectionViewModel guideLocation](self, "guideLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "joeColorForCompactCollection:usingCarouselContext:", v5, -[MKPlaceCompactCollectionViewModel context](self, "context"));
    v6 = (UIColor *)objc_claimAutoreleasedReturnValue();
    v7 = self->_backgroundColor;
    self->_backgroundColor = v6;

    backgroundColor = self->_backgroundColor;
  }
  return backgroundColor;
}

- (BOOL)useBorderHighlight
{
  return !self->_context && self->_useBorderHighlight;
}

- (BOOL)isWorldwide
{
  return -[GEOGuideLocation type](self->_guideLocation, "type") == 2;
}

- (BOOL)isEqual:(id)a3
{
  MKPlaceCompactCollectionViewModel *v4;
  MKPlaceCompactCollectionViewModel *v5;
  MKPlaceCompactCollectionViewModel *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (MKPlaceCompactCollectionViewModel *)a3;
  v5 = v4;
  if (self == v4)
  {
    v9 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    -[MKPlaceCompactCollectionViewModel guideLocation](self, "guideLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MKPlaceCompactCollectionViewModel guideLocation](v6, "guideLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v7, "isEqual:", v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[MKPlaceCompactCollectionViewModel title](self, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "string");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Guide Location: %@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (void)setUseBorderHighlight:(BOOL)a3
{
  self->_useBorderHighlight = a3;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (void)setSubTitle:(id)a3
{
  objc_storeStrong((id *)&self->_subTitle, a3);
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_titleFont, a3);
}

- (UIFont)subTitleFont
{
  return self->_subTitleFont;
}

- (void)setSubTitleFont:(id)a3
{
  objc_storeStrong((id *)&self->_subTitleFont, a3);
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

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (NSString)preferredSizeCategory
{
  return self->_preferredSizeCategory;
}

- (void)setPreferredSizeCategory:(id)a3
{
  objc_storeStrong((id *)&self->_preferredSizeCategory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSizeCategory, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subTitleFont, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_supportedSizeCategories, 0);
}

- (void)compactCollectionImageForSize:(CGSize)a3 onCompletion:(id)a4
{
  double height;
  double width;
  void (**v7)(id, void *, _QWORD, uint64_t, uint64_t);
  void *v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[5];
  void (**v12)(id, void *, _QWORD, uint64_t, uint64_t);
  id v13[3];
  id location;

  height = a3.height;
  width = a3.width;
  v7 = (void (**)(id, void *, _QWORD, uint64_t, uint64_t))a4;
  -[MKPlaceCompactCollectionViewModel setPhotoSize:](self, "setPhotoSize:", width, height);
  -[MKPlaceCompactCollectionViewModel image](self, "image");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[MKPlaceCompactCollectionViewModel image](self, "image");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, 0, 1, 1);

  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_get_global_queue(25, 0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke;
    v11[3] = &unk_1E20DC608;
    v11[4] = self;
    v13[1] = *(id *)&width;
    v13[2] = *(id *)&height;
    objc_copyWeak(v13, &location);
    v12 = v7;
    dispatch_async(v10, v11);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }

}

void __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  id v8;

  +[MKPlaceCollectionImageProvider sharedInstance](MKPlaceCollectionImageProvider, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "guideLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "context");
  if (v4 == 2)
    v5 = 2;
  else
    v5 = v4 == 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke_2;
  v6[3] = &unk_1E20DC5E0;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  v7 = *(id *)(a1 + 40);
  objc_msgSend(v2, "loadCoverImageWithGuideLocation:size:usingImageSource:completion:", v3, v5, v6, *(double *)(a1 + 56), *(double *)(a1 + 64));

  objc_destroyWeak(&v8);
}

void __96__MKPlaceCompactCollectionViewModel_ImageUtilities__compactCollectionImageForSize_onCompletion___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
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
      objc_storeStrong(WeakRetained + 10, a2);
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
