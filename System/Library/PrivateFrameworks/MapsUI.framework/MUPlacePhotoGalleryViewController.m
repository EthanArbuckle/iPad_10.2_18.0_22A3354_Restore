@implementation MUPlacePhotoGalleryViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (MUPlacePhotoGalleryViewController)initWithPhotos:(id)a3 additionalView:(id)a4 scrollToIndex:(unint64_t)a5 mapItem:(id)a6 delegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  MUPlacePhotoGalleryViewController *v16;
  uint64_t v17;
  NSArray *photos;
  uint64_t v19;
  NSNumber *originalIndex;
  uint64_t v21;
  NSMutableArray *indexesOfDownloadedImages;
  uint64_t v23;
  NSMutableArray *downloadingImagesURLs;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v26.receiver = self;
  v26.super_class = (Class)MUPlacePhotoGalleryViewController;
  v16 = -[MUPlacePhotoGalleryViewController initWithNibName:bundle:](&v26, sel_initWithNibName_bundle_, 0, 0);
  if (v16)
  {
    v17 = objc_msgSend(v12, "copy");
    photos = v16->_photos;
    v16->_photos = (NSArray *)v17;

    objc_storeStrong((id *)&v16->_mapItem, a6);
    objc_storeWeak((id *)&v16->_delegate, v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a5);
    v19 = objc_claimAutoreleasedReturnValue();
    originalIndex = v16->_originalIndex;
    v16->_originalIndex = (NSNumber *)v19;

    objc_storeStrong((id *)&v16->_additionalView, a4);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v16->_photos, "count"));
    indexesOfDownloadedImages = v16->_indexesOfDownloadedImages;
    v16->_indexesOfDownloadedImages = (NSMutableArray *)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSArray count](v16->_photos, "count"));
    downloadingImagesURLs = v16->_downloadingImagesURLs;
    v16->_downloadingImagesURLs = (NSMutableArray *)v23;

    v16->_panAndSwipeToDismissGestureEnabled = 1;
  }

  return v16;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (id)keyCommands
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel_didTapDone);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUPlacePhotoGalleryViewController;
  -[MUPlacePhotoGalleryViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[MUPlacePhotoGalleryViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)dealloc
{
  objc_super v3;

  -[MUPlacePhotoGalleryViewController cancelDownloadingImages](self, "cancelDownloadingImages");
  v3.receiver = self;
  v3.super_class = (Class)MUPlacePhotoGalleryViewController;
  -[MUPlacePhotoGalleryViewController dealloc](&v3, sel_dealloc);
}

- (void)setupViewsWithAdditionalView:(id)a3
{
  objc_class *v4;
  UIScrollView *v5;
  UIScrollView *scrollView;
  void *v7;
  void *v8;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  _QWORD v42[10];

  v42[8] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0DC3C28];
  v41 = a3;
  v5 = (UIScrollView *)objc_alloc_init(v4);
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v7);

  -[UIScrollView setPagingEnabled:](self->_scrollView, "setPagingEnabled:", 1);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView setBackgroundColor:](self->_scrollView, "setBackgroundColor:", v8);

  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  -[UIScrollView setAccessibilityIdentifier:](self->_scrollView, "setAccessibilityIdentifier:", CFSTR("PlacePhotoGalleryScrollView"));
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", self->_scrollView);

  v10 = objc_alloc_init(MEMORY[0x1E0DC3CA8]);
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v10, "setDistribution:", 4);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", v10);
  v28 = (void *)MEMORY[0x1E0CB3718];
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "constraintEqualToAnchor:", v38);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v42[0] = v37;
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "trailingAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v42[1] = v33;
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "topAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "constraintEqualToAnchor:", v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v42[2] = v29;
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "bottomAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v25);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42[3] = v24;
  objc_msgSend(v10, "leadingAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v42[4] = v21;
  objc_msgSend(v10, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v42[5] = v11;
  objc_msgSend(v10, "topAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v42[6] = v14;
  objc_msgSend(v10, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v42[7] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "activateConstraints:", v18);

  -[MUPlacePhotoGalleryViewController setupPhotoViewsWithStackView:](self, "setupPhotoViewsWithStackView:", v10);
  -[MUPlacePhotoGalleryViewController setupAdditionalView:withStackView:](self, "setupAdditionalView:withStackView:", v41, v10);

  -[MUPlacePhotoGalleryViewController setupAttributionView](self, "setupAttributionView");
  -[MUPlacePhotoGalleryViewController updateViewsWithPhotoAtIndex:](self, "updateViewsWithPhotoAtIndex:", -[NSNumber unsignedIntegerValue](self->_originalIndex, "unsignedIntegerValue"));
  -[MUPlacePhotoGalleryViewController reloadUserAttribution](self, "reloadUserAttribution");

}

- (void)setEnablePersonalizedAttribution:(BOOL)a3
{
  if (self->_enablePersonalizedAttribution != a3)
  {
    self->_enablePersonalizedAttribution = a3;
    if (!a3)
      -[MUPlacePhotoGalleryViewController setUserAttributionViewModel:](self, "setUserAttributionViewModel:", 0);
    -[MUPlacePhotoGalleryViewController reloadUserAttribution](self, "reloadUserAttribution");
  }
}

- (void)reloadUserAttribution
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGalleryRequestsUserAttribution:", self);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[MUPlacePhotoGalleryViewController userAttributionViewModel](self, "userAttributionViewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v8, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    -[MUPlacePhotoGalleryViewController setUserAttributionViewModel:](self, "setUserAttributionViewModel:", v8);
    -[MUPlacePhotoGalleryViewController updateViewsWithPhotoAtIndex:](self, "updateViewsWithPhotoAtIndex:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
  }

}

- (void)setupPhotoViewsWithStackView:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *indexesOfDownloadedImages;
  void *v10;
  uint64_t v11;
  void *v12;
  MUPlacePhotoView *v13;
  void *v14;
  MUPlacePhotoViewObfuscationModel *v15;
  void *v16;
  void *v17;
  MUPlacePhotoViewObfuscationModel *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSArray *v28;
  NSArray *photoViews;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v31 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_photos, "count"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_photos, "count"))
  {
    v4 = 0;
    do
    {
      -[NSArray objectAtIndexedSubscript:](self->_photos, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "largestPhotoURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "cachedImageAtURL:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        indexesOfDownloadedImages = self->_indexesOfDownloadedImages;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](indexesOfDownloadedImages, "addObject:", v10);
        v11 = v8;
      }
      else
      {
        -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "placePhotoGalleryImageViewForPhotoAtIndex:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "image");
        v11 = objc_claimAutoreleasedReturnValue();

      }
      v13 = -[MUPlacePhotoView initWithImage:]([MUPlacePhotoView alloc], "initWithImage:", v11);
      -[MUPlacePhotoView setNeedsFullImageDownload:](v13, "setNeedsFullImageDownload:", v8 == 0);
      v35 = v5;
      v36 = v4;
      v34 = (void *)v11;
      if (objc_msgSend(v5, "needsObfuscationWhenRenderedInFullScreen")
        && (objc_msgSend(v5, "attribution"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v14, v14))
      {
        v15 = [MUPlacePhotoViewObfuscationModel alloc];
        objc_msgSend(v5, "attribution");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "providerName");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[MUPlacePhotoViewObfuscationModel initWithProviderName:](v15, "initWithProviderName:", v17);

        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapOpen);
        -[MUPlacePhotoViewObfuscationModel setTapGestureRecognizer:](v18, "setTapGestureRecognizer:", v19);
        -[MUPlacePhotoView setObfuscationModel:](v13, "setObfuscationModel:", v18);

      }
      else
      {
        v18 = (MUPlacePhotoViewObfuscationModel *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_handlePanGesture_);
        -[MUPlacePhotoViewObfuscationModel setDelegate:](v18, "setDelegate:", self);
        -[MUPlacePhotoView addGestureRecognizer:](v13, "addGestureRecognizer:", v18);
      }

      objc_msgSend(v30, "addObject:", v13);
      objc_msgSend(v31, "addArrangedSubview:", v13);
      v32 = (void *)MEMORY[0x1E0CB3718];
      -[MUPlacePhotoView heightAnchor](v13, "heightAnchor");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoGalleryViewController view](self, "view");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "heightAnchor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "constraintEqualToAnchor:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v22;
      -[MUPlacePhotoView widthAnchor](v13, "widthAnchor");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoGalleryViewController view](self, "view");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "widthAnchor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "constraintEqualToAnchor:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v26;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "activateConstraints:", v27);

      v4 = v36 + 1;
    }
    while (v36 + 1 < -[NSArray count](self->_photos, "count"));
  }
  v28 = (NSArray *)objc_msgSend(v30, "copy");
  photoViews = self->_photoViews;
  self->_photoViews = v28;

}

