@implementation ASCMiniProductPageView

- (ASCMiniProductPageView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  ASCMiniProductPageView *v8;
  ASCMiniProductPageView *v9;
  ASCArtworkView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  ASCArtworkView *iconArtworkView;
  ASCMiniProductPageTitleView *v17;
  ASCMiniProductPageTitleView *titleView;
  ASCSkeletonLabel *v19;
  ASCSkeletonLabel *subtitleLabel;
  ASCSkeletonLabel *v21;
  ASCSkeletonLabel *metadataLabel;
  ASCExpandableLabel *v23;
  ASCExpandableLabel *descriptionLabel;
  ASCMiniProductPageMediaView *v25;
  ASCMiniProductPageMediaView *mediaView;
  ASCAppearMetricsPresenter *v27;
  ASCAppearMetricsPresenter *metricsPresenter;
  ASCLockupPresenter *v29;
  ASCLockupPresenter *lockupPresenter;
  ASCMiniProductPagePresenter *v31;
  ASCMiniProductPagePresenter *miniProductPagePresenter;
  ASCLockupMediaPresenter *v33;
  ASCLockupMediaPresenter *mediaPresenter;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  _QWORD v54[4];
  id v55;
  id location;
  objc_super v57;
  _QWORD v58[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v58[1] = *MEMORY[0x1E0C80C00];
  +[ASCEligibility assertCurrentProcessEligibility]();
  v57.receiver = self;
  v57.super_class = (Class)ASCMiniProductPageView;
  v8 = -[ASCMiniProductPageView initWithFrame:](&v57, sel_initWithFrame_, x, y, width, height);
  v9 = v8;
  if (v8)
  {
    -[ASCMiniProductPageView setLayoutMargins:](v8, "setLayoutMargins:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
    -[ASCMiniProductPageView setInsetsLayoutMarginsFromSafeArea:](v9, "setInsetsLayoutMarginsFromSafeArea:", 0);
    -[ASCMiniProductPageView setClipsToBounds:](v9, "setClipsToBounds:", 1);
    v10 = [ASCArtworkView alloc];
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = -[ASCArtworkView initWithFrame:](v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    iconArtworkView = v9->_iconArtworkView;
    v9->_iconArtworkView = (ASCArtworkView *)v15;

    v17 = -[ASCMiniProductPageTitleView initWithFrame:]([ASCMiniProductPageTitleView alloc], "initWithFrame:", v11, v12, v13, v14);
    titleView = v9->_titleView;
    v9->_titleView = v17;

    v19 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v11, v12, v13, v14);
    subtitleLabel = v9->_subtitleLabel;
    v9->_subtitleLabel = v19;

    v21 = -[ASCSkeletonLabel initWithFrame:]([ASCSkeletonLabel alloc], "initWithFrame:", v11, v12, v13, v14);
    metadataLabel = v9->_metadataLabel;
    v9->_metadataLabel = v21;

    v23 = -[ASCExpandableLabel initWithFrame:]([ASCExpandableLabel alloc], "initWithFrame:", v11, v12, v13, v14);
    descriptionLabel = v9->_descriptionLabel;
    v9->_descriptionLabel = v23;

    v25 = -[ASCMiniProductPageMediaView initWithFrame:]([ASCMiniProductPageMediaView alloc], "initWithFrame:", v11, v12, v13, v14);
    mediaView = v9->_mediaView;
    v9->_mediaView = v25;

    -[ASCMiniProductPageMediaView setScreenshotSpacing:](v9->_mediaView, "setScreenshotSpacing:", 8.0);
    v27 = -[ASCAppearMetricsPresenter initWithView:]([ASCAppearMetricsPresenter alloc], "initWithView:", v9);
    metricsPresenter = v9->_metricsPresenter;
    v9->_metricsPresenter = v27;

    v29 = -[ASCLockupPresenter initWithView:metricsPresenter:]([ASCLockupPresenter alloc], "initWithView:metricsPresenter:", v9, v9->_metricsPresenter);
    lockupPresenter = v9->_lockupPresenter;
    v9->_lockupPresenter = v29;

    v31 = -[ASCMiniProductPagePresenter initWithView:lockupPresenter:]([ASCMiniProductPagePresenter alloc], "initWithView:lockupPresenter:", v9, v9->_lockupPresenter);
    miniProductPagePresenter = v9->_miniProductPagePresenter;
    v9->_miniProductPagePresenter = v31;

    v33 = -[ASCLockupMediaPresenter initWithView:lockupPresenter:]([ASCLockupMediaPresenter alloc], "initWithView:lockupPresenter:", v9->_mediaView, v9->_lockupPresenter);
    mediaPresenter = v9->_mediaPresenter;
    v9->_mediaPresenter = v33;

    -[ASCLockupPresenter setObserver:](v9->_lockupPresenter, "setObserver:", v9);
    objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:withTraits:", *MEMORY[0x1E0DC4B60], 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageTitleView setFont:](v9->_titleView, "setFont:", v35);

    objc_msgSend(MEMORY[0x1E0DC37E8], "asc_preferredFontForTextStyle:withTraits:", *MEMORY[0x1E0DC4A90], 2);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setFont:](v9->_subtitleLabel, "setFont:", v36);

    v37 = *MEMORY[0x1E0DC4AB8];
    objc_msgSend(MEMORY[0x1E0DC37E8], "asc_fontDerivedFromTextStyle:byApplyingFontWeight:", *MEMORY[0x1E0DC4AB8], *MEMORY[0x1E0DC4B88]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setFont:](v9->_metadataLabel, "setFont:", v38);

    objc_msgSend(MEMORY[0x1E0DC37E8], "asc_fontDerivedFromTextStyle:byApplyingFontWeight:", v37, *MEMORY[0x1E0DC4B90]);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCExpandableLabel setFont:](v9->_descriptionLabel, "setFont:", v39);

    -[ASCMiniProductPageTitleView setAdjustsFontForContentSizeCategory:](v9->_titleView, "setAdjustsFontForContentSizeCategory:", 1);
    -[ASCSkeletonLabel setAdjustsFontForContentSizeCategory:](v9->_metadataLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[ASCSkeletonLabel setAdjustsFontForContentSizeCategory:](v9->_subtitleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[ASCExpandableLabel setAdjustsFontForContentSizeCategory:](v9->_descriptionLabel, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageTitleView setTextColor:](v9->_titleView, "setTextColor:", v40);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setTextColor:](v9->_subtitleLabel, "setTextColor:", v41);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setTextColor:](v9->_metadataLabel, "setTextColor:", v42);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCExpandableLabel setTextColor:](v9->_descriptionLabel, "setTextColor:", v43);

    -[ASCMiniProductPageView setNumberOfLines](v9, "setNumberOfLines");
    +[ASCSemanticColor loading]();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageView setLoadingColor:](v9, "setLoadingColor:", v44);

    -[ASCSkeletonLabel setSkeletonNumberOfLines:](v9->_descriptionLabel, "setSkeletonNumberOfLines:", 2);
    objc_initWeak(&location, v9);
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __40__ASCMiniProductPageView_initWithFrame___block_invoke;
    v54[3] = &unk_1E7561360;
    objc_copyWeak(&v55, &location);
    -[ASCArtworkView setAccessibilityLabelBlock:](v9->_iconArtworkView, "setAccessibilityLabelBlock:", v54);
    -[ASCArtworkView setIsAccessibilityElement:](v9->_iconArtworkView, "setIsAccessibilityElement:", 1);
    -[ASCArtworkView setAccessibilityTraits:](v9->_iconArtworkView, "setAccessibilityTraits:", *MEMORY[0x1E0DC4678]);
    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.icon"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCArtworkView setAccessibilityIdentifier:](v9->_iconArtworkView, "setAccessibilityIdentifier:", v45);

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.title"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageTitleView setAccessibilityIdentifier:](v9->_titleView, "setAccessibilityIdentifier:", v46);

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.subtitle"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setAccessibilityIdentifier:](v9->_subtitleLabel, "setAccessibilityIdentifier:", v47);

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.metadata"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCSkeletonLabel setAccessibilityIdentifier:](v9->_metadataLabel, "setAccessibilityIdentifier:", v48);

    ASCAXIdentifierWithSuffix((uint64_t)CFSTR("Lockup.description"));
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCExpandableLabel setAccessibilityIdentifier:](v9->_descriptionLabel, "setAccessibilityIdentifier:", v49);

    -[ASCMiniProductPageView addSubview:](v9, "addSubview:", v9->_iconArtworkView);
    -[ASCMiniProductPageView addSubview:](v9, "addSubview:", v9->_titleView);
    -[ASCMiniProductPageView addSubview:](v9, "addSubview:", v9->_subtitleLabel);
    -[ASCMiniProductPageView addSubview:](v9, "addSubview:", v9->_metadataLabel);
    -[ASCMiniProductPageView addSubview:](v9, "addSubview:", v9->_descriptionLabel);
    -[ASCMiniProductPageView addSubview:](v9, "addSubview:", v9->_mediaView);
    -[ASCExpandableLabel setUserInteractionEnabled:](v9->_descriptionLabel, "setUserInteractionEnabled:", 1);
    -[ASCExpandableLabel moreButton](v9->_descriptionLabel, "moreButton");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "addTarget:action:forControlEvents:", v9, sel_didSelectDescriptionLabel, 64);

    -[ASCMiniProductPageMediaView setUserInteractionEnabled:](v9->_mediaView, "setUserInteractionEnabled:", 1);
    -[ASCMiniProductPageMediaView addTarget:action:forControlEvents:](v9->_mediaView, "addTarget:action:forControlEvents:", v9, sel_didSelectMediaView_forEvent_, 64);
    v58[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (id)-[ASCMiniProductPageView registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v51, sel_setDataChanged);

    objc_destroyWeak(&v55);
    objc_destroyWeak(&location);
  }
  return v9;
}

