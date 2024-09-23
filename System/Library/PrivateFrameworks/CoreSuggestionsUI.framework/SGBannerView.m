@implementation SGBannerView

- (SGBannerView)init
{
  SGBannerView *v2;
  uint64_t v3;
  _TtC17CoreSuggestionsUI15SGBannerContent *banner;
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *v5;
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *bannerHostingView;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v25.receiver = self;
  v25.super_class = (Class)SGBannerView;
  v2 = -[SGBannerView initWithFrame:](&v25, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = objc_opt_new();
    banner = v2->_banner;
    v2->_banner = (_TtC17CoreSuggestionsUI15SGBannerContent *)v3;

    v5 = -[SGBannerContentHostingView initWithBanner:]([_TtC17CoreSuggestionsUI26SGBannerContentHostingView alloc], "initWithBanner:", v2->_banner);
    bannerHostingView = v2->_bannerHostingView;
    v2->_bannerHostingView = v5;

    v2->_orientationChanged = 0;
    -[SGBannerView setTranslatesAutoresizingMaskIntoConstraints:](v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SGBannerContentHostingView setTranslatesAutoresizingMaskIntoConstraints:](v2->_bannerHostingView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SGBannerView addSubview:](v2, "addSubview:", v2->_bannerHostingView);
    v20 = (void *)MEMORY[0x1E0CB3718];
    -[SGBannerContentHostingView leadingAnchor](v2->_bannerHostingView, "leadingAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGBannerView leadingAnchor](v2, "leadingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v22;
    -[SGBannerContentHostingView trailingAnchor](v2->_bannerHostingView, "trailingAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGBannerView trailingAnchor](v2, "trailingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v8;
    -[SGBannerContentHostingView bottomAnchor](v2->_bannerHostingView, "bottomAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGBannerView bottomAnchor](v2, "bottomAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v11;
    -[SGBannerContentHostingView topAnchor](v2->_bannerHostingView, "topAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SGBannerView topAnchor](v2, "topAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "constraintEqualToAnchor:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", v2, sel_invalidateReloadBannerView_, *MEMORY[0x1E0DC48E8], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", v2, sel_invalidateReloadBannerView_, *MEMORY[0x1E0DC4960], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v2, sel_forceReloadBannerView_, *MEMORY[0x1E0DC4E70], 0);

  }
  return v2;
}

- (void)invalidateReloadBannerView:(id)a3
{
  void *v4;
  id v5;

  self->_orientationChanged = 1;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D19A28]))
  {
    -[SGBannerView invalidateBannerView](self, "invalidateBannerView");
    -[SGBannerView reload](self, "reload");
  }

}

- (void)forceReloadBannerView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_banner)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "orientation");

    if (v6 == 1 && self->_orientationChanged)
    {
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = CFSTR("SGListNotificationKeyChangedReorientation");
      v10[0] = &unk_1E62DD730;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("com.apple.coresuggestionsui.SGListDidChangeNotification"), 0, v8);

      self->_orientationChanged = 0;
    }
  }

}

- (void)setDelegate:(id)a3
{
  -[SGBannerContent setDelegate:](self->_banner, "setDelegate:", a3);
}

- (void)setTitle:(id)a3
{
  -[SGBannerContent setTitle:](self->_banner, "setTitle:", a3);
  -[SGBannerContentHostingView updateBannerViews](self->_bannerHostingView, "updateBannerViews");
}

- (NSString)title
{
  return -[SGBannerContent title](self->_banner, "title");
}

- (NSString)subtitle
{
  return -[SGBannerContent subtitle](self->_banner, "subtitle");
}

- (void)setSubtitle:(id)a3
{
  -[SGBannerContent setSubtitle:](self->_banner, "setSubtitle:", a3);
  -[SGBannerContentHostingView updateBannerViews](self->_bannerHostingView, "updateBannerViews");
}

- (NSAttributedString)attributedSubtitle
{
  return -[SGBannerContent attributedSubtitle](self->_banner, "attributedSubtitle");
}

- (void)setAttributedSubtitle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  -[SGBannerContent setAttributedSubtitle:](self->_banner, "setAttributedSubtitle:", v5);

  objc_msgSend(v4, "string");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SGBannerContent setSubtitle:](self->_banner, "setSubtitle:", v6);
}

- (void)setAccessoryType:(int64_t)a3
{
  if (-[SGBannerContent accessoryType](self->_banner, "accessoryType") != a3)
    -[SGBannerContent setAccessoryType:](self->_banner, "setAccessoryType:", a3);
}

- (int64_t)accessoryType
{
  return -[SGBannerContent accessoryType](self->_banner, "accessoryType");
}

- (void)setActionButtonType:(int64_t)a3
{
  if (-[SGBannerContent actionButtonType](self->_banner, "actionButtonType") != a3)
    -[SGBannerContent setActionButtonType:](self->_banner, "setActionButtonType:", a3);
}

- (int64_t)actionButtonType
{
  return -[SGBannerContent actionButtonType](self->_banner, "actionButtonType");
}

- (NSString)actionTitle
{
  return -[SGBannerContent actionTitle](self->_banner, "actionTitle");
}

- (void)setActionTitle:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(a3, "copy");
  -[SGBannerContent setActionTitle:](self->_banner, "setActionTitle:", v4);

  -[SGBannerContentHostingView updateBannerViews](self->_bannerHostingView, "updateBannerViews");
}

- (NSArray)imageSGViews
{
  return -[SGBannerContent imageSGViews](self->_banner, "imageSGViews");
}

- (void)setImageSGViews:(id)a3
{
  -[SGBannerContent setImageSGViews:](self->_banner, "setImageSGViews:", a3);
}

