@implementation ASCLockupContentView

- (BOOL)isOfferButtonOnlyLockup
{
  void *v3;
  const char *v4;
  char IsMediumOfferButton;
  void *v6;
  const char *v7;

  -[ASCLockupContentView lockupSize](self, "lockupSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((ASCLockupViewSizeIsSmallOfferButton(v3, v4) & 1) != 0)
  {
    IsMediumOfferButton = 1;
  }
  else
  {
    -[ASCLockupContentView lockupSize](self, "lockupSize");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    IsMediumOfferButton = ASCLockupViewSizeIsMediumOfferButton(v6, v7);

  }
  return IsMediumOfferButton;
}

+ (BOOL)isSmallOfferButtonLockupForSize:(id)a3
{
  return ASCLockupViewSizeIsSmallOfferButton(a3, a2);
}

- (BOOL)isSmallOfferButtonOnlyLockup
{
  void *v2;
  BOOL v3;

  -[ASCLockupContentView lockupSize](self, "lockupSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[ASCLockupContentView isSmallOfferButtonLockupForSize:](ASCLockupContentView, "isSmallOfferButtonLockupForSize:", v2);

  return v3;
}

- (BOOL)isMiniLockup
{
  void *v2;
  const char *v3;
  char IsMini;

  -[ASCLockupContentView lockupSize](self, "lockupSize");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  IsMini = ASCLockupViewSizeIsMini(v2, v3);

  return IsMini;
}

+ (BOOL)isOfferButtonFixedHeightForSize:(id)a3
{
  id v3;
  const char *v4;
  const char *v5;
  char IsLargeAppAd;

  v3 = a3;
  if ((ASCLockupViewSizeIsLargeAppShowcase(v3, v4) & 1) != 0)
    IsLargeAppAd = 1;
  else
    IsLargeAppAd = ASCLockupViewSizeIsLargeAppAd(v3, v5);

  return IsLargeAppAd;
}

+ (BOOL)offerButtonShouldTopAlignForSize:(id)a3
{
  id v4;
  const char *v5;
  double v6;
  char IsMediumOfferButton;

  v4 = a3;
  if ((objc_msgSend(a1, "isOfferButtonFixedHeightForSize:", v4) & 1) != 0
    || (objc_msgSend(a1, "offerButtonTopPaddingForSize:", v4), v6 > 0.0))
  {
    IsMediumOfferButton = 1;
  }
  else
  {
    IsMediumOfferButton = ASCLockupViewSizeIsMediumOfferButton(v4, v5);
  }

  return IsMediumOfferButton;
}

+ (double)offerButtonTopPaddingForSize:(id)a3
{
  return 0.0;
}

+ (BOOL)offerButtonShouldExpandBackgroundForSize:(id)a3
{
  return ASCLockupViewSizeIsMediumOfferButton(a3, a2);
}

- (BOOL)shouldHideHeading
{
  BOOL v3;

  v3 = -[ASCLockupContentView isOfferButtonOnlyLockup](self, "isOfferButtonOnlyLockup");
  if (!v3)
    -[ASCLockupContentView isMiniLockup](self, "isMiniLockup");
  return v3;
}

- (BOOL)shouldHideSubtitle
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[ASCLockupContentView isOfferButtonOnlyLockup](self, "isOfferButtonOnlyLockup"))
    return 1;
  if (-[ASCLockupContentView isMiniLockup](self, "isMiniLockup"))
  {
    -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    v3 = v6 != 0;
    if (!v6)
      -[ASCLockupContentView isMiniLockup](self, "isMiniLockup");

  }
  else
  {
    -[ASCLockupContentView isMiniLockup](self, "isMiniLockup");
    return 0;
  }
  return v3;
}

- (BOOL)shouldHideOfferStatus
{
  return -[ASCLockupContentView isOfferButtonOnlyLockup](self, "isOfferButtonOnlyLockup")
      || -[ASCLockupContentView isMiniLockup](self, "isMiniLockup");
}