id __40__ASCMiniProductPageView_initWithFrame___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "lockup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    ASCLocalizedFormatString(CFSTR("AX_APP_ICON"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    ASCLocalizedString(CFSTR("AX_APP_ICON_PLACEHOLDER"), v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (ASCMiniProductPageView)initWithCoder:(id)a3
{
  -[ASCMiniProductPageView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  -[ASCMiniProductPageView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)invalidateIntrinsicContentSize
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASCMiniProductPageView;
  -[ASCMiniProductPageView invalidateIntrinsicContentSize](&v4, sel_invalidateIntrinsicContentSize);
  if ((*(_BYTE *)&self->_delegateRespondsTo & 0x40) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "miniProductPageViewDidInvalidateIntrinsicContentSize:", self);

  }
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[ASCMiniProductPageView bounds](self, "bounds");
  -[ASCMiniProductPageView sizeThatFits:](self, "sizeThatFits:", v3, 1.79769313e308);
  result.height = v5;
  result.width = v4;
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
  double v20;
  double v21;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[ASCMiniProductPageView layoutMargins](self, "layoutMargins");
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
  -[ASCMiniProductPageView makeLayout](self, "makeLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "measuredSizeFittingSize:inTraitEnvironment:", v15, v12, v13);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v10 + v11 + v19;
  result.height = v21;
  result.width = v20;
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
  void *v21;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ASCMiniProductPageView;
  -[ASCMiniProductPageView layoutSubviews](&v22, sel_layoutSubviews);
  -[ASCMiniProductPageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[ASCMiniProductPageView layoutMargins](self, "layoutMargins");
  v12 = v4 + v11;
  v14 = v6 + v13;
  v16 = v8 - (v11 + v15);
  v18 = v10 - (v13 + v17);
  -[ASCMiniProductPageView makeLayout](self, "makeLayout");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView asc_layoutTraitEnvironment](self, "asc_layoutTraitEnvironment");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "placeChildrenRelativeToRect:inTraitEnvironment:", v20, v12, v14, v16, v18);

  -[ASCMiniProductPageView mediaPresenter](self, "mediaPresenter");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "viewDidLayoutSubviews");

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

  -[ASCMiniProductPageView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageView iconArtworkView](self, "iconArtworkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASCMiniProductPageView mediaView](self, "mediaView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[__ASCLayoutProxy miniProductPageLayoutWithTraitCollection:iconArtwork:title:subtitle:metadata:description:screenshots:](__ASCLayoutProxy, "miniProductPageLayoutWithTraitCollection:iconArtwork:title:subtitle:metadata:description:screenshots:", v3, v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASCMiniProductPageView;
  -[ASCMiniProductPageView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setDataChanged
{
  -[ASCMiniProductPageView setNumberOfLines](self, "setNumberOfLines");
  -[ASCMiniProductPageView setNeedsLayout](self, "setNeedsLayout");
  -[ASCMiniProductPageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ASCMiniProductPageView;
  v4 = a3;
  -[ASCMiniProductPageView setBackgroundColor:](&v7, sel_setBackgroundColor_, v4);
  -[ASCMiniProductPageView titleView](self, "titleView", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

}

- (void)setNumberOfLines
{
  void *v3;
  NSString *v4;
  _BOOL4 IsAccessibilityCategory;
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

  -[ASCMiniProductPageView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  -[ASCMiniProductPageView titleView](self, "titleView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (IsAccessibilityCategory)
  {
    objc_msgSend(v7, "setMaximumNumberOfLines:", 0);

    -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setNumberOfLines:", 0);

    -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setNumberOfLines:", 2);

    -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v12 = 3;
  }
  else
  {
    objc_msgSend(v7, "setMaximumNumberOfLines:", 2);

    -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setNumberOfLines:", 1);

    -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setNumberOfLines:", 1);

    -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    v12 = 2;
  }
  objc_msgSend(v11, "setNumberOfLines:", v12);

}

- (ASCLockup)lockup
{
  void *v2;
  void *v3;

  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
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
  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLockup:", v4);

}

- (ASCLockupViewGroup)group
{
  void *v2;
  void *v3;

  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
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
  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroup:", v4);

}

- (ASCLockupRequest)request
{
  void *v2;
  void *v3;

  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "request");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (ASCLockupRequest *)v3;
}

- (void)setRequest:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRequest:", v4);

}

- (void)lockupPresenterDidBeginRequest
{
  id v3;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) != 0)
  {
    -[ASCMiniProductPageView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "miniProductPageViewDidBeginRequest:", self);

  }
}

- (void)lockupPresenterDidFinishRequest
{
  id v3;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 2) != 0)
  {
    -[ASCMiniProductPageView delegate](self, "delegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "miniProductPageViewDidFinishRequest:", self);

  }
}

- (void)lockupPresenterDidFailRequestWithError:(id)a3
{
  id v4;
  id v5;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 4) != 0)
  {
    v4 = a3;
    -[ASCMiniProductPageView delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "miniProductPageView:didFailRequestWithError:", self, v4);

  }
}

