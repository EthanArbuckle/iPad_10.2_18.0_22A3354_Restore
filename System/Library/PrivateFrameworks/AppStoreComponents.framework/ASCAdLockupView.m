@implementation ASCAdLockupView

- (NSString)accessibilityAdvertisement
{
  return (NSString *)ASCLocalizedString(CFSTR("AX_IAD_PRIVACY_MARKER_BUTTON_TITLE"), a2);
}

- (NSString)accessibilityUserRating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  ASCLocalizedFormatString(CFSTR("AX_USER_RATINGS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView lockup](self, "lockup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "productRatingBadge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ASCAdLockupView;
  v3 = *MEMORY[0x1E0DC4660] | -[ASCAdLockupView accessibilityTraits](&v8, sel_accessibilityTraits);
  -[ASCAdLockupView contentView](self, "contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEnabled");

  v6 = *MEMORY[0x1E0DC4698];
  if (v5)
    v6 = 0;
  return v3 | v6;
}

- (id)accessibilityLabel
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
  void *v12;

  -[ASCAdLockupView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 6);
  -[ASCAdLockupView accessibilityAdvertisement](self, "accessibilityAdvertisement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v3, "headingLabelIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "headingLabelIfLoaded");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v7);

  }
  objc_msgSend(v3, "titleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

  objc_msgSend(v3, "subtitleLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  objc_msgSend(v3, "offerStatusLabelIfLoaded");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v3, "offerStatusLabelIfLoaded");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v11);

  }
  ASCAXLabelForElements(v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  -[ASCAdLockupView accessibilityAdvertisement](self, "accessibilityAdvertisement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adTransparencyButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v3);

  v6 = *MEMORY[0x1E0DC4660];
  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "adTransparencyButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityTraits:", v6);

  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "adTransparencyButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  -[ASCAdLockupView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "offerButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  -[ASCAdLockupView mediaView](self, "mediaView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  int v4;
  void *v5;

  -[ASCAdLockupView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEnabled");

  if (!v4)
    return 0;
  -[ASCAdLockupView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendActionsForControlEvents:", 64);

  return -[ASCAdLockupView automaticallyPresentsProductDetails](self, "automaticallyPresentsProductDetails");
}

- (id)accessibilityIdentifier
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

  -[ASCAdLockupView lockup](self, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  if (v5)
  {
    -[ASCAdLockupView lockup](self, "lockup");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "id");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("AdLockup[id=%@]"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ASCAXIdentifierWithSuffix((uint64_t)v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AdLockup"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ASCAXIdentifierWithSuffix((uint64_t)v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (ASCAdLockupView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ASCAdLockupView *v8;
  ASCAdLockupView *v9;
  ASCLockupContentView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  ASCLockupContentView *contentView;
  ASCOfferPresenter *v17;
  ASCOfferPresenter *offerPresenter;
  ASCAppearMetricsPresenter *v19;
  ASCAppearMetricsPresenter *metricsPresenter;
  ASCLockupPresenter *v21;
  ASCLockupPresenter *lockupPresenter;
  ASCAdLockupPresenter *v23;
  ASCAdLockupPresenter *adLockupPresenter;
  ASCAdTransparencyContainerView *v25;
  ASCAdTransparencyContainerView *adTransparencyContainer;
  ASCLockupMediaView *v27;
  ASCLockupMediaView *mediaView;
  ASCLockupMediaPresenter *v29;
  ASCLockupMediaPresenter *lockupMediaPresenter;
  void *v31;
  void *v32;
  uint64_t v33;
  UITapGestureRecognizer *tapGestureRecognizer;
  void *v35;
  void *v36;
  id v37;
  objc_super v39;
  _QWORD v40[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v40[1] = *MEMORY[0x1E0C80C00];
  +[ASCEligibility assertCurrentProcessEligibility]();
  v39.receiver = self;
  v39.super_class = (Class)ASCAdLockupView;
  v8 = -[ASCAdLockupView initWithFrame:](&v39, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    v8->_automaticallyPresentsProductDetails = 1;
    v10 = [ASCLockupContentView alloc];
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = -[ASCLockupContentView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    contentView = v9->_contentView;
    v9->_contentView = (ASCLockupContentView *)v15;

    v17 = -[ASCOfferPresenter initWithView:]([ASCOfferPresenter alloc], "initWithView:", v9->_contentView);
    offerPresenter = v9->_offerPresenter;
    v9->_offerPresenter = v17;

    v19 = -[ASCAppearMetricsPresenter initWithView:]([ASCAppearMetricsPresenter alloc], "initWithView:", v9);
    metricsPresenter = v9->_metricsPresenter;
    v9->_metricsPresenter = v19;

    v21 = -[ASCLockupPresenter initWithView:offerPresenter:metricsPresenter:]([ASCLockupPresenter alloc], "initWithView:offerPresenter:metricsPresenter:", v9->_contentView, v9->_offerPresenter, v9->_metricsPresenter);
    lockupPresenter = v9->_lockupPresenter;
    v9->_lockupPresenter = v21;

    v23 = -[ASCAdLockupPresenter initWithView:lockupPresenter:]([ASCAdLockupPresenter alloc], "initWithView:lockupPresenter:", v9, v9->_lockupPresenter);
    adLockupPresenter = v9->_adLockupPresenter;
    v9->_adLockupPresenter = v23;

    v25 = -[ASCAdTransparencyContainerView initWithFrame:]([ASCAdTransparencyContainerView alloc], "initWithFrame:", v11, v12, v13, v14);
    adTransparencyContainer = v9->_adTransparencyContainer;
    v9->_adTransparencyContainer = v25;

    v27 = -[ASCLockupMediaView initWithFrame:]([ASCLockupMediaView alloc], "initWithFrame:", v11, v12, v13, v14);
    mediaView = v9->_mediaView;
    v9->_mediaView = v27;

    v29 = -[ASCLockupMediaPresenter initWithView:lockupPresenter:]([ASCLockupMediaPresenter alloc], "initWithView:lockupPresenter:", v9->_mediaView, v9->_lockupPresenter);
    lockupMediaPresenter = v9->_lockupMediaPresenter;
    v9->_lockupMediaPresenter = v29;

    -[ASCLockupPresenter setObserver:](v9->_lockupPresenter, "setObserver:", v9);
    -[ASCOfferPresenter setObserver:](v9->_offerPresenter, "setObserver:", v9);
    -[ASCLockupMediaPresenter setObserver:](v9->_lockupMediaPresenter, "setObserver:", v9);
    -[ASCAdLockupView setLayoutMargins:](v9, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCAdLockupView setInsetsLayoutMarginsFromSafeArea:](v9, "setInsetsLayoutMarginsFromSafeArea:", 0);
    +[ASCSemanticColor tint]();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdLockupView setTintColor:](v9, "setTintColor:", v31);

    -[ASCAdLockupView addSubview:](v9, "addSubview:", v9->_mediaView);
    -[ASCAdLockupView addSubview:](v9, "addSubview:", v9->_adTransparencyContainer);
    -[ASCAdLockupView addSubview:](v9, "addSubview:", v9->_contentView);
    -[ASCAdTransparencyContainerView setHidden:](v9->_adTransparencyContainer, "setHidden:", 1);
    +[ASCOfferTheme adTheme](ASCOfferTheme, "adTheme");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupContentView setOfferTheme:](v9->_contentView, "setOfferTheme:", v32);

    -[ASCLockupContentView setLockupSize:](v9->_contentView, "setLockupSize:", 0x1E75650E8);
    -[ASCLockupContentView addOfferTarget:action:](v9->_contentView, "addOfferTarget:action:", v9, sel_performOfferAction);
    -[ASCAdTransparencyContainerView addAdTransparencyTarget:action:](v9->_adTransparencyContainer, "addAdTransparencyTarget:action:", v9, sel_performAdTransparencyAction);
    v33 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", v9, sel_performLockupAction);
    tapGestureRecognizer = v9->_tapGestureRecognizer;
    v9->_tapGestureRecognizer = (UITapGestureRecognizer *)v33;

    -[UITapGestureRecognizer setDelegate:](v9->_tapGestureRecognizer, "setDelegate:", v9);
    -[ASCAdLockupView addGestureRecognizer:](v9, "addGestureRecognizer:", v9->_tapGestureRecognizer);
    -[ASCLockupMediaView addTarget:action:forControlEvents:](v9->_mediaView, "addTarget:action:forControlEvents:", v9, sel_performLockupAction, 64);
    objc_opt_self();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v35;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (id)-[ASCAdLockupView registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v36, sel_setNeedsLayout);

  }
  return v9;
}

- (ASCAdLockupView)initWithCoder:(id)a3
{
  -[ASCAdLockupView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCAdLockupView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

+ (double)topContentViewSpacing
{
  return 15.0;
}

- (BOOL)isLargeSizeClass
{
  double v2;

  -[ASCAdLockupView bounds](self, "bounds");
  return v2 > 726.0;
}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  int v9;
  ASCAdLockupView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ASCAdLockupView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForAdLockupView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ASCAdLockupView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Lockup view %@ is presenting from root view controller", (uint8_t *)&v9, 0xCu);
      }
      v7 = v5;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[ASCAdLockupView presentingViewController].cold.1((uint64_t)self);
    }

  }
  return (UIViewController *)v5;
}

- (void)setAdMarkerHidden:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  self->_adMarkerHidden = a3;
  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v3);

  -[ASCAdLockupView request](self, "request");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView updateLayoutMarginsForContext:](self, "updateLayoutMarginsForContext:", v7);

  -[ASCAdLockupView setNeedsLayout](self, "setNeedsLayout");
  -[ASCAdLockupView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (ASCLockup)lockup
{
  void *v2;
  void *v3;

  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockup *)v3;
}

- (void)setLockup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLockup:", v4);

}

- (ASCLockupViewGroup)group
{
  void *v2;
  void *v3;

  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupViewGroup *)v3;
}