- (ASCLockupContentView)initWithFrame:(CGRect)a3
{
  ASCLockupContentView *v3;
  ASCLockupContentView *v4;
  ASCArtworkView *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  ASCArtworkView *iconArtworkView;
  ASCSkeletonLabel *v12;
  ASCSkeletonLabel *titleLabel;
  ASCSkeletonLabel *v14;
  ASCSkeletonLabel *subtitleLabel;
  ASCOfferButton *v16;
  ASCOfferButton *offerButton;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  objc_super v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)ASCLockupContentView;
  v3 = -[ASCLockupContentView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    objc_storeStrong((id *)&v3->_lockupSize, CFSTR("small"));
    v5 = [ASCArtworkView alloc];
    v6 = *MEMORY[0x1E0C9D648];
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v10 = -[ASCArtworkView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], v7, v8, v9);
    iconArtworkView = v4->_iconArtworkView;
    v4->_iconArtworkView = (ASCArtworkView *)v10;

    v12 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    v14 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v6, v7, v8, v9);
    subtitleLabel = v4->_subtitleLabel;
    v4->_subtitleLabel = v14;

    v16 = -[ASCOfferButton initWithFrame:]([ASCOfferButton alloc], "initWithFrame:", v6, v7, v8, v9);
    offerButton = v4->_offerButton;
    v4->_offerButton = v16;

    -[ASCLockupContentView setLayoutMargins:](v4, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCLockupContentView setInsetsLayoutMarginsFromSafeArea:](v4, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[ASCLockupContentView addSubview:](v4, "addSubview:", v4->_iconArtworkView);
    -[ASCLockupContentView addSubview:](v4, "addSubview:", v4->_titleLabel);
    -[ASCLockupContentView addSubview:](v4, "addSubview:", v4->_subtitleLabel);
    -[ASCLockupContentView updateLockupTheme](v4);
    -[ASCOfferButton setDelegate:](v4->_offerButton, "setDelegate:", v4);
    -[ASCLockupContentView addSubview:](v4, "addSubview:", v4->_offerButton);
    -[ASCLockupContentView updateOfferLayoutPropertiesForSize:](v4, v4->_lockupSize);
    -[ASCLockupContentView updateOfferTheme](v4);
    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.icon"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCArtworkView setAccessibilityIdentifier:](v4->_iconArtworkView, "setAccessibilityIdentifier:", v18);

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.title"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setAccessibilityIdentifier:](v4->_titleLabel, "setAccessibilityIdentifier:", v19);

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.subtitle"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setAccessibilityIdentifier:](v4->_subtitleLabel, "setAccessibilityIdentifier:", v20);

    objc_opt_self();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (id)-[ASCLockupContentView registerForTraitChanges:withAction:](v4, "registerForTraitChanges:withAction:", v22, sel_onPreferredContentSizeCategoryChange);

  }
  return v4;
}

- (void)updateLockupTheme
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    +[ASCDefaultLockupTheme sharedTheme](ASCDefaultLockupTheme, "sharedTheme");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "traitCollection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "applyToLockupContentView:compatibleWithTraitCollection:", a1, v3);

    objc_msgSend(a1, "lockupTheme");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "applyToLockupContentView:compatibleWithTraitCollection:", a1, v4);

  }
}

- (void)updateOfferLayoutPropertiesForSize:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  _BOOL8 v15;
  id v16;

  if (a1)
  {
    v3 = a2;
    ASCLockupViewSizeGetOfferButtonSize(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "offerButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSize:", v4);

    v6 = ASCLockupViewSizeOfferButtonSubtitlePosition(v3);
    objc_msgSend(a1, "offerButton");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitlePosition:", v6);

    v8 = +[ASCLockupContentView isOfferButtonFixedHeightForSize:](ASCLockupContentView, "isOfferButtonFixedHeightForSize:", v3);
    objc_msgSend(a1, "offerButton");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFixedHeight:", v8);

    v10 = +[ASCLockupContentView offerButtonShouldTopAlignForSize:](ASCLockupContentView, "offerButtonShouldTopAlignForSize:", v3);
    objc_msgSend(a1, "offerButton");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShouldTopAlign:", v10);

    +[ASCLockupContentView offerButtonTopPaddingForSize:](ASCLockupContentView, "offerButtonTopPaddingForSize:", v3);
    v13 = v12;
    objc_msgSend(a1, "offerButton");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTopPadding:", v13);

    v15 = +[ASCLockupContentView offerButtonShouldExpandBackgroundForSize:](ASCLockupContentView, "offerButtonShouldExpandBackgroundForSize:", v3);
    objc_msgSend(a1, "offerButton");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setShouldExpandBackground:", v15);

  }
}