- (UIView)rapBarButtonView
{
  return -[MUPlacePhotoGalleryAttributionView accessoryView](self->_attributionView, "accessoryView");
}

- (void)setupAdditionalView:(id)a3 withStackView:(id)a4
{
  id v7;
  id v8;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  _QWORD v40[3];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    v39 = v7;
    objc_storeStrong((id *)&self->_additionalView, a3);
    v8 = a4;
    v9 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(v8, "addArrangedSubview:", v9);
    v34 = (void *)MEMORY[0x1E0CB3718];
    v11 = v9;
    objc_msgSend(v9, "heightAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v14;
    v38 = v9;
    objc_msgSend(v9, "widthAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "widthAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v41[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "activateConstraints:", v19);

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_additionalView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v11, "addSubview:", self->_additionalView);
    v31 = (void *)MEMORY[0x1E0CB3718];
    -[UIView heightAnchor](self->_additionalView, "heightAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "widthAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v32;
    -[UIView widthAnchor](self->_additionalView, "widthAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "widthAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v40[1] = v23;
    -[UIView centerYAnchor](self->_additionalView, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "centerYAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v40[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "activateConstraints:", v28);

    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapOnAdditionalView);
    objc_msgSend(v29, "setNumberOfTapsRequired:", 1);
    -[UIView addGestureRecognizer:](self->_additionalView, "addGestureRecognizer:", v29);
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", self, sel_handlePanGesture_);
    objc_msgSend(v30, "setDelegate:", self);
    objc_msgSend(v38, "addGestureRecognizer:", v30);

    v7 = v39;
  }

}

- (void)setupAttributionView
{
  MUPlacePhotoGalleryAttributionView *v3;
  MUPlacePhotoGalleryAttributionView *attributionView;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MUPlacePhotoGalleryAttributionView);
  attributionView = self->_attributionView;
  self->_attributionView = v3;

  -[MUPlacePhotoGalleryAttributionView setDelegate:](self->_attributionView, "setDelegate:", self);
  -[MUPlacePhotoGalleryAttributionView setTranslatesAutoresizingMaskIntoConstraints:](self->_attributionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_attributionView);
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_didTapOnAttributionView);
  objc_msgSend(v19, "setNumberOfTapsRequired:", 1);
  -[MUPlacePhotoGalleryAttributionView addGestureRecognizer:](self->_attributionView, "addGestureRecognizer:", v19);
  v14 = (void *)MEMORY[0x1E0CB3718];
  -[MUPlacePhotoGalleryAttributionView leadingAnchor](self->_attributionView, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v15;
  -[MUPlacePhotoGalleryAttributionView trailingAnchor](self->_attributionView, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  -[MUPlacePhotoGalleryAttributionView bottomAnchor](self->_attributionView, "bottomAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "activateConstraints:", v13);

  -[MUPlacePhotoGalleryViewController updateViewsWithPhotoAtIndex:](self, "updateViewsWithPhotoAtIndex:", -[NSNumber unsignedIntegerValue](self->_originalIndex, "unsignedIntegerValue"));
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  CGFloat v12;
  void *v13;
  objc_super v14;
  CGRect v15;

  v14.receiver = self;
  v14.super_class = (Class)MUPlacePhotoGalleryViewController;
  -[MUPlacePhotoGalleryViewController viewDidLayoutSubviews](&v14, sel_viewDidLayoutSubviews);
  -[MUPlacePhotoGalleryViewController originalIndex](self, "originalIndex");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUPlacePhotoGalleryViewController originalIndex](self, "originalIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "unsignedIntegerValue");

    -[MUPlacePhotoGalleryViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_mapsui_isRTL");

    if (v7)
    {
      -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      -[MUPlacePhotoGalleryViewController originalIndex](self, "originalIndex");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v9 + ~objc_msgSend(v10, "unsignedIntegerValue");

    }
    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v12 = CGRectGetWidth(v15) * (double)v5;
    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContentOffset:", v12, 0.0);

    -[MUPlacePhotoGalleryViewController setOriginalIndex:](self, "setOriginalIndex:", 0);
  }
  -[MUPlacePhotoGalleryViewController downloadImageForVisibleViews](self, "downloadImageForVisibleViews");
}

- (void)viewDidLoad
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
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)MUPlacePhotoGalleryViewController;
  -[MUPlacePhotoGalleryViewController viewDidLoad](&v23, sel_viewDidLoad);
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("PlacePhotoGalleryView"));

  -[MUPlacePhotoGalleryViewController additionalView](self, "additionalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController setupViewsWithAdditionalView:](self, "setupViewsWithAdditionalView:", v4);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("chevron.backward"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithImage:style:target:action:", v6, 2, self, sel_didTapDone);
  -[MUPlacePhotoGalleryViewController setBackBarButtonItem:](self, "setBackBarButtonItem:", v7);

  -[MUPlacePhotoGalleryViewController leftBarButtonItem](self, "leftBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setLeftBarButtonItem:", v8);

  -[MUPlacePhotoGalleryViewController rightBarButtonItem](self, "rightBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController navigationItem](self, "navigationItem");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setRightBarButtonItem:", v10);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setBackgroundColor:", v12);

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_toggleBackground_);
  objc_msgSend(v14, "setNumberOfTapsRequired:", 1);
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addGestureRecognizer:", v14);

  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_zoomToPoint_);
  objc_msgSend(v16, "setNumberOfTapsRequired:", 2);
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addGestureRecognizer:", v16);

  objc_msgSend(v14, "requireGestureRecognizerToFail:", v16);
  objc_msgSend(v16, "setDelaysTouchesBegan:", 1);
  objc_msgSend(v14, "setDelaysTouchesBegan:", 1);
  v18 = objc_alloc_init(MEMORY[0x1E0DC3A30]);
  objc_msgSend(v18, "configureWithDefaultBackground");
  -[MUPlacePhotoGalleryViewController navigationItem](self, "navigationItem");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setScrollEdgeAppearance:", v18);

  objc_opt_self();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (id)-[MUPlacePhotoGalleryViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v21, sel__updateNavbarVisibility);

}