- (void)setGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroup:", v4);

}

- (ASCLockupRequest)request
{
  void *v2;
  void *v3;

  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupRequest *)v3;
}

- (void)setRequest:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int IsAdMaterialContext;
  void *v12;
  ASCMaterialBackgroundView *v13;
  ASCMaterialBackgroundView *v14;
  ASCMaterialBackgroundView *materialBackgroundView;
  ASCMaterialBackgroundView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int IsAdGridContext;
  void *v24;
  ASCGradientBackgroundView *v25;
  ASCGradientBackgroundView *v26;
  ASCGradientBackgroundView *gradientBackgroundView;
  ASCGradientBackgroundView *v28;
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

  v39 = a3;
  -[ASCAdLockupView request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v39, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView mediaView](self, "mediaView");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "setContext:", v6);

  objc_msgSend(v39, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = objc_msgSend(v8, "isEqualToString:", v5);

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v39, "context");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdLockupView updateLayoutMarginsForContext:](self, "updateLayoutMarginsForContext:", v9);

  }
  objc_msgSend(v39, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  IsAdMaterialContext = ASCLockupContextIsAdMaterialContext(v10);

  if (IsAdMaterialContext)
  {
    -[ASCAdLockupView materialBackgroundView](self, "materialBackgroundView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      v13 = [ASCMaterialBackgroundView alloc];
      v14 = -[ASCMaterialBackgroundView initWithFrame:](v13, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      materialBackgroundView = self->_materialBackgroundView;
      self->_materialBackgroundView = v14;

      v16 = self->_materialBackgroundView;
      -[ASCAdLockupView lockupMediaPresenter](self, "lockupMediaPresenter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundView:", v16);

      -[ASCAdLockupView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_materialBackgroundView, 0);
    }
    -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setBackgroundHidden:", 1);

    -[ASCAdLockupView materialBackgroundView](self, "materialBackgroundView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

    -[ASCAdLockupView gradientBackgroundView](self, "gradientBackgroundView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setHidden:", 1);

    +[ASCStaticLockupTheme adTheme](ASCStaticLockupTheme, "adTheme");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v39, "context");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    IsAdGridContext = ASCLockupContextIsAdGridContext(v22);

    if (!IsAdGridContext)
    {
      -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setBackgroundHidden:", 1);

      -[ASCAdLockupView materialBackgroundView](self, "materialBackgroundView");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setHidden:", 1);

      -[ASCAdLockupView gradientBackgroundView](self, "gradientBackgroundView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setHidden:", 1);

      -[ASCAdLockupView contentView](self, "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setLockupTheme:", 0);
      goto LABEL_13;
    }
    -[ASCAdLockupView gradientBackgroundView](self, "gradientBackgroundView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v24)
    {
      v25 = [ASCGradientBackgroundView alloc];
      v26 = -[ASCGradientBackgroundView initWithFrame:](v25, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      gradientBackgroundView = self->_gradientBackgroundView;
      self->_gradientBackgroundView = v26;

      v28 = self->_gradientBackgroundView;
      -[ASCAdLockupView mediaView](self, "mediaView");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAdLockupView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v28, v29);

    }
    -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setBackgroundHidden:", 0);

    -[ASCAdLockupView materialBackgroundView](self, "materialBackgroundView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setHidden:", 1);

    -[ASCAdLockupView gradientBackgroundView](self, "gradientBackgroundView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setHidden:", 0);

    +[ASCStaticLockupTheme adWhiteTheme](ASCStaticLockupTheme, "adWhiteTheme");
    v21 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v21;
  -[ASCAdLockupView contentView](self, "contentView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setLockupTheme:", v33);

LABEL_13:
  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setRequest:", v39);

}

- (id)context
{
  void *v2;
  void *v3;

  -[ASCAdLockupView request](self, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAdTransparencyButtonHidden:(BOOL)a3
{
  uint64_t v4;
  void *v5;

  v4 = -[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden") | a3;
  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", v4);

  -[ASCAdLockupView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDeveloperName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDeveloperName:", v4);

}

- (void)setDelegate:(id)a3
{
  void *v4;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  BOOL v18;
  __int16 v19;
  id v20;

  v20 = a3;
  objc_storeWeak((id *)&self->_delegate, v20);
  v4 = v20;
  if (v20)
  {
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFDF | v9;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v10 = 64;
    else
      v10 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFFBF | v10;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v11 = 128;
    else
      v11 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFF7F | v11;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v12 = 256;
    else
      v12 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFEFF | v12;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v13 = 512;
    else
      v13 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFDFF | v13;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v14 = 1024;
    else
      v14 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xFBFF | v14;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v15 = 2048;
    else
      v15 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xF7FF | v15;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v16 = 4096;
    else
      v16 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xEFFF | v16;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v17 = 0x2000;
    else
      v17 = 0;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xDFFF | v17;
    v18 = (objc_opt_respondsToSelector() & 1) == 0;
    v4 = v20;
    if (v18)
      v19 = 0;
    else
      v19 = 0x4000;
    *(_WORD *)&self->_delegateRespondsTo = *(_WORD *)&self->_delegateRespondsTo & 0xBFFF | v19;
  }
  else
  {
    *(_WORD *)&self->_delegateRespondsTo &= 0x8000u;
  }

}

- (BOOL)isHighlighted
{
  void *v2;
  char v3;

  -[ASCAdLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isHighlighted");

  return v3;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCAdLockupView contentView](self, "contentView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHighlighted:", v3);

}

- (BOOL)automaticallyGeneratesAppearMetrics
{
  void *v2;
  char v3;

  -[ASCAdLockupView metricsPresenter](self, "metricsPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setAutomaticallyGeneratesAppearMetrics:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCAdLockupView metricsPresenter](self, "metricsPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (id)appearMetricsActivity
{
  void *v2;
  void *v3;

  -[ASCAdLockupView metricsPresenter](self, "metricsPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setAppearMetricsActivity:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAdLockupView metricsPresenter](self, "metricsPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActivity:", v4);

}

- (id)offerTheme
{
  void *v2;
  void *v3;

  -[ASCAdLockupView contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "offerTheme");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setOfferTheme:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCAdLockupView contentView](self, "contentView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setOfferTheme:", v4);

}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[ASCAdLockupView setNeedsLayout](self, "setNeedsLayout");
  -[ASCAdLockupView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setLayoutMargins:(UIEdgeInsets)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView setLayoutMargins:](&v6, sel_setLayoutMargins_, a3.top, a3.left, a3.bottom, a3.right);
  -[ASCAdLockupView request](self, "request");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView updateLayoutMarginsForContext:](self, "updateLayoutMarginsForContext:", v5);

}

- (void)updateLayoutMarginsForContext:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  int IsAdGridContext;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  id v21;

  v4 = a3;
  -[ASCAdLockupView layoutMargins](self, "layoutMargins");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if (!-[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden"))
    v6 = 0.0;
  IsAdGridContext = ASCLockupContextIsAdGridContext(v4);

  if (!IsAdGridContext)
    v10 = 0.0;
  -[ASCAdLockupView layoutMargins](self, "layoutMargins");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[ASCAdLockupView contentView](self, "contentView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLayoutMargins:", v6, v8, v10, v12);

  -[ASCAdLockupView mediaView](self, "mediaView");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLayoutMargins:", 0.0, v15, v17, v19);

}

- (void)setHidden:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView setHidden:](&v5, sel_setHidden_, a3);
  -[ASCAdLockupView metricsPresenter](self, "metricsPresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewDidSetHidden");

}

- (void)updateVisibility:(int64_t)a3
{
  void *v3;
  id v4;

  if ((unint64_t)(a3 - 1) >= 2)
  {
    if (a3)
      return;
    -[ASCAdLockupView mediaView](self, "mediaView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "playVideo");
  }
  else
  {
    -[ASCAdLockupView mediaView](self, "mediaView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseVideo");
  }

}

- (BOOL)isVideoLoopingEnabled
{
  void *v2;
  char v3;

  -[ASCAdLockupView mediaView](self, "mediaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideoLoopingEnabled");

  return v3;
}

- (void)setVideoLoopingEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCAdLockupView mediaView](self, "mediaView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoLoopingEnabled:", v3);

}

- (BOOL)isVideoMuted
{
  void *v2;
  char v3;

  -[ASCAdLockupView mediaView](self, "mediaView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVideoMuted");

  return v3;
}

- (void)setVideoMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCAdLockupView mediaView](self, "mediaView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setVideoMuted:", v3);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView didMoveToWindow](&v4, sel_didMoveToWindow);
  -[ASCAdLockupView metricsPresenter](self, "metricsPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewDidMoveToWindow");

}

- (void)invalidateIntrinsicContentSize
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "adLockupViewDidInvalidateIntrinsicContentSize:", self);

  }
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGSize result;

  -[ASCAdLockupView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView bounds](self, "bounds");
  objc_msgSend(v3, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;

  -[ASCAdLockupView mediaView](self, "mediaView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "intrinsicContentSize");
  v12 = v11;

  if (v12 > 2.22044605e-16)
  {
    objc_opt_self();
    v12 = v12 + 10.0;
  }
  v13 = v9 + v12;
  if (!-[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden"))
  {
    -[ASCAdLockupView layoutMargins](self, "layoutMargins");
    v15 = v14;
    +[ASCAdLockupView topContentViewSpacing](ASCAdLockupView, "topContentViewSpacing");
    v13 = v13 + v15 + v16;
    if (!-[ASCAdLockupView isLargeSizeClass](self, "isLargeSizeClass"))
    {
      -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAdLockupView bounds](self, "bounds");
      objc_msgSend(v17, "sizeThatFits:", v18, v19);
      v21 = v20;

      v13 = v13 + v21;
    }
  }
  v22 = v7;
  v23 = v13;
  result.height = v23;
  result.width = v22;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCAdLockupView contentView](self, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeThatFits:", width, height);
  v8 = v7;
  v10 = v9;

  -[ASCAdLockupView mediaView](self, "mediaView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sizeThatFits:", width, height);
  v13 = v12;

  if (v13 > 2.22044605e-16)
  {
    objc_opt_self();
    v13 = v13 + 10.0;
  }
  v14 = v10 + v13;
  if (!-[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden"))
  {
    -[ASCAdLockupView layoutMargins](self, "layoutMargins");
    v16 = v15;
    +[ASCAdLockupView topContentViewSpacing](ASCAdLockupView, "topContentViewSpacing");
    v14 = v14 + v16 + v17;
    if (!-[ASCAdLockupView isLargeSizeClass](self, "isLargeSizeClass"))
    {
      -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAdLockupView bounds](self, "bounds");
      objc_msgSend(v18, "sizeThatFits:", v19, v20);
      v22 = v21;

      v14 = v14 + v22;
    }
  }
  v23 = v8;
  v24 = v14;
  result.height = v24;
  result.width = v23;
  return result;
}

- (void)layoutAdContentView
{
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  _BOOL4 IsEmpty;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat MinX;
  double v18;
  id v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  -[ASCAdLockupView bounds](self, "bounds");
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  IsEmpty = CGRectIsEmpty(v20);
  -[ASCAdLockupView contentView](self, "contentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v8;
  if (IsEmpty)
  {
    v9 = x;
    v10 = y;
    v11 = width;
    v12 = height;
  }
  else
  {
    objc_msgSend(v8, "sizeThatFits:", width, height);
    v14 = v13;
    v16 = v15;

    v21.origin.x = x;
    v21.origin.y = y;
    v21.size.width = width;
    v21.size.height = height;
    if (vabdd_f64(CGRectGetWidth(v21), v14) > 1.0
      || (v22.origin.x = x,
          v22.origin.y = y,
          v22.size.width = width,
          v22.size.height = height,
          vabdd_f64(CGRectGetHeight(v22), v16) > 1.0))
    {
      if (layoutAdContentView_onceToken != -1)
        dispatch_once(&layoutAdContentView_onceToken, &__block_literal_global_0);
    }
    v23.origin.x = x;
    v23.origin.y = y;
    v23.size.width = width;
    v23.size.height = height;
    MinX = CGRectGetMinX(v23);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    v18 = floor(CGRectGetMidY(v24) + v16 * -0.5);
    -[ASCAdLockupView contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v8;
    v9 = MinX;
    v10 = v18;
    v11 = v14;
    v12 = v16;
  }
  objc_msgSend(v8, "setFrame:", v9, v10, v11, v12);

}

void __38__ASCAdLockupView_layoutAdContentView__block_invoke()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v0 = 136446210;
    v1 = "-[ASCAdLockupView layoutAdContentView]_block_invoke";
    _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "*** %{public}s: Frame size does not match intrinsicContentSize, break on _ASCLockupView_incorrectFrameSize to debug", (uint8_t *)&v0, 0xCu);
  }
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double MaxY;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  int IsAdGridContext;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  CGFloat v55;
  CGFloat v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  objc_super v61;
  CGRect v62;
  CGRect v63;

  v61.receiver = self;
  v61.super_class = (Class)ASCAdLockupView;
  -[ASCAdLockupView layoutSubviews](&v61, sel_layoutSubviews);
  -[ASCAdLockupView layoutAdContentView](self, "layoutAdContentView");
  -[ASCAdLockupView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v60 = v5;
  if (-[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden"))
  {
    v11 = v4;
    v12 = 0.0;
  }
  else
  {
    -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v10;
    objc_msgSend(v13, "sizeThatFits:", v8, v10);
    v15 = v14;

    -[ASCAdLockupView layoutMargins](self, "layoutMargins");
    v17 = v8 * 0.5 - v16;
    if (-[ASCAdLockupView isLargeSizeClass](self, "isLargeSizeClass"))
    {
      -[ASCAdLockupView contentView](self, "contentView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lockupSize");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAdLockupView traitCollection](self, "traitCollection");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = ASCLockupViewSizeGetIconSize(v19, objc_msgSend(v20, "horizontalSizeClass")) * 0.5;

      v17 = v17 - (v21 + 15.0);
    }
    -[ASCAdLockupView layoutMargins](self, "layoutMargins", *(_QWORD *)&v17);
    v23 = v22;
    -[ASCAdLockupView layoutMargins](self, "layoutMargins");
    v25 = v24;
    -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v15;
    v56 = v15;
    v11 = v4;
    +[__ASCLayoutProxy rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:](__ASCLayoutProxy, "rectWithLayoutDirectionForRect:inTraitEnvironment:relativeTo:", v26, v23, v25, v17, v27, v4, v6, v8, v58);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

    if (-[ASCAdLockupView isLargeSizeClass](self, "isLargeSizeClass"))
    {
      -[ASCAdLockupView layoutMargins](self, "layoutMargins");
    }
    else
    {
      v62.origin.x = v23;
      v62.origin.y = v25;
      v62.size.width = v55;
      v62.size.height = v56;
      MaxY = CGRectGetMaxY(v62);
    }
    v38 = MaxY;
    +[ASCAdLockupView topContentViewSpacing](ASCAdLockupView, "topContentViewSpacing");
    v12 = v38 + v39;
    v10 = v58;
  }
  -[ASCAdLockupView contentView](self, "contentView");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sizeThatFits:", v8, v10);
  v59 = v41;
  v43 = v42;

  -[ASCAdLockupView request](self, "request");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "context");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  IsAdGridContext = ASCLockupContextIsAdGridContext(v45);

  if (IsAdGridContext)
  {
    v63.origin.x = v11;
    v47 = v60;
    v63.origin.y = v60;
    v63.size.width = v8;
    v63.size.height = v10;
    v12 = CGRectGetMaxY(v63) - v43;
    v48 = 0.0;
    v57 = v10;
  }
  else
  {
    objc_opt_self();
    v49 = v10 - v43 + -10.0;
    if (v49 < 0.0)
      v49 = 0.0;
    v57 = v49;
    v48 = v12 + v43 + 10.0;
    v47 = v60;
  }
  -[ASCAdLockupView contentView](self, "contentView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", 0.0, v12, v59, v43);

  -[ASCAdLockupView mediaView](self, "mediaView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "setFrame:", 0.0, v48, v8, v57);

  -[ASCAdLockupView materialBackgroundView](self, "materialBackgroundView");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setFrame:", v11, v47, v8, v10);

  -[ASCAdLockupView gradientBackgroundView](self, "gradientBackgroundView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", v11, v47, v8, v10);

  -[ASCAdLockupView lockupMediaPresenter](self, "lockupMediaPresenter");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "viewDidLayoutSubviews");

}

- (NSString)description
{
  ASCDescriber *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCAdLockupView adTransparencyContainer](self, "adTransparencyContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v4, CFSTR("adTransparencyContainer"));

  -[ASCAdLockupView contentView](self, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("contentView"));

  -[ASCAdLockupView mediaView](self, "mediaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v6, CFSTR("mediaView"));

  -[ASCAdLockupView offerPresenter](self, "offerPresenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("offerPresenter"));

  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v8, CFSTR("lockupPresenter"));

  -[ASCAdLockupView adLockupPresenter](self, "adLockupPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("adLockupPresenter"));

  -[ASCAdLockupView lockupMediaPresenter](self, "lockupMediaPresenter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("lockupMediaPresenter"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[ASCAdLockupView isAdMarkerHidden](self, "isAdMarkerHidden"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("adMarkerHidden"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (void)presentProductDetailsViewController
{
  void *v3;
  void *v4;
  void *v5;
  ASCLockupProductDetails *v6;
  void *v7;
  void *v8;
  ASCLockupProductDetails *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t, int);
  void *v14;
  id v15;
  id location;

  -[ASCAdLockupView lockup](self, "lockup");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[ASCAdLockupView metricsParametersForPresentingProductDetails](self, "metricsParametersForPresentingProductDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdLockupView presentingViewController](self, "presentingViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = [ASCLockupProductDetails alloc];
      -[ASCAdLockupView storeSheetHostBundleID](self, "storeSheetHostBundleID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASCAdLockupView storeSheetUsageContext](self, "storeSheetUsageContext");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[ASCLockupProductDetails initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:](v6, "initWithLockup:storeSheetHostBundleID:storeSheetUsageContext:parameters:", v3, v7, v8, v4);

      objc_initWeak(&location, self);
      v11 = MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __54__ASCAdLockupView_presentProductDetailsViewController__block_invoke;
      v14 = &unk_1E75602E0;
      objc_copyWeak(&v15, &location);
      -[ASCLockupProductDetails presentFromViewController:animated:completion:](v9, "presentFromViewController:animated:completion:", v5, 1, &v11);
      -[ASCAdLockupView metricsPresenter](self, "metricsPresenter", v11, v12, v13, v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "viewDidAction");

      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);

    }
  }

}

void __54__ASCAdLockupView_presentProductDetailsViewController__block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  _WORD *WeakRetained;
  void *v6;
  _WORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((WeakRetained[208] & 0x80) != 0 && a3)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adLockupView:didPresentProductDetails:", v7, a2);

    WeakRetained = v7;
  }

}

- (void)performLockupAction
{
  void *v3;
  _QWORD v4[5];

  -[ASCAdLockupView lockupPresenter](self, "lockupPresenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__ASCAdLockupView_performLockupAction__block_invoke;
  v4[3] = &unk_1E7560308;
  v4[4] = self;
  objc_msgSend(v3, "retryRequestIfNeeded:", v4);

}

uint64_t __38__ASCAdLockupView_performLockupAction__block_invoke(uint64_t result, char a2)
{
  uint64_t v2;

  if ((a2 & 1) == 0)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(result + 32), "automaticallyPresentsProductDetails");
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v2 + 32), "presentProductDetailsViewController");
  }
  return result;
}