- (void)updateOfferTheme
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (a1)
  {
    objc_msgSend(a1, "offerTheme");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(a1, "offerTheme");
      v3 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v10 = (id)v3;
      objc_msgSend(a1, "offerButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setTheme:", v10);

      return;
    }
    objc_msgSend(a1, "titleLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "skeleton");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      objc_msgSend(a1, "subtitleLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "skeleton");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        +[ASCOfferTheme loadingTheme](ASCOfferTheme, "loadingTheme");
        v3 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
    }
    else
    {

    }
    -[ASCLockupContentView defaultOfferTheme](a1);
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
}

- (ASCLockupContentView)initWithCoder:(id)a3
{
  -[ASCLockupContentView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCLockupContentView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (UILabel)offerStatusLabel
{
  UILabel **p_offerStatusLabelIfLoaded;
  UILabel *offerStatusLabelIfLoaded;
  UILabel *v4;
  id v6;
  void *v7;

  p_offerStatusLabelIfLoaded = &self->_offerStatusLabelIfLoaded;
  offerStatusLabelIfLoaded = self->_offerStatusLabelIfLoaded;
  if (offerStatusLabelIfLoaded)
  {
    v4 = offerStatusLabelIfLoaded;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setSemanticContentAttribute:](v4, "setSemanticContentAttribute:", -[ASCLockupContentView semanticContentAttribute](self, "semanticContentAttribute"));
    -[ASCLockupContentView addSubview:](self, "addSubview:", v4);
    objc_storeStrong((id *)p_offerStatusLabelIfLoaded, v4);
    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.offerStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](*p_offerStatusLabelIfLoaded, "setAccessibilityIdentifier:", v7);

    -[ASCLockupContentView updateLockupTheme](self);
  }
  return v4;
}

- (UILabel)headingLabel
{
  UILabel **p_headingLabelIfLoaded;
  UILabel *headingLabelIfLoaded;
  UILabel *v4;
  id v6;
  void *v7;

  p_headingLabelIfLoaded = &self->_headingLabelIfLoaded;
  headingLabelIfLoaded = self->_headingLabelIfLoaded;
  if (headingLabelIfLoaded)
  {
    v4 = headingLabelIfLoaded;
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x1E0DC3990]);
    v4 = (UILabel *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setSemanticContentAttribute:](v4, "setSemanticContentAttribute:", -[ASCLockupContentView semanticContentAttribute](self, "semanticContentAttribute"));
    -[ASCLockupContentView addSubview:](self, "addSubview:", v4);
    objc_storeStrong((id *)p_headingLabelIfLoaded, v4);
    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.heading"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setAccessibilityIdentifier:](*p_headingLabelIfLoaded, "setAccessibilityIdentifier:", v7);

    -[ASCLockupContentView updateLockupTheme](self);
  }
  return v4;
}