- (void)setImages:(id)a3
{
  id v4;

  if (a3)
  {
    v4 = (id)objc_msgSend(a3, "copy");
    -[SGBannerContent setImages:](self->_banner, "setImages:", v4);

  }
}

- (NSArray)images
{
  return -[SGBannerContent images](self->_banner, "images");
}

- (SGSuggestion)suggestion
{
  return -[SGBannerContent suggestion](self->_banner, "suggestion");
}

- (void)setSuggestion:(id)a3
{
  -[SGBannerContent setSuggestion:](self->_banner, "setSuggestion:", a3);
}

- (void)setSuggestionStore:(id)a3
{
  -[SGBannerContentHostingView setSuggestionWithStore:](self->_bannerHostingView, "setSuggestionWithStore:", a3);
}

- (void)setPrimaryAction:(id)a3
{
  -[SGBannerContent setPrimaryAction:](self->_banner, "setPrimaryAction:", a3);
}

- (SGSuggestionAction)primaryAction
{
  return -[SGBannerContent primaryAction](self->_banner, "primaryAction");
}

- (void)setDismissAction:(id)a3
{
  -[SGBannerContent setDismissAction:](self->_banner, "setDismissAction:", a3);
}

- (SGSuggestionAction)dismissAction
{
  return -[SGBannerContent dismissAction](self->_banner, "dismissAction");
}

- (void)setCloseButtonXAnchorOffset:(double)a3
{
  -[SGBannerContent setCloseButtonXAnchorOffset:](self->_banner, "setCloseButtonXAnchorOffset:", a3);
}

- (double)closeButtonXAnchorOffset
{
  double result;

  -[SGBannerContent closeButtonXAnchorOffset](self->_banner, "closeButtonXAnchorOffset");
  return result;
}

- (void)setProminentActionButton:(BOOL)a3
{
  -[SGBannerContent setProminentActionButton:](self->_banner, "setProminentActionButton:", a3);
}

- (BOOL)prominentActionButton
{
  return -[SGBannerContent prominentActionButton](self->_banner, "prominentActionButton");
}

- (void)reload
{
  _TtC17CoreSuggestionsUI26SGBannerContentHostingView *bannerHostingView;
  id v3;

  bannerHostingView = self->_bannerHostingView;
  -[SGBannerView banner](self, "banner");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SGBannerContentHostingView updateWithBanner:](bannerHostingView, "updateWithBanner:", v3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  -[SGBannerContentHostingView intrinsicContentSize](self->_bannerHostingView, "intrinsicContentSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setBackgroundVisualEffectView:(id)a3
{
  -[SGBannerContent setBackgroundVisualEffectView:](self->_banner, "setBackgroundVisualEffectView:", a3);
  -[SGBannerContentHostingView updateBannerViews](self->_bannerHostingView, "updateBannerViews");
}

- (UIVisualEffectView)backgroundVisualEffectView
{
  return -[SGBannerContent backgroundVisualEffectView](self->_banner, "backgroundVisualEffectView");
}

- (void)setSuggestionCategorySupportsBatchDismissal:(BOOL)a3
{
  -[SGBannerContent setSuggestionCategorySupportsBatchDismissal:](self->_banner, "setSuggestionCategorySupportsBatchDismissal:", a3);
}

- (BOOL)suggestionCategorySupportsBatchDismissal
{
  return -[SGBannerContent suggestionCategorySupportsBatchDismissal](self->_banner, "suggestionCategorySupportsBatchDismissal");
}

- (void)setIconSFSymbols:(id)a3
{
  -[SGBannerContent setIconSFSymbols:](self->_banner, "setIconSFSymbols:", a3);
}

- (NSArray)iconSFSymbols
{
  return -[SGBannerContent iconSFSymbols](self->_banner, "iconSFSymbols");
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SGBannerView;
  -[SGBannerView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
    -[SGBannerView reload](self, "reload");
}

- (void)setBackgroundColor:(id)a3
{
  -[SGBannerContent setBackgroundColor:](self->_banner, "setBackgroundColor:", a3);
  -[SGBannerContentHostingView updateBannerViews](self->_bannerHostingView, "updateBannerViews");
}

- (UIColor)backgroundColor
{
  return -[SGBannerContent backgroundColor](self->_banner, "backgroundColor");
}

- (SGBannerDividerParameter)bannerDivider
{
  return -[SGBannerContent bannerDivider](self->_banner, "bannerDivider");
}

- (void)setBannerDivider:(id)a3
{
  -[SGBannerContent setBannerDivider:](self->_banner, "setBannerDivider:", a3);
  -[SGBannerContentHostingView updateBannerViews](self->_bannerHostingView, "updateBannerViews");
}

- (void)invalidateBannerView
{
  -[SGBannerContentHostingView invalidateBannerView](self->_bannerHostingView, "invalidateBannerView");
}

- (double)actionButtonLeadingEdgeOffset
{
  double result;

  -[SGBannerContentHostingView actionButtonLeadingEdgeOffset](self->_bannerHostingView, "actionButtonLeadingEdgeOffset");
  return result;
}

- (_TtC17CoreSuggestionsUI26SGBannerContentHostingView)bannerHostingView
{
  return self->_bannerHostingView;
}

- (_TtC17CoreSuggestionsUI15SGBannerContent)banner
{
  return self->_banner;
}

- (void)setBanner:(id)a3
{
  objc_storeStrong((id *)&self->_banner, a3);
}

- (BOOL)orientationChanged
{
  return self->_orientationChanged;
}

- (void)setOrientationChanged:(BOOL)a3
{
  self->_orientationChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_banner, 0);
  objc_storeStrong((id *)&self->_bannerHostingView, 0);
}

@end