- (void)performOfferAction
{
  id v2;

  -[ASCAdLockupView offerPresenter](self, "offerPresenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performOfferAction");

}

- (void)performAdTransparencyAction
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x200) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adLockupViewDidSelectAdMarker:", self);

  }
}

- (id)metricsActivityForPresentingProductDetails
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x10) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCAdLockupView offerPresenter](self, "offerPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mostRecentAppState");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "metricsActivityForPresentingProductDetailsOfAdLockupView:inState:", self, v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)metricsParametersFromMetricsActivity:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "fields");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("redirectUrlParameters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(CFSTR("https://?"), "stringByAppendingString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3998]), "initWithString:", v5);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(v6, "queryItems", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v13, "value");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "name");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)metricsParametersForPresentingProductDetails
{
  void *v3;
  void *v4;

  -[ASCAdLockupView metricsActivityForPresentingProductDetails](self, "metricsActivityForPresentingProductDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCAdLockupView metricsParametersFromMetricsActivity:](self, "metricsParametersFromMetricsActivity:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)lockupPresenterDidBeginRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 1) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adLockupViewDidBeginRequest:", self);

  }
}

- (void)lockupPresenterDidFinishRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 2) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adLockupViewDidFinishRequest:", self);

  }
}

- (void)lockupPresenterDidFailRequestWithError:(id)a3
{
  id v4;
  id v5;

  if ((*(_WORD *)&self->_delegateRespondsTo & 4) != 0)
  {
    v4 = a3;
    -[ASCAdLockupView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adLockupView:didFailRequestWithError:", self, v4);

  }
}

- (void)offerPresenterDidObserveChangeToState:(id)a3
{
  id v4;
  id v5;

  if ((*(_WORD *)&self->_delegateRespondsTo & 8) != 0)
  {
    v4 = a3;
    -[ASCAdLockupView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adLockupView:appStateDidChange:", self, v4);

  }
}

- (void)offerPresenterWillPerformActionOfOffer:(id)a3 inState:(id)a4 withActivity:(id *)a5 inContext:(id *)a6
{
  id v9;
  __int16 delegateRespondsTo;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  if ((delegateRespondsTo & 0x20) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "metricsActivityForAdLockupView:toPerformActionOfOffer:inState:", self, v13, v9);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    delegateRespondsTo = (__int16)self->_delegateRespondsTo;
  }
  if ((delegateRespondsTo & 0x100) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "adLockupView:didSelectOfferWithState:", self, v9);

  }
}