- (CGSize)preferredIconSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setLockupSize:(id)a3
{
  NSString *v5;
  NSString *v6;
  char v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  NSString *v18;

  v18 = (NSString *)a3;
  v5 = self->_lockupSize;
  v6 = v5;
  if (v18 && v5)
  {
    v7 = -[NSString isEqual:](v5, "isEqual:");

    if ((v7 & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  if (v6 != v18)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_lockupSize, a3);
    -[ASCLockupContentView updateLockupTheme](self);
    -[ASCLockupContentView updateOfferLayoutPropertiesForSize:](self, v18);
    -[ASCLockupContentView updateOfferTheme](self);
    v8 = -[ASCLockupContentView shouldHideIconArtwork](self, "shouldHideIconArtwork");
    -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

    v10 = -[ASCLockupContentView shouldHideTitle](self, "shouldHideTitle");
    -[ASCLockupContentView titleLabel](self, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v10);

    v12 = -[ASCLockupContentView shouldHideSubtitle](self, "shouldHideSubtitle");
    -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", v12);

    v14 = -[ASCLockupContentView shouldHideHeading](self, "shouldHideHeading");
    -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", v14);

    v16 = -[ASCLockupContentView shouldHideOfferStatus](self, "shouldHideOfferStatus");
    -[ASCLockupContentView offerStatusLabelIfLoaded](self, "offerStatusLabelIfLoaded");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setHidden:", v16);

    -[ASCLockupContentView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[ASCLockupContentView setNeedsLayout](self, "setNeedsLayout");
  }
LABEL_7:

}

- (UIColor)loadingColor
{
  void *v2;
  void *v3;

  -[ASCLockupContentView titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "skeletonColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setLoadingColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v12 = v4;
  if (v4)
  {
    v5 = v4;
    -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPlaceholderColor:", v5);

    v7 = v5;
    v8 = v7;
  }
  else
  {
    +[ASCSemanticColor artworkPlaceholder]();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setPlaceholderColor:", v8);

    +[ASCSemanticColor loading]();
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[ASCLockupContentView titleLabel](self, "titleLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSkeletonColor:", v7);

  -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSkeletonColor:", v7);

}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ASCLockupContentView;
  -[ASCLockupContentView setHighlighted:](&v6, sel_setHighlighted_);
  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHighlighted:", v3);

}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ASCLockupContentView;
  -[ASCLockupContentView setSemanticContentAttribute:](&v11, sel_setSemanticContentAttribute_);
  -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSemanticContentAttribute:", a3);

  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSemanticContentAttribute:", a3);

  -[ASCLockupContentView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSemanticContentAttribute:", a3);

  -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSemanticContentAttribute:", a3);

  -[ASCLockupContentView offerStatusLabelIfLoaded](self, "offerStatusLabelIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSemanticContentAttribute:", a3);

  -[ASCLockupContentView offerButton](self, "offerButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSemanticContentAttribute:", a3);

}

- (id)makeLayout
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

  -[ASCLockupContentView lockupSize](self, "lockupSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView offerStatusLabelIfLoaded](self, "offerStatusLabelIfLoaded");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView offerButton](self, "offerButton");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView badgeView](self, "badgeView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy lockupLayoutOfSize:traitCollection:artworkView:headingText:titleText:subtitleText:offerText:offerButton:badge:](__ASCLayoutProxy, "lockupLayoutOfSize:traitCollection:artworkView:headingText:titleText:subtitleText:offerText:offerButton:badge:", v3, v4, v5, v6, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)minimumLockupHeight
{
  void *v2;
  double v3;
  double v4;

  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredSize");
  v4 = v3;

  return v4;
}

- (void)invalidateIntrinsicContentSize
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCLockupContentView;
  -[ASCLockupContentView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if (-[ASCLockupContentView translatesAutoresizingMaskIntoConstraints](self, "translatesAutoresizingMaskIntoConstraints"))
  {
    -[ASCLockupContentView superview](self, "superview");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidateIntrinsicContentSize");

  }
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[ASCLockupContentView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0DC4FF8], *(double *)(MEMORY[0x1E0DC4FF8] + 8));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCLockupContentView layoutMargins](self, "layoutMargins");
  v10 = v6;
  v11 = v8;
  if (width - v7 - v9 >= 0.0)
    v12 = width - v7 - v9;
  else
    v12 = 0.0;
  if (height - v6 - v8 >= 0.0)
    v13 = height - v6 - v8;
  else
    v13 = 0.0;
  -[ASCLockupContentView makeLayout](self, "makeLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "measuredSizeFittingSize:inTraitEnvironment:", v15, v12, v13);
  v17 = v16;
  v19 = v18;

  if (-[ASCLockupContentView isSmallOfferButtonOnlyLockup](self, "isSmallOfferButtonOnlyLockup"))
  {
    -[ASCLockupContentView offerButton](self, "offerButton");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "size");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[__ASCLayoutProxy offerButtonRegularWidthForSize:](__ASCLayoutProxy, "offerButtonRegularWidthForSize:", v21);
    width = v22;

    if (width < v17)
      width = v17;
  }
  v23 = v10 + v11 + v19;
  -[ASCLockupContentView minimumLockupHeight](self, "minimumLockupHeight");
  if (v23 < v24)
  {
    -[ASCLockupContentView minimumLockupHeight](self, "minimumLockupHeight");
    v23 = v25;
  }

  v26 = width;
  v27 = v23;
  result.height = v27;
  result.width = v26;
  return result;
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
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)ASCLockupContentView;
  -[ASCLockupContentView layoutSubviews](&v21, sel_layoutSubviews);
  -[ASCLockupContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ASCLockupContentView layoutMargins](self, "layoutMargins");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[ASCLockupContentView makeLayout](self, "makeLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "placeChildrenRelativeToRect:inTraitEnvironment:", v20, v12, v14, v16, v18);

}

- (void)setDataChanged
{
  void *v1;

  if (result)
  {
    v1 = result;
    -[ASCLockupContentView updateViewsVisibility](result);
    -[ASCLockupContentView updateLockupTheme](v1);
    objc_msgSend(v1, "setNeedsLayout");
    return (void *)objc_msgSend(v1, "invalidateIntrinsicContentSize");
  }
  return result;
}

- (void)addOfferTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ASCLockupContentView offerButton](self, "offerButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTarget:action:forControlEvents:", v6, a4, 64);

}