- (void)downloadImageForVisibleViews
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  char v18;
  unint64_t v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v6);

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 - 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

    }
    -[MUPlacePhotoGalleryViewController photos](self, "photos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    if (v5 < v9)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v10);

    }
  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[MUPlacePhotoGalleryViewController indexesOfDownloadedImages](self, "indexesOfDownloadedImages", (_QWORD)v25);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "containsObject:", v16);

        if ((v18 & 1) == 0)
        {
          v19 = objc_msgSend(v16, "unsignedIntegerValue");
          -[MUPlacePhotoGalleryViewController photos](self, "photos");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          if (v19 < v21)
          {
            -[MUPlacePhotoGalleryViewController photos](self, "photos");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectAtIndexedSubscript:", objc_msgSend(v16, "unsignedIntegerValue"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v23, "largestPhotoURL");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            if (v24)
              -[MUPlacePhotoGalleryViewController downloadImageForURL:forIndex:](self, "downloadImageForURL:forIndex:", v24, objc_msgSend(v16, "unsignedIntegerValue"));

          }
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v13);
  }

}

- (void)downloadImageForURL:(id)a3 forIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  MUPlacePhotoGalleryViewController *v16;
  id v17[2];
  uint8_t buf[4];
  unint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MUPlacePhotoGalleryViewController downloadingImagesURLs](self, "downloadingImagesURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsObject:", v6);

  if ((v8 & 1) == 0)
  {
    MUGetMUPlacePhotoVCLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "absoluteString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218242;
      v19 = a4;
      v20 = 2112;
      v21 = v10;
      _os_log_impl(&dword_191DB8000, v9, OS_LOG_TYPE_DEBUG, "[...]Starting download for image at index: %lu. URL: %@", buf, 0x16u);

    }
    -[MUPlacePhotoGalleryViewController downloadingImagesURLs](self, "downloadingImagesURLs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v6);

    objc_initWeak((id *)buf, self);
    objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke;
    v14[3] = &unk_1E2E03EB8;
    objc_copyWeak(v17, (id *)buf);
    v13 = v6;
    v17[1] = (id)a4;
    v15 = v13;
    v16 = self;
    objc_msgSend(v12, "loadAppImageAtURL:completionHandler:", v13, v14);

    objc_destroyWeak(v17);
    objc_destroyWeak((id *)buf);
  }

}

void __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17[2];

  v7 = a2;
  v8 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke_2;
  v12[3] = &unk_1E2E03E90;
  objc_copyWeak(v17, (id *)(a1 + 48));
  v13 = *(id *)(a1 + 32);
  v14 = v8;
  v17[1] = *(id *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 40);
  v15 = v7;
  v16 = v9;
  v10 = v7;
  v11 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

  objc_destroyWeak(v17);
}

void __66__MUPlacePhotoGalleryViewController_downloadImageForURL_forIndex___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  objc_msgSend(WeakRetained, "downloadingImagesURLs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

  if (*(_QWORD *)(a1 + 40))
  {
    MUGetMUPlacePhotoVCLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 40), "debugDescription");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218498;
      v16 = v5;
      v17 = 2112;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_191DB8000, v4, OS_LOG_TYPE_ERROR, "[X]Error encountered for photo at index: %lu. Error: %@. URL: %@", (uint8_t *)&v15, 0x20u);

    }
  }
  if (*(_QWORD *)(a1 + 48))
  {
    objc_msgSend(WeakRetained, "photoViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 72));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setNeedsFullImageDownload:", 0);
    MUGetMUPlacePhotoVCLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 72);
      objc_msgSend(*(id *)(a1 + 32), "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 134218242;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_191DB8000, v10, OS_LOG_TYPE_DEBUG, "[✔]Showing image at index: %lu. URL: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 56), "indexesOfDownloadedImages");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 72));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObject:", v14);

    objc_msgSend(v9, "setImage:", *(_QWORD *)(a1 + 48));
  }

}

- (void)downloadImageForPhotoViewAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") - 1;

  if (v6 >= a3)
  {
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v11 = (id)objc_claimAutoreleasedReturnValue();

    -[MUPlacePhotoGalleryViewController photos](self, "photos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "largestPhotoURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[MUPlacePhotoGalleryViewController downloadImageForURL:forIndex:](self, "downloadImageForURL:forIndex:", v10, a3);

  }
}