- (void)offerPresenterPreprocessOffer:(id)a3 inState:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if ((*(_WORD *)&self->_delegateRespondsTo & 0x2000) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __73__ASCAdLockupView_offerPresenterPreprocessOffer_inState_completionBlock___block_invoke;
    v13[3] = &unk_1E7560330;
    v14 = v11;
    objc_msgSend(v12, "adLockupView:preprocessOffer:inState:completionBlock:", self, v8, v9, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
  }

}

uint64_t __73__ASCAdLockupView_offerPresenterPreprocessOffer_inState_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)lockupMediaPresenterDidBeginScreenshotsFetchRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x400) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adLockupViewDidBeginScreenshotsFetchRequest:", self);

  }
}

- (void)lockupMediaPresenterDidCancelScreenshotsFetchRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x800) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adLockupViewDidCancelScreenshotsFetchRequest:", self);

  }
}

- (void)lockupMediaPresenterDidFinishScreenshotsFetchRequest
{
  id v3;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x1000) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "adLockupViewDidFinishScreenshotsFetchRequest:", self);

  }
}

- (void)lockupMediaPresenterVideoStateDidChange:(int64_t)a3
{
  id v5;

  if ((*(_WORD *)&self->_delegateRespondsTo & 0x4000) != 0)
  {
    -[ASCAdLockupView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "adLockupView:videoStateDidChange:", self, a3);

  }
}