- (void)setDelegate:(id)a3
{
  void *v4;
  char v5;
  char v6;
  char v7;
  char v8;
  char v9;
  BOOL v10;
  char v11;
  id v12;

  v12 = a3;
  objc_storeWeak((id *)&self->_delegate, v12);
  v4 = v12;
  if (v12)
  {
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v5 = 2;
    else
      v5 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFD | v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v6 = 4;
    else
      v6 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFB | v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = 8;
    else
      v7 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xF7 | v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v8 = 16;
    else
      v8 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xEF | v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v9 = 32;
    else
      v9 = 0;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xDF | v9;
    v10 = (objc_opt_respondsToSelector() & 1) == 0;
    v4 = v12;
    if (v10)
      v11 = 0;
    else
      v11 = 64;
    *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xBF | v11;
  }
  else
  {
    *(_BYTE *)&self->_delegateRespondsTo &= 0x80u;
  }

}

- (void)setShowsPlaceholderContent:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowsPlaceholderContent:", v3);

}

- (BOOL)showsPlaceholderContent
{
  void *v2;
  char v3;

  -[ASCMiniProductPageView lockupPresenter](self, "lockupPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showsPlaceholderContent");

  return v3;
}

- (UIColor)loadingColor
{
  void *v2;
  void *v3;

  -[ASCMiniProductPageView titleView](self, "titleView");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v13 = v4;
  if (v4)
  {
    v5 = v4;
  }
  else
  {
    +[ASCSemanticColor loading]();
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  -[ASCMiniProductPageView titleView](self, "titleView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSkeletonColor:", v6);

  -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSkeletonColor:", v6);

  -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSkeletonColor:", v6);

  -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSkeletonColor:", v6);

  -[ASCMiniProductPageView iconArtworkView](self, "iconArtworkView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceholderColor:", v6);

  -[ASCMiniProductPageView mediaView](self, "mediaView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPlaceholderColor:", v6);

}

- (void)setIconImage:(id)a3 withDecoration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[ASCMiniProductPageView iconArtworkView](self, "iconArtworkView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setImage:", v7);

  -[ASCMiniProductPageView iconArtworkView](self, "iconArtworkView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDecoration:", v6);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCMiniProductPageView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setSubtitle:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setMetadata:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setDescription:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setAgeRating:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ASCMiniProductPageView titleView](self, "titleView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ageRatingView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setText:", v4);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setPrefersRightToLeftLayout:(BOOL)a3
{
  uint64_t v4;

  if (a3)
    v4 = 4;
  else
    v4 = 3;
  -[ASCMiniProductPageView setSemanticContentAttribute:](self, "setSemanticContentAttribute:", v4);
  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (void)setLoading:(BOOL)a3
{
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
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  if (a3)
  {
    +[ASCContentSkeleton fractionalSkeleton:](ASCContentSkeleton, "fractionalSkeleton:", 0.76);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageView titleView](self, "titleView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setSkeleton:", v4);

    +[ASCContentSkeleton fractionalSkeleton:](ASCContentSkeleton, "fractionalSkeleton:", 0.24);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSkeleton:", v6);

    +[ASCContentSkeleton fractionalSkeleton:](ASCContentSkeleton, "fractionalSkeleton:", 0.24);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSkeleton:", v8);

    +[ASCContentSkeleton fractionalSkeleton:](ASCContentSkeleton, "fractionalSkeleton:", 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSkeleton:", v10);

    -[ASCMiniProductPageView mediaView](self, "mediaView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 1;
  }
  else
  {
    -[ASCMiniProductPageView titleView](self, "titleView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setSkeleton:", 0);

    -[ASCMiniProductPageView subtitleLabel](self, "subtitleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setSkeleton:", 0);

    -[ASCMiniProductPageView metadataLabel](self, "metadataLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setSkeleton:", 0);

    -[ASCMiniProductPageView descriptionLabel](self, "descriptionLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setSkeleton:", 0);

    -[ASCMiniProductPageView mediaView](self, "mediaView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = 0;
  }
  objc_msgSend(v12, "setShowsPlaceholderContent:", v14);

  -[ASCMiniProductPageView setDataChanged](self, "setDataChanged");
}

- (CGSize)preferredIconSize
{
  double v2;
  double v3;
  CGSize result;

  +[__ASCLayoutProxy miniProductPagePreferredArtworkSize](__ASCLayoutProxy, "miniProductPagePreferredArtworkSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (UIViewController)presentingViewController
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  int v9;
  ASCMiniProductPageView *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[ASCMiniProductPageView delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentingViewControllerForMiniProductPageView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    -[ASCMiniProductPageView window](self, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = self;
        _os_log_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Mini Product Page view %@ is presenting from root view controller", (uint8_t *)&v9, 0xCu);
      }
      v7 = v5;
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      -[ASCMiniProductPageView presentingViewController].cold.1((uint64_t)self);
    }

  }
  return (UIViewController *)v5;
}

- (void)presentScreenshotsViewControllerWithSelectedIndex:(unint64_t)a3
{
  ASCMiniProductPageMediaViewController *v5;
  void *v6;
  void *v7;
  ASCMiniProductPageMediaViewController *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12[2];
  id location;

  v5 = [ASCMiniProductPageMediaViewController alloc];
  -[ASCMiniProductPageView mediaView](self, "mediaView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "screenshots");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ASCMiniProductPageMediaViewController initWithScreenshots:selectedIndex:](v5, "initWithScreenshots:selectedIndex:", v7, a3);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  -[ASCMiniProductPageView presentingViewController](self, "presentingViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __76__ASCMiniProductPageView_presentScreenshotsViewControllerWithSelectedIndex___block_invoke;
    v11[3] = &unk_1E7561388;
    objc_copyWeak(v12, &location);
    v12[1] = (id)a3;
    objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, v11);
    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }

}

void __76__ASCMiniProductPageView_presentScreenshotsViewControllerWithSelectedIndex___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  _BYTE *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((WeakRetained[416] & 0x20) != 0)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "miniProductPageViewDidPresentScreenshots:atIndex:", v4, *(_QWORD *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)presentDescriptionViewController
{
  ASCMiniProductPageDescriptionViewController *v3;
  void *v4;
  void *v5;
  ASCMiniProductPageDescriptionViewController *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v3 = [ASCMiniProductPageDescriptionViewController alloc];
  -[ASCMiniProductPageView miniProductPagePresenter](self, "miniProductPagePresenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASCMiniProductPageDescriptionViewController initWithText:](v3, "initWithText:", v5);

  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  -[ASCMiniProductPageView presentingViewController](self, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__ASCMiniProductPageView_presentDescriptionViewController__block_invoke;
    v9[3] = &unk_1E7560470;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __58__ASCMiniProductPageView_presentDescriptionViewController__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  _BYTE *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((WeakRetained[416] & 0x10) != 0)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "miniProductPageViewDidPresentDescription:", v3);

    WeakRetained = v3;
  }

}

- (void)didSelectMediaView:(id)a3 forEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;
  CGPoint v26;
  CGRect v27;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a4, "allTouches");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "locationInView:", v6);
  v10 = v9;
  v12 = v11;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v6, "imageViews", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v21;
    while (2)
    {
      v18 = 0;
      v19 = v16 + v15;
      do
      {
        if (*(_QWORD *)v21 != v17)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "frame");
        v26.x = v10;
        v26.y = v12;
        if (CGRectContainsPoint(v27, v26))
        {
          v19 = v16 + v18;
          goto LABEL_12;
        }
        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v16 = v19;
      if (v15)
        continue;
      break;
    }
  }
  else
  {
    v19 = 0;
  }