- (void)cancelDownloadingImages
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MUPlacePhotoGalleryViewController downloadingImagesURLs](self, "downloadingImagesURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        MUGetMUPlacePhotoVCLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v7, "absoluteString");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v16 = v9;
          _os_log_impl(&dword_191DB8000, v8, OS_LOG_TYPE_DEBUG, "[X]Cancelling image download for url: %@", buf, 0xCu);

        }
        objc_msgSend(MEMORY[0x1E0CC1750], "sharedImageManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "cancelLoadAppImageAtURL:", v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    }
    while (v4);
  }

}

- (id)currentPhoto
{
  unint64_t v3;
  unsigned int v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  v3 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = v3;
    -[MUPlacePhotoGalleryViewController photos](self, "photos");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v10 < v12)
    {
      -[MUPlacePhotoGalleryViewController photos](self, "photos");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      v8 = v10;
      goto LABEL_6;
    }
LABEL_7:
    v13 = 0;
    return v13;
  }
  v4 = -[NSNumber unsignedIntValue](self->_originalIndex, "unsignedIntValue");
  -[MUPlacePhotoGalleryViewController photos](self, "photos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 <= v4)
    goto LABEL_7;
  -[MUPlacePhotoGalleryViewController photos](self, "photos");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[NSNumber unsignedIntValue](self->_originalIndex, "unsignedIntValue");
  v9 = v7;
LABEL_6:
  objc_msgSend(v9, "objectAtIndex:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)photoViewForTransition
{
  uint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;

  -[MUPlacePhotoGalleryViewController originalIndex](self, "originalIndex");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_4;
  v4 = (void *)v3;
  -[MUPlacePhotoGalleryViewController originalIndex](self, "originalIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v6 < v8)
  {
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController originalIndex](self, "originalIndex");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", objc_msgSend(v10, "unsignedIntegerValue"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_4:
    v12 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v12 >= v14)
    {
      v16 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
      -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16 != objc_msgSend(v9, "count"))
      {
        v11 = 0;
        goto LABEL_11;
      }
      -[MUPlacePhotoGalleryViewController additionalView](self, "additionalView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v17)
      {
        v11 = 0;
        return v11;
      }
      -[MUPlacePhotoGalleryViewController additionalView](self, "additionalView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "superview");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v11 = (void *)v15;
  }
LABEL_11:

  return v11;
}

- (unint64_t)indexOfVisibleView
{
  void *v3;
  double Width;
  unint64_t v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  CGRect v15;

  -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  Width = CGRectGetWidth(v15);

  if (Width == 0.0)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_mapsui_isRTL");

  if (v7)
  {
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (double)(unint64_t)objc_msgSend(v8, "count");
    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "contentOffset");
    v12 = v9 - v11 / Width + -1.0;

  }
  else
  {
    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentOffset");
    v12 = v13 / Width;
  }
  v5 = (unint64_t)v12;

  return v5;
}

- (unint64_t)indexOfView:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  unint64_t v13;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsObject:", v4);

    if (v6)
    {
      -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "indexOfObject:", v4);
LABEL_9:
      v13 = v8;

      goto LABEL_10;
    }
  }
  -[MUPlacePhotoGalleryViewController additionalView](self, "additionalView");
  v9 = objc_claimAutoreleasedReturnValue();
  if ((id)v9 == v4)
  {

    goto LABEL_8;
  }
  v10 = (void *)v9;
  -[MUPlacePhotoGalleryViewController additionalView](self, "additionalView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "superview");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
LABEL_8:
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    goto LABEL_9;
  }
  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_10:

  return v13;
}