- (void)removeOfferTarget:(id)a3 action:(SEL)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[ASCLockupContentView offerButton](self, "offerButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeTarget:action:forControlEvents:", v6, a4, 64);

}

- (void)updateViewsVisibility
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  if (a1)
  {
    v2 = objc_msgSend(a1, "shouldHideIconArtwork");
    objc_msgSend(a1, "iconArtworkView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setHidden:", v2);

    v4 = objc_msgSend(a1, "shouldHideTitle");
    objc_msgSend(a1, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v4);

    v6 = objc_msgSend(a1, "shouldHideSubtitle");
    objc_msgSend(a1, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", v6);

    v8 = objc_msgSend(a1, "shouldHideHeading");
    objc_msgSend(a1, "headingLabelIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", v8);

    v10 = objc_msgSend(a1, "shouldHideOfferStatus");
    objc_msgSend(a1, "offerStatusLabelIfLoaded");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setHidden:", v10);

  }
}

- (id)defaultOfferTheme
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  if (a1)
  {
    objc_msgSend(a1, "offerButton");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "metadata");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ASCOfferMetadataGetOfferTheme(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v1 = v4;
    }
    else
    {
      objc_msgSend(v1, "lockupSize");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      ASCLockupViewSizeGetOfferTheme(v6);
      v1 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  return v1;
}

- (void)setLockupTheme:(id)a3
{
  ASCLockupTheme *v5;
  char v6;
  ASCLockupTheme *v7;

  v7 = (ASCLockupTheme *)a3;
  v5 = self->_lockupTheme;
  if (v7 && v5)
  {
    v6 = -[ASCLockupTheme isEqual:](v5, "isEqual:", v7);

    if ((v6 & 1) != 0)
      goto LABEL_7;
    goto LABEL_6;
  }

  if (v5 != v7)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_lockupTheme, a3);
    -[ASCLockupContentView updateLockupTheme](self);
  }
LABEL_7:

}