LABEL_12:

  -[ASCMiniProductPageView presentScreenshotsViewControllerWithSelectedIndex:](self, "presentScreenshotsViewControllerWithSelectedIndex:", v19);
}

- (ASCMiniProductPageViewDelegate)delegate
{
  return (ASCMiniProductPageViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ASCAppearMetricsPresenter)metricsPresenter
{
  return self->_metricsPresenter;
}

- (ASCLockupPresenter)lockupPresenter
{
  return self->_lockupPresenter;
}

- (ASCMiniProductPagePresenter)miniProductPagePresenter
{
  return self->_miniProductPagePresenter;
}

- (ASCLockupMediaPresenter)mediaPresenter
{
  return self->_mediaPresenter;
}

- (ASCArtworkView)iconArtworkView
{
  return self->_iconArtworkView;
}

- (ASCMiniProductPageTitleView)titleView
{
  return self->_titleView;
}

- (ASCAgeRatingView)ageRatingView
{
  return self->_ageRatingView;
}

- (ASCSkeletonLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (ASCSkeletonLabel)metadataLabel
{
  return self->_metadataLabel;
}

- (ASCExpandableLabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (ASCMiniProductPageMediaView)mediaView
{
  return self->_mediaView;
}

- (UIGestureRecognizer)mediaViewTapGestureRecognizer
{
  return self->_mediaViewTapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaViewTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_mediaView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_metadataLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_ageRatingView, 0);
  objc_storeStrong((id *)&self->_titleView, 0);
  objc_storeStrong((id *)&self->_iconArtworkView, 0);
  objc_storeStrong((id *)&self->_mediaPresenter, 0);
  objc_storeStrong((id *)&self->_miniProductPagePresenter, 0);
  objc_storeStrong((id *)&self->_lockupPresenter, 0);
  objc_storeStrong((id *)&self->_metricsPresenter, 0);
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
  _os_log_error_impl(&dword_1BCB7B000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Mini Product Page view %@ could not find view controller to present from.", (uint8_t *)&v1, 0xCu);
}

@end