- (CGPoint)scrollViewContentOffset
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGPoint result;

  -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentOffset");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)handlePanGesture:(id)a3
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  __int128 v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  char v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  uint64_t v64;
  void (*v65)(uint64_t);
  void *v66;
  id v67;
  MUPlacePhotoGalleryViewController *v68;
  CGAffineTransform v69;
  CGAffineTransform v70;
  CGAffineTransform v71;

  v4 = a3;
  if (-[MUPlacePhotoGalleryViewController panAndSwipeToDismissGestureEnabled](self, "panAndSwipeToDismissGestureEnabled"))
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (v7)
      {
        v9 = objc_msgSend(v7, "isZoomed");
        objc_msgSend(v8, "image");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v9 & 1) != 0 || !v10)
          goto LABEL_47;
      }
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(v4, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v11);
    v13 = v12;
    v15 = v14;

    objc_msgSend(v4, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "bounds");
    v18 = v17;

    v19 = 0.0;
    if (v18 > 0.0)
    {
      v19 = v15 / v18;
      if (v15 / v18 < 0.0)
        v19 = -(v15 / v18);
    }
    if (v19 >= 0.0)
      v20 = v19;
    else
      v20 = 0.0;
    v21 = objc_msgSend(v4, "state", 0.0);
    if ((unint64_t)(v21 - 3) < 2)
    {
      -[MUPlacePhotoGalleryViewController gestureTrackedView](self, "gestureTrackedView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25 != v26)
        goto LABEL_47;
      objc_msgSend(v8, "setUserInteractionEnabled:", 1);
      if (-[MUPlacePhotoGalleryViewController shouldFinishAnimation](self, "shouldFinishAnimation"))
      {
        -[MUPlacePhotoGalleryViewController dismiss](self, "dismiss");
      }
      else
      {
        v61 = (void *)MEMORY[0x1E0DC3F10];
        v63 = MEMORY[0x1E0C809B0];
        v64 = 3221225472;
        v65 = __54__MUPlacePhotoGalleryViewController_handlePanGesture___block_invoke;
        v66 = &unk_1E2E01730;
        v67 = v4;
        v68 = self;
        objc_msgSend(v61, "animateWithDuration:animations:", &v63, 0.15);

      }
    }
    else
    {
      if (v21 == 2)
      {
        -[MUPlacePhotoGalleryViewController gestureTrackedView](self, "gestureTrackedView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "view");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27 == v28
          && (-[MUPlacePhotoGalleryViewController panGestureStartingDirection](self, "panGestureStartingDirection") == 2
           || -[MUPlacePhotoGalleryViewController panGestureStartingDirection](self, "panGestureStartingDirection") == 1))
        {
          v29 = fmin(v20, 1.0);
          -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setScrollEnabled:", 0);

          if (1.0 - v29 >= 0.8)
            v31 = 1.0 - v29;
          else
            v31 = 0.8;
          v32 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          *(_OWORD *)&v70.a = *MEMORY[0x1E0C9BAA8];
          *(_OWORD *)&v70.c = v32;
          *(_OWORD *)&v70.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          CGAffineTransformScale(&v71, &v70, v31, v31);
          objc_msgSend(v4, "view");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v71;
          objc_msgSend(v33, "setTransform:", &v69);

          -[MUPlacePhotoGalleryViewController imageViewCenterPoint](self, "imageViewCenterPoint");
          v35 = v13 + v34;
          -[MUPlacePhotoGalleryViewController imageViewCenterPoint](self, "imageViewCenterPoint");
          v37 = v15 + v36;
          objc_msgSend(v4, "view");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "setCenter:", v35, v37);

          -[MUPlacePhotoGalleryViewController view](self, "view");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "backgroundColor");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "colorWithAlphaComponent:", v31);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlacePhotoGalleryViewController view](self, "view");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "setBackgroundColor:", v41);

          -[MUPlacePhotoGalleryViewController attributionView](self, "attributionView");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "setAlpha:", v31);

          objc_msgSend(v4, "view");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "setAlpha:", 1.0);

          -[MUPlacePhotoGalleryViewController setShouldFinishAnimation:](self, "setShouldFinishAnimation:", v29 > 0.15);
        }
        goto LABEL_47;
      }
      if (v21 == 1)
      {
        -[MUPlacePhotoGalleryViewController gestureTrackedView](self, "gestureTrackedView");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          objc_msgSend(v4, "view");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[MUPlacePhotoGalleryViewController setGestureTrackedView:](self, "setGestureTrackedView:", v45);

LABEL_32:
          objc_msgSend(v8, "setUserInteractionEnabled:", 0);
          if (!-[MUPlacePhotoGalleryViewController panGestureStartingDirection](self, "panGestureStartingDirection"))
          {
            objc_msgSend(v4, "view");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "velocityInView:", v46);
            v48 = v47;
            v50 = v49;

            v51 = fabs(v50);
            v52 = fabs(v48);
            v53 = 2;
            if (v50 <= 0.0)
              v53 = 1;
            v54 = 3;
            if (v48 > 0.0)
              v54 = 4;
            if (v51 <= v52)
              v55 = v54;
            else
              v55 = v53;
            -[MUPlacePhotoGalleryViewController setPanGestureStartingDirection:](self, "setPanGestureStartingDirection:", v55);
          }
          -[MUPlacePhotoGalleryViewController setShouldFinishAnimation:](self, "setShouldFinishAnimation:", 0);
          objc_msgSend(v4, "view");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "center");
          -[MUPlacePhotoGalleryViewController setImageViewCenterPoint:](self, "setImageViewCenterPoint:");

          if (-[MUPlacePhotoGalleryViewController panGestureStartingDirection](self, "panGestureStartingDirection") == 2
            || -[MUPlacePhotoGalleryViewController panGestureStartingDirection](self, "panGestureStartingDirection") == 1)
          {
            -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_opt_respondsToSelector();

            if ((v58 & 1) != 0)
            {
              -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "view");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "placePhotoGallery:willCloseAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfView:](self, "indexOfView:", v60));

            }
          }
          goto LABEL_47;
        }
        -[MUPlacePhotoGalleryViewController gestureTrackedView](self, "gestureTrackedView");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "view");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23 == v24)
          goto LABEL_32;
LABEL_47:

        goto LABEL_48;
      }
      objc_msgSend(v8, "setUserInteractionEnabled:", 1);
    }
    -[MUPlacePhotoGalleryViewController setPanGestureStartingDirection:](self, "setPanGestureStartingDirection:", 0, v63, v64, v65, v66);
    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "setScrollEnabled:", 1);

    -[MUPlacePhotoGalleryViewController setGestureTrackedView:](self, "setGestureTrackedView:", 0);
    goto LABEL_47;
  }
LABEL_48:

}

void __54__MUPlacePhotoGalleryViewController_handlePanGesture___block_invoke(uint64_t a1)
{
  __int128 v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGAffineTransform v16;

  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v15.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v15.c = v2;
  *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformScale(&v16, &v15, 1.0, 1.0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v16;
  objc_msgSend(v3, "setTransform:", &v14);

  objc_msgSend(*(id *)(a1 + 40), "imageViewCenterPoint");
  v5 = v4;
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCenter:", v5, v7);

  objc_msgSend(*(id *)(a1 + 40), "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "backgroundColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 1.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackgroundColor:", v11);

  objc_msgSend(*(id *)(a1 + 40), "attributionView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAlpha:", 1.0);

}

- (unint64_t)viewsCount
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[MUPlacePhotoGalleryViewController photos](self, "photos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[MUPlacePhotoGalleryViewController additionalView](self, "additionalView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v4 + 1;
  else
    v6 = v4;

  return v6;
}

- (void)toggleBackground:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__MUPlacePhotoGalleryViewController_toggleBackground___block_invoke;
  v3[3] = &unk_1E2E01970;
  v3[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:", v3, 0.150000006);
}

void __54__MUPlacePhotoGalleryViewController_toggleBackground___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUIStyleWithNavigationBarHidden:", objc_msgSend(v2, "isNavigationBarHidden") ^ 1);

}

- (void)setUIStyleWithNavigationBarHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[MUPlacePhotoGalleryViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNavigationBarHidden:animated:", v3, 1);

  if (v3)
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

  -[MUPlacePhotoGalleryViewController attributionView](self, "attributionView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", v3);

}

- (void)zoomToPoint:(id)a3
{
  unint64_t v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v4 < v6)
  {
    -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "zoomWithGestureRecognizer:", v9);
  }

}