- (void)setIconImage:(id)a3 withDecoration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  -[ASCLockupContentView iconArtworkView](self, "iconArtworkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDecoration:", v6);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setHeading:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v4 = (void *)MEMORY[0x1E0CB3498];
  v5 = a3;
  -[ASCLockupContentView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asc_attributedStringWithLockupHeading:compatibleWithTraitCollection:", v5, v6);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 && objc_msgSend(v13, "length"))
  {
    -[ASCLockupContentView headingLabel](self, "headingLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAttributedText:", v13);

    v8 = -[ASCLockupContentView shouldHideHeading](self, "shouldHideHeading");
    -[ASCLockupContentView headingLabel](self, "headingLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = v8;
  }
  else
  {
    -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAttributedText:", 0);

    -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = 1;
  }
  objc_msgSend(v9, "setHidden:", v11);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCLockupContentView titleLabel](self, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setBadge:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  v4 = a3;
  -[ASCLockupContentView badgeView](self, "badgeView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  -[ASCLockupContentView setBadgeView:](self, "setBadgeView:", v4);
  -[ASCLockupContentView badgeView](self, "badgeView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ASCLockupContentView badgeView](self, "badgeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupContentView addSubview:](self, "addSubview:", v7);

  }
  v8 = -[ASCLockupContentView shouldHideBadge](self, "shouldHideBadge");
  -[ASCLockupContentView badgeView](self, "badgeView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setHidden:", v8);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setPrefersRightToLeftLayout:(BOOL)a3
{
  uint64_t v4;

  if (a3)
    v4 = 4;
  else
    v4 = 3;
  -[ASCLockupContentView setSemanticContentAttribute:](self, "setSemanticContentAttribute:", v4);
  -[ASCLockupContentView setDataChanged](self);
}

- (void)setLoading:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    +[ASCContentSkeleton fractionalSkeleton:](ASCContentSkeleton, "fractionalSkeleton:", 0.76);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupContentView titleLabel](self, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSkeleton:", v4);

    +[ASCContentSkeleton fractionalSkeleton:](ASCContentSkeleton, "fractionalSkeleton:", 0.47);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSkeleton:", v6);

  }
  else
  {
    -[ASCLockupContentView titleLabel](self, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSkeleton:", 0);

    -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSkeleton:", 0);
  }

  -[ASCLockupContentView setDataChanged](self);
}

- (void)setDisplayContext:(id)a3
{
  ASCLockupDisplayContext *v4;
  ASCLockupDisplayContext *displayContext;
  BOOL v6;
  ASCLockupDisplayContext *v7;
  ASCLockupDisplayContext *v8;
  ASCLockupDisplayContext *v9;

  v4 = (ASCLockupDisplayContext *)a3;
  displayContext = self->_displayContext;
  v9 = v4;
  if (v4 && displayContext)
  {
    v6 = -[ASCLockupDisplayContext isEqual:](displayContext, "isEqual:", v4);
    v4 = v9;
    if (v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (displayContext != v4)
  {
LABEL_6:
    v7 = (ASCLockupDisplayContext *)-[ASCLockupDisplayContext copy](v4, "copy");
    v8 = self->_displayContext;
    self->_displayContext = v7;

    -[ASCLockupContentView setDataChanged](self);
    v4 = v9;
  }
LABEL_7:

}

- (id)saveOfferState
{
  ASCOfferPresenterViewState *v3;
  void *v4;
  void *v5;
  void *v6;
  ASCOfferPresenterViewState *v7;

  v3 = [ASCOfferPresenterViewState alloc];
  -[ASCLockupContentView offerButton](self, "offerButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCLockupContentView offerTheme](self, "offerTheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[ASCOfferPresenterViewState initWithMetadata:theme:](v3, "initWithMetadata:theme:", v5, v6);

  return v7;
}

- (void)setOfferMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCLockupContentView offerButton](self, "offerButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionToMetadata:withCompletion:", v4, 0);

  -[ASCLockupContentView updateOfferTheme](self);
  -[ASCLockupContentView setDataChanged](self);
}

- (void)setOfferTheme:(id)a3
{
  ASCOfferTheme *v4;
  ASCOfferTheme *offerTheme;
  BOOL v6;
  ASCOfferTheme *v7;
  ASCOfferTheme *v8;
  ASCOfferTheme *v9;

  v4 = (ASCOfferTheme *)a3;
  offerTheme = self->_offerTheme;
  v9 = v4;
  if (v4 && offerTheme)
  {
    v6 = -[ASCOfferTheme isEqual:](offerTheme, "isEqual:", v4);
    v4 = v9;
    if (v6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (offerTheme != v4)
  {
LABEL_6:
    v7 = (ASCOfferTheme *)-[ASCOfferTheme copy](v4, "copy");
    v8 = self->_offerTheme;
    self->_offerTheme = v7;

    -[ASCLockupContentView updateOfferTheme](self);
    v4 = v9;
  }
LABEL_7:

}

- (void)setOfferEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCLockupContentView offerButton](self, "offerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (void)setOfferInteractive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCLockupContentView offerButton](self, "offerButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInteractionEnabled:", v3);

}

- (void)setOfferStatus:(id)a3
{
  void *v4;
  _BOOL8 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10 && objc_msgSend(v10, "length"))
  {
    -[ASCLockupContentView offerStatusLabel](self, "offerStatusLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v10);

    v5 = -[ASCLockupContentView shouldHideOfferStatus](self, "shouldHideOfferStatus");
    -[ASCLockupContentView offerStatusLabel](self, "offerStatusLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v5;
  }
  else
  {
    -[ASCLockupContentView offerStatusLabelIfLoaded](self, "offerStatusLabelIfLoaded");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", 0);

    -[ASCLockupContentView offerStatusLabelIfLoaded](self, "offerStatusLabelIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 1;
  }
  objc_msgSend(v6, "setHidden:", v8);

  -[ASCLockupContentView setDataChanged](self);
}

- (void)beginOfferModalStateWithCancelBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCLockupContentView offerButton](self, "offerButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginModalStateWithCancelBlock:", v4);

}

- (void)endOfferModalState
{
  id v2;

  -[ASCLockupContentView offerButton](self, "offerButton");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endModalState");

}

- (void)offerButton:(id)a3 willTransitionToMetadata:(id)a4 usingAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75__ASCLockupContentView_offerButton_willTransitionToMetadata_usingAnimator___block_invoke;
  v11[3] = &unk_1E7560470;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v10, "addAnimations:", v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

void __75__ASCLockupContentView_offerButton_willTransitionToMetadata_usingAnimator___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setNeedsLayout");

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "layoutIfNeeded");

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = -[ASCDescriber initWithObject:]([ASCDescriber alloc], "initWithObject:", self);
  -[ASCLockupContentView headingLabelIfLoaded](self, "headingLabelIfLoaded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v5, CFSTR("heading"));

  -[ASCLockupContentView titleLabel](self, "titleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v7, CFSTR("title"));

  -[ASCLockupContentView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "text");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v9, CFSTR("subtitle"));

  -[ASCLockupContentView lockupTheme](self, "lockupTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v10, CFSTR("lockupTheme"));

  -[ASCLockupContentView displayContext](self, "displayContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v11, CFSTR("displayContext"));

  -[ASCLockupContentView offerButton](self, "offerButton");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v13, CFSTR("offerSize"));

  -[ASCLockupContentView offerButton](self, "offerButton");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "theme");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v15, CFSTR("offerTheme"));

  -[ASCLockupContentView offerButton](self, "offerButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v17, CFSTR("offerMetadata"));

  -[ASCLockupContentView offerStatusLabelIfLoaded](self, "offerStatusLabelIfLoaded");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "text");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCDescriber addObject:withName:](v3, "addObject:withName:", v19, CFSTR("offerStatus"));

  -[ASCDescriber finalizeDescription](v3, "finalizeDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v20;
}

- (NSString)lockupSize
{
  return self->_lockupSize;
}

- (ASCOfferTheme)offerTheme
{
  return self->_offerTheme;
}

- (ASCLockupTheme)lockupTheme
{
  return self->_lockupTheme;
}

- (ASCLockupDisplayContext)displayContext
{
  return self->_displayContext;
}

- (ASCArtworkView)iconArtworkView
{
  return self->_iconArtworkView;
}

- (ASCSkeletonLabel)titleLabel
{
  return self->_titleLabel;
}

- (ASCSkeletonLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (ASCOfferButton)offerButton
{
  return self->_offerButton;
}

- (UILabel)headingLabelIfLoaded
{
  return self->_headingLabelIfLoaded;
}

- (UILabel)offerStatusLabelIfLoaded
{
  return self->_offerStatusLabelIfLoaded;
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeView:(id)a3
{
  objc_storeStrong((id *)&self->_badgeView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_offerStatusLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_headingLabelIfLoaded, 0);
  objc_storeStrong((id *)&self->_offerButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconArtworkView, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_lockupTheme, 0);
  objc_storeStrong((id *)&self->_offerTheme, 0);
  objc_storeStrong((id *)&self->_lockupSize, 0);
}

@end
