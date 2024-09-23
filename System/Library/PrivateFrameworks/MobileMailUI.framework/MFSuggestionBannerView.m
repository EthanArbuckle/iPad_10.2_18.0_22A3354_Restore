@implementation MFSuggestionBannerView

- (MFSuggestionBannerView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  MFSuggestionBannerView *v9;
  MFSuggestionBannerView *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D19F08]), "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v12.receiver = self;
  v12.super_class = (Class)MFSuggestionBannerView;
  v9 = -[MFMessageHeaderViewBlock initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v10 = v9;
  if (v9)
    -[MFSuggestionBannerView commonInitWithBanner:](v9, "commonInitWithBanner:", v8);

  return v10;
}

- (MFSuggestionBannerView)initWithFrame:(CGRect)a3 banner:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  MFSuggestionBannerView *v10;
  MFSuggestionBannerView *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MFSuggestionBannerView;
  v10 = -[MFMessageHeaderViewBlock initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
    -[MFSuggestionBannerView commonInitWithBanner:](v10, "commonInitWithBanner:", v9);
  -[MFSuggestionBannerView setAccessibilityIdentifier:](v11, "setAccessibilityIdentifier:", *MEMORY[0x1E0D46B60]);

  return v11;
}

- (void)commonInitWithBanner:(id)a3
{
  id v5;

  v5 = a3;
  objc_msgSend(v5, "setInsetsLayoutMarginsFromSafeArea:", 0);
  objc_storeStrong((id *)&self->_banner, a3);
  -[MFSuggestionBannerView addSubview:](self, "addSubview:", self->_banner);
  -[MFSuggestionBannerView _configureBannerAppearance]((id *)&self->super.super.super.super.isa);

}

- (void)_configureBannerAppearance
{
  void *v2;
  id v3;

  if (a1)
  {
    if (objc_msgSend(a1, "mf_debugModeEnabled"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "colorWithAlphaComponent:", 0.2);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[62], "setBackgroundColor:", v2);

    }
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (!v4)
  {
    -[MFSuggestionBannerView banner](self, "banner");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCloseButtonXAnchorOffset:", 0.0);

    -[MFSuggestionBannerView bannerConstraints](self, "bannerConstraints");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", v6);

    v4 = 0;
  }

}

- (void)setBanner:(id)a3
{
  SGBannerProtocol *v5;
  SGBannerProtocol *banner;
  SGBannerProtocol *v7;

  v5 = (SGBannerProtocol *)a3;
  banner = self->_banner;
  v7 = v5;
  if (banner != v5)
    -[SGBannerProtocol removeFromSuperview](banner, "removeFromSuperview");
  -[MFSuggestionBannerView addSubview:](self, "addSubview:", v7);
  objc_storeStrong((id *)&self->_banner, a3);
  -[MFSuggestionBannerView _configureBannerAppearance]((id *)&self->super.super.super.super.isa);

}

- (id)_constraintsForEdges:(unint64_t)a3 banner:(id)a4 useLayoutMarginsGuide:(BOOL)a5
{
  char v5;
  id v7;
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

  v5 = a3;
  v7 = a4;
  objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MFSuggestionBannerView leadingAnchor](self, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFSuggestionBannerView trailingAnchor](self, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v5 & 2) != 0)
  {
    objc_msgSend(v7, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

  }
  if ((v5 & 8) != 0)
  {
    objc_msgSend(v7, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v14);

  }
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v7, "topAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSuggestionBannerView topAnchor](self, "topAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v17);

  }
  if ((v5 & 4) != 0)
  {
    objc_msgSend(v7, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSuggestionBannerView bottomAnchor](self, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v20);

  }
  return v10;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  objc_super v11;

  -[MFSuggestionBannerView bannerConstraints](self, "bannerConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[MFSuggestionBannerView banner](self, "banner");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFMessageHeaderViewBlock displayMetrics](self, "displayMetrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSuggestionBannerView _constraintsForEdges:banner:useLayoutMarginsGuide:](self, "_constraintsForEdges:banner:useLayoutMarginsGuide:", 15, v4, objc_msgSend(v5, "prefersFlushSeparator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFSuggestionBannerView setBannerConstraints:](self, "setBannerConstraints:", v6);

    -[MFMessageHeaderViewBlock displayMetrics](self, "displayMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v5) = objc_msgSend(v7, "prefersFlushSeparator");

    v8 = 0.0;
    if ((_DWORD)v5)
      -[MFSuggestionBannerView trailingOffsetToMarginForCloseButtonAlignment](self, "trailingOffsetToMarginForCloseButtonAlignment", 0.0);
    -[SGBannerProtocol setCloseButtonXAnchorOffset:](self->_banner, "setCloseButtonXAnchorOffset:", v8);
    -[SGBannerProtocol reload](self->_banner, "reload");
    v9 = (void *)MEMORY[0x1E0CB3718];
    -[MFSuggestionBannerView bannerConstraints](self, "bannerConstraints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)MFSuggestionBannerView;
  -[MFMessageHeaderViewBlock updateConstraints](&v11, sel_updateConstraints);
}

- (void)setSeparatorDrawsFlushWithLeadingEdge:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSuggestionBannerView;
  -[MFMessageHeaderViewBlock setSeparatorDrawsFlushWithLeadingEdge:](&v3, sel_setSeparatorDrawsFlushWithLeadingEdge_, 1);
}

- (void)setSeparatorDrawsFlushWithTrailingEdge:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MFSuggestionBannerView;
  -[MFMessageHeaderViewBlock setSeparatorDrawsFlushWithTrailingEdge:](&v3, sel_setSeparatorDrawsFlushWithTrailingEdge_, 1);
}

- (double)trailingOffsetToMarginForCloseButtonAlignment
{
  return 6.0;
}

- (SGBannerProtocol)banner
{
  return self->_banner;
}

- (NSArray)bannerConstraints
{
  return self->_bannerConstraints;
}

- (void)setBannerConstraints:(id)a3
{
  objc_storeStrong((id *)&self->_bannerConstraints, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerConstraints, 0);
  objc_storeStrong((id *)&self->_banner, 0);
}

@end