- (void)resetPhotosZoomLevel
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "minimumZoomScale");
        objc_msgSend(v7, "setZoomScale:animated:", 0);
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (void)updateViewsWithPhotoAtIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  MKMapItem *mapItem;
  void *v12;
  void *v13;
  MUPlacePhotoGalleryAttributionViewModel *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint8_t buf[4];
  unint64_t v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[MUPlacePhotoGalleryViewController photos](self, "photos");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6 > a3)
  {
    -[MUPlacePhotoGalleryViewController photos](self, "photos");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    -[MUPlacePhotoGalleryViewController photos](self, "photos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 <= a3)
    {
      -[MUPlacePhotoGalleryViewController attributionView](self, "attributionView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setHidden:", 1);

      -[MUPlacePhotoGalleryViewController leftBarButtonItem](self, "leftBarButtonItem");
      v14 = (MUPlacePhotoGalleryAttributionViewModel *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoGalleryViewController navigationItem](self, "navigationItem");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setLeftBarButtonItem:", v14);
LABEL_14:

      -[MUPlacePhotoGalleryViewController photoViews](self, "photoViews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 > a3)
        -[MUPlacePhotoGalleryViewController downloadImageForVisibleViews](self, "downloadImageForVisibleViews");
      _MULocalizedStringFromThisBundle(CFSTR("%lu of %lu"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v24, a3 + 1, -[MUPlacePhotoGalleryViewController viewsCount](self, "viewsCount"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoGalleryViewController setTitle:](self, "setTitle:", v25);

      return;
    }
    v10 = objc_msgSend(v26, "photoStyle");
    if (v10 == 1)
    {
      v14 = objc_alloc_init(MUPlacePhotoGalleryAttributionViewModel);
      objc_msgSend(v26, "title");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoGalleryAttributionViewModel setTitleText:](v14, "setTitleText:", v19);

      objc_msgSend(v26, "subtitle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MUPlacePhotoGalleryAttributionViewModel setSubtitleText:](v14, "setSubtitleText:", v12);
    }
    else
    {
      if (v10)
      {
        v14 = 0;
        goto LABEL_13;
      }
      mapItem = self->_mapItem;
      -[MUPlacePhotoGalleryViewController userAttributionViewModel](self, "userAttributionViewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "attributionName");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[MUPlacePhotoGalleryAttributionViewModel viewModelFromMapItem:photo:photoCreditName:shouldAddPhotoCredit:](MUPlacePhotoGalleryAttributionViewModel, "viewModelFromMapItem:photo:photoCreditName:shouldAddPhotoCredit:", mapItem, v26, v13, -[MUPlacePhotoGalleryViewController enablePersonalizedAttribution](self, "enablePersonalizedAttribution"));
      v14 = (MUPlacePhotoGalleryAttributionViewModel *)objc_claimAutoreleasedReturnValue();

    }
LABEL_13:
    -[MUPlacePhotoGalleryViewController attributionView](self, "attributionView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setViewModel:", v14);

    -[MUPlacePhotoGalleryViewController leftBarButtonItem](self, "leftBarButtonItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPlacePhotoGalleryViewController navigationItem](self, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLeftBarButtonItem:", v18);

    goto LABEL_14;
  }
  MUGetMUPlacePhotoVCLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    -[MUPlacePhotoGalleryViewController photos](self, "photos");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218240;
    v28 = a3;
    v29 = 2048;
    v30 = objc_msgSend(v16, "count");
    _os_log_impl(&dword_191DB8000, v15, OS_LOG_TYPE_FAULT, "Tried to update views when index %lu >= photos count %lu", buf, 0x16u);

  }
}

- (void)_rapButtonPressed
{
  id v3;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "placePhotoGallery:didSelectReportImageAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));

}

- (void)_selectedAddPhotosWithEntryPoint:(int64_t)a3
{
  void *v5;
  MUPresentationOptions *v6;

  v6 = objc_alloc_init(MUPresentationOptions);
  -[MUPresentationOptions setBarButtonItem:](v6, "setBarButtonItem:", self->_addPhotoBarButtonItem);
  -[MUPresentationOptions setPresentingViewController:](v6, "setPresentingViewController:", self);
  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "placePhotoGallery:selectedAddPhotoWithEntryPoint:usingPresentationOptions:", self, a3, v6);

}

- (UIBarButtonItem)addPhotoBarButtonItem
{
  int v3;
  UIBarButtonItem *v4;
  UIBarButtonItem *addPhotoBarButtonItem;
  id v6;
  void *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  v3 = objc_msgSend(MEMORY[0x1E0CC18A8], "shouldShowAddPhotoButtonsOnSingleFullScreenPhotoViewerForMapItem:photoAttribution:", self->_mapItem, 0);
  v4 = 0;
  if (v3)
  {
    addPhotoBarButtonItem = self->_addPhotoBarButtonItem;
    if (!addPhotoBarButtonItem)
    {
      v6 = objc_alloc(MEMORY[0x1E0DC34F0]);
      _MULocalizedStringFromThisBundle(CFSTR("Add Photo [UGC]"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (UIBarButtonItem *)objc_msgSend(v6, "initWithTitle:style:target:action:", v7, 0, self, 0);
      v9 = self->_addPhotoBarButtonItem;
      self->_addPhotoBarButtonItem = v8;

      objc_initWeak(&location, self);
      v10 = MEMORY[0x1E0C809B0];
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke;
      v15[3] = &unk_1E2E01DA8;
      objc_copyWeak(&v16, &location);
      v13[0] = v10;
      v13[1] = 3221225472;
      v13[2] = __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke_2;
      v13[3] = &unk_1E2E01DA8;
      objc_copyWeak(&v14, &location);
      +[MUPhotoOptionsMenuButton menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:](MUPhotoOptionsMenuButton, "menuForPhotoOptionsMenuButtonWithCameraCompletion:libraryCompletion:", v15, v13);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIBarButtonItem setMenu:](self->_addPhotoBarButtonItem, "setMenu:", v11);

      if (+[MUPhotoOptionsMenuButton preferredEntryPoint](MUPhotoOptionsMenuButton, "preferredEntryPoint"))
      {
        -[UIBarButtonItem setAction:](self->_addPhotoBarButtonItem, "setAction:", sel__addPhoto);
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
      addPhotoBarButtonItem = self->_addPhotoBarButtonItem;
    }
    v4 = addPhotoBarButtonItem;
  }
  return v4;
}

void __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_selectedAddPhotosWithEntryPoint:", 1);
    WeakRetained = v2;
  }

}

void __58__MUPlacePhotoGalleryViewController_addPhotoBarButtonItem__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_selectedAddPhotosWithEntryPoint:", 2);
    WeakRetained = v2;
  }

}