- (ASCAdLockupViewDelegate)delegate
{
  return (ASCAdLockupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)automaticallyPresentsProductDetails
{
  return self->_automaticallyPresentsProductDetails;
}

- (void)setAutomaticallyPresentsProductDetails:(BOOL)a3
{
  self->_automaticallyPresentsProductDetails = a3;
}

- (BOOL)isAdMarkerHidden
{
  return self->_adMarkerHidden;
}

- (ASCAdTransparencyContainerView)adTransparencyContainer
{
  return self->_adTransparencyContainer;
}

- (ASCLockupContentView)contentView
{
  return self->_contentView;
}

- (ASCLockupMediaView)mediaView
{
  return self->_mediaView;
}

- (ASCMaterialBackgroundView)materialBackgroundView
{
  return self->_materialBackgroundView;
}

- (ASCGradientBackgroundView)gradientBackgroundView
{
  return self->_gradientBackgroundView;
}

- (ASCOfferPresenter)offerPresenter
{
  return self->_offerPresenter;
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCLockupPresenter)lockupPresenter
{
  return self->_lockupPresenter;
}

- (ASCAdLockupPresenter)adLockupPresenter
{
  return self->_adLockupPresenter;
}

- (ASCLockupMediaPresenter)lockupMediaPresenter
{
  return self->_lockupMediaPresenter;
}

- (NSString)storeSheetHostBundleID
{
  return self->_storeSheetHostBundleID;
}

- (void)setStoreSheetHostBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, a3);
}

- (NSString)storeSheetUsageContext
{
  return self->_storeSheetUsageContext;
}

- (void)setStoreSheetUsageContext:(id)a3
{
  objc_storeStrong((id *)&self->_storeSheetUsageContext, a3);
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_storeSheetUsageContext, 0);
  objc_storeStrong((id *)&self->_storeSheetHostBundleID, 0);
  objc_storeStrong((id *)&self->_lockupMediaPresenter, 0);
  objc_storeStrong((id *)&self->_adLockupPresenter, 0);
  objc_storeStrong((id *)&self->_lockupPresenter, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
  objc_storeStrong((id *)&self->_offerPresenter, 0);
  objc_storeStrong((id *)&self->_gradientBackgroundView, 0);
  objc_storeStrong((id *)&self->_materialBackgroundView, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_adTransparencyContainer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)presentingViewController
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Lockup view %@ could not find view controller to present from.", (uint8_t *)&v1, 0xCu);
}

@end