- (UIActivityIndicatorView)spinner
{
  UIActivityIndicatorView *spinner;
  UIActivityIndicatorView *v4;
  UIActivityIndicatorView *v5;

  spinner = self->_spinner;
  if (!spinner)
  {
    v4 = (UIActivityIndicatorView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    v5 = self->_spinner;
    self->_spinner = v4;

    -[UIActivityIndicatorView setHidesWhenStopped:](self->_spinner, "setHidesWhenStopped:", 1);
    spinner = self->_spinner;
  }
  return spinner;
}

- (void)_addPhoto
{
  int64_t v3;

  v3 = +[MUPhotoOptionsMenuButton preferredEntryPoint](MUPhotoOptionsMenuButton, "preferredEntryPoint");
  if (v3)
    -[MUPlacePhotoGalleryViewController _selectedAddPhotosWithEntryPoint:](self, "_selectedAddPhotosWithEntryPoint:", v3);
}

- (void)didTapOpen
{
  void *v3;
  char v4;
  id v5;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGallery:openButtonTappedAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));

  }
}

- (void)didTapDone
{
  void *v3;
  char v4;
  void *v5;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGallery:willCloseAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));

  }
  -[MUPlacePhotoGalleryViewController dismiss](self, "dismiss");
}

- (void)dismiss
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[MUPlacePhotoGalleryViewController cancelDownloadingImages](self, "cancelDownloadingImages");
  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGalleryDidCloseAtIndex:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));

  }
  -[MUPlacePhotoGalleryViewController presentingViewController](self, "presentingViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__MUPlacePhotoGalleryViewController_dismiss__block_invoke;
  v7[3] = &unk_1E2E01970;
  v7[4] = self;
  objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __44__MUPlacePhotoGalleryViewController_dismiss__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "placePhotoGalleryDidFinishDismissing:", *(_QWORD *)(a1 + 32));

  }
}

- (void)didTapOnAttributionView
{
  void *v3;
  char v4;
  id v5;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGallery:attributionViewTappedAtIndex:", self, -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));

  }
}

- (void)didTapOnAdditionalView
{
  void *v3;
  char v4;
  id v5;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGalleryAdditionalViewTapped:", self);

  }
}

- (void)_didTapEditPhotoCreditMenuItem
{
  void *v3;
  char v4;
  id v5;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "placePhotoGalleryDidSelectEditPhotoCredit:", self);

  }
}

- (void)_didTapDeletePhotoMenuItemForImageAtIndex:(unint64_t)a3
{
  void *v5;
  char v6;
  id v7;

  -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "placePhotoGallery:didSelectDeleteImageAtIndex:", self, a3);

  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  -[MUPlacePhotoGalleryViewController updateViewsWithPhotoAtIndex:](self, "updateViewsWithPhotoAtIndex:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView"));
  -[MUPlacePhotoGalleryViewController lastScrollViewOffsetBeforeScrolling](self, "lastScrollViewOffsetBeforeScrolling");
  if (v4 == 0.0)
  {
    objc_msgSend(v5, "contentOffset");
    -[MUPlacePhotoGalleryViewController setLastScrollViewOffsetBeforeScrolling:](self, "setLastScrollViewOffsetBeforeScrolling:");
  }

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  void *v13;
  char v14;
  double v15;
  void *v16;
  char v17;
  void *v18;

  v4 = a3;
  v5 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  objc_msgSend(v4, "contentOffset");
  v7 = v6;

  -[MUPlacePhotoGalleryViewController lastScrollViewOffsetBeforeScrolling](self, "lastScrollViewOffsetBeforeScrolling");
  if (v8 >= v7)
  {
    -[MUPlacePhotoGalleryViewController lastScrollViewOffsetBeforeScrolling](self, "lastScrollViewOffsetBeforeScrolling");
    if (v12 > v7)
    {
      -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_opt_respondsToSelector();

      if ((v14 & 1) != 0)
      {
        -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "placePhotoGalleryDidScrollRightToIndex:", v5);
        goto LABEL_7;
      }
    }
  }
  else
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "placePhotoGalleryDidScrollLeftToIndex:", v5);
LABEL_7:

    }
  }
  -[MUPlacePhotoGalleryViewController lastScrollViewOffsetBeforeScrolling](self, "lastScrollViewOffsetBeforeScrolling");
  if (v15 != v7)
  {
    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_opt_respondsToSelector();

    if ((v17 & 1) != 0)
    {
      -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "placePhotoGalleryDidScrollToIndex:", v5);

    }
  }
  -[MUPlacePhotoGalleryViewController setLastScrollViewOffsetBeforeScrolling:](self, "setLastScrollViewOffsetBeforeScrolling:", 0.0);
  -[MUPlacePhotoGalleryViewController resetPhotosZoomLevel](self, "resetPhotosZoomLevel");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v10[6];
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)MUPlacePhotoGalleryViewController;
  v7 = a4;
  -[MUPlacePhotoGalleryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = 0;
  else
    v9 = v8;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __88__MUPlacePhotoGalleryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v10[3] = &unk_1E2E03EE0;
  v10[4] = self;
  v10[5] = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v10, 0);

}

uint64_t __88__MUPlacePhotoGalleryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  CGRect v9;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_mapsui_isRTL");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "photoViews");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "count") + ~*(_QWORD *)(a1 + 40);

  }
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  objc_msgSend(v6, "setContentOffset:animated:", 0, CGRectGetWidth(v9) * (double)(unint64_t)v2, 0.0);

  return objc_msgSend(*(id *)(a1 + 32), "updateViewsWithPhotoAtIndex:", *(_QWORD *)(a1 + 40));
}

- (void)_updateNavbarVisibility
{
  id v3;

  -[MUPlacePhotoGalleryViewController navigationController](self, "navigationController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController setUIStyleWithNavigationBarHidden:](self, "setUIStyleWithNavigationBarHidden:", objc_msgSend(v3, "isNavigationBarHidden"));

}

- (void)startAnimatingActivityIndicatorViewForRAP
{
  -[MUPlacePhotoGalleryViewController stopAnimatingActivityIndicatorViewForRAP](self, "stopAnimatingActivityIndicatorViewForRAP");
  -[MUPlacePhotoGalleryAttributionView beginAnimatingActivityIndicator](self->_attributionView, "beginAnimatingActivityIndicator");
}

- (void)stopAnimatingActivityIndicatorViewForRAP
{
  -[MUPlacePhotoGalleryAttributionView endAnimatingActivityIndicatorWithError:](self->_attributionView, "endAnimatingActivityIndicatorWithError:", 0);
}

- (void)beginAnimatingActivityIndicator
{
  void *v3;
  void *v4;
  id v5;

  -[MUPlacePhotoGalleryViewController endAnimatingActivityIndicatorWithError:](self, "endAnimatingActivityIndicatorWithError:", 0);
  -[MUPlacePhotoGalleryViewController spinner](self, "spinner");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPlacePhotoGalleryViewController addPhotoBarButtonItem](self, "addPhotoBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCustomView:", v3);

  -[MUPlacePhotoGalleryViewController spinner](self, "spinner");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startAnimating");

}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  void *v4;
  id v5;

  -[MUPlacePhotoGalleryViewController spinner](self, "spinner", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimating");

  -[MUPlacePhotoGalleryViewController addPhotoBarButtonItem](self, "addPhotoBarButtonItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCustomView:", 0);

}

- (void)scrollLeft
{
  unint64_t v3;
  unint64_t v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  CGRect v13;

  v3 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  if (v3)
  {
    v4 = v3;
    -[MUPlacePhotoGalleryViewController scrollViewContentOffset](self, "scrollViewContentOffset");
    v6 = v5;
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "frame");
    v8 = v6 - CGRectGetWidth(v13);

    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setContentOffset:animated:", 0, v8, 0.0);

    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) != 0)
    {
      -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "placePhotoGalleryDidScrollLeftToIndex:", v4 - 1);

    }
  }
}

- (void)scrollRight
{
  unint64_t v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  CGRect v12;

  v3 = -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView");
  if (v3 < -[MUPlacePhotoGalleryViewController viewsCount](self, "viewsCount") - 1)
  {
    -[MUPlacePhotoGalleryViewController scrollViewContentOffset](self, "scrollViewContentOffset");
    v5 = v4;
    -[MUPlacePhotoGalleryViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "frame");
    v7 = v5 + CGRectGetWidth(v12);

    -[MUPlacePhotoGalleryViewController scrollView](self, "scrollView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setContentOffset:animated:", 0, v7, 0.0);

    -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[MUPlacePhotoGalleryViewController delegate](self, "delegate");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "placePhotoGalleryDidScrollRightToIndex:", v3 + 1);

    }
  }
}

- (void)attributionViewDidSelectDeletePhoto:(id)a3
{
  -[MUPlacePhotoGalleryViewController _didTapDeletePhotoMenuItemForImageAtIndex:](self, "_didTapDeletePhotoMenuItemForImageAtIndex:", -[MUPlacePhotoGalleryViewController indexOfVisibleView](self, "indexOfVisibleView", a3));
}

- (MUPlacePhotoGalleryViewControllerDelegate)delegate
{
  return (MUPlacePhotoGalleryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)panAndSwipeToDismissGestureEnabled
{
  return self->_panAndSwipeToDismissGestureEnabled;
}

- (void)setPanAndSwipeToDismissGestureEnabled:(BOOL)a3
{
  self->_panAndSwipeToDismissGestureEnabled = a3;
}

- (BOOL)enablePersonalizedAttribution
{
  return self->_enablePersonalizedAttribution;
}

- (NSArray)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (NSArray)photoViews
{
  return self->_photoViews;
}

- (void)setPhotoViews:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (UIView)additionalView
{
  return self->_additionalView;
}

- (void)setAdditionalView:(id)a3
{
  objc_storeStrong((id *)&self->_additionalView, a3);
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (CGPoint)imageViewCenterPoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_imageViewCenterPoint.x;
  y = self->_imageViewCenterPoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setImageViewCenterPoint:(CGPoint)a3
{
  self->_imageViewCenterPoint = a3;
}

- (int64_t)panGestureStartingDirection
{
  return self->_panGestureStartingDirection;
}

- (void)setPanGestureStartingDirection:(int64_t)a3
{
  self->_panGestureStartingDirection = a3;
}

- (UIView)gestureTrackedView
{
  return self->_gestureTrackedView;
}

- (void)setGestureTrackedView:(id)a3
{
  objc_storeStrong((id *)&self->_gestureTrackedView, a3);
}

- (BOOL)shouldFinishAnimation
{
  return self->_shouldFinishAnimation;
}

- (void)setShouldFinishAnimation:(BOOL)a3
{
  self->_shouldFinishAnimation = a3;
}

- (NSNumber)originalIndex
{
  return self->_originalIndex;
}

- (void)setOriginalIndex:(id)a3
{
  objc_storeStrong((id *)&self->_originalIndex, a3);
}

- (MUPlacePhotoGalleryAttributionView)attributionView
{
  return self->_attributionView;
}

- (void)setAttributionView:(id)a3
{
  objc_storeStrong((id *)&self->_attributionView, a3);
}

- (NSMutableArray)indexesOfDownloadedImages
{
  return self->_indexesOfDownloadedImages;
}

- (void)setIndexesOfDownloadedImages:(id)a3
{
  objc_storeStrong((id *)&self->_indexesOfDownloadedImages, a3);
}

- (NSMutableArray)downloadingImagesURLs
{
  return self->_downloadingImagesURLs;
}

- (void)setDownloadingImagesURLs:(id)a3
{
  objc_storeStrong((id *)&self->_downloadingImagesURLs, a3);
}

- (double)lastScrollViewOffsetBeforeScrolling
{
  return self->_lastScrollViewOffsetBeforeScrolling;
}

- (void)setLastScrollViewOffsetBeforeScrolling:(double)a3
{
  self->_lastScrollViewOffsetBeforeScrolling = a3;
}

- (UIBarButtonItem)openNavigationBarButton
{
  return self->_openNavigationBarButton;
}

- (void)setOpenNavigationBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_openNavigationBarButton, a3);
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (UIBarButtonItem)backBarButtonItem
{
  return self->_backBarButtonItem;
}

- (void)setBackBarButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_backBarButtonItem, a3);
}

- (MUPlaceUserAttributionViewModel)userAttributionViewModel
{
  return self->_userAttributionViewModel;
}

- (void)setUserAttributionViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_userAttributionViewModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAttributionViewModel, 0);
  objc_storeStrong((id *)&self->_backBarButtonItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_openNavigationBarButton, 0);
  objc_storeStrong((id *)&self->_downloadingImagesURLs, 0);
  objc_storeStrong((id *)&self->_indexesOfDownloadedImages, 0);
  objc_storeStrong((id *)&self->_attributionView, 0);
  objc_storeStrong((id *)&self->_originalIndex, 0);
  objc_storeStrong((id *)&self->_gestureTrackedView, 0);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_additionalView, 0);
  objc_storeStrong((id *)&self->_photoViews, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_addPhotoBarButtonItem, 0);
}

@end
