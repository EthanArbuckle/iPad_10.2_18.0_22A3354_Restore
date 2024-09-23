@implementation SFBannerBackgroundView

- (SFBannerBackgroundView)initWithEffect:(id)a3
{
  SFBannerBackgroundView *v3;
  SFBannerBackgroundView *v4;
  void *v5;
  id v6;
  SFBannerBackgroundView *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)SFBannerBackgroundView;
  v3 = -[SFBannerBackgroundView initWithEffect:](&v9, sel_initWithEffect_, a3);
  v4 = v3;
  if (v3)
  {
    -[SFBannerBackgroundView _updateStyle](v3, "_updateStyle");
    v10[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (id)-[SFBannerBackgroundView registerForTraitChanges:withTarget:action:](v4, "registerForTraitChanges:withTarget:action:", v5, v4, sel__updateVibrancy);

    v7 = v4;
  }

  return v4;
}

- (void)setBannerStyle:(int64_t)a3
{
  _QWORD v3[5];

  if (self->_bannerStyle != a3)
  {
    self->_bannerStyle = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __41__SFBannerBackgroundView_setBannerStyle___block_invoke;
    v3[3] = &unk_1E21E2050;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v3);
  }
}

uint64_t __41__SFBannerBackgroundView_setBannerStyle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateStyle");
}

- (void)_updateStyle
{
  int64_t bannerStyle;
  double v4;

  bannerStyle = self->_bannerStyle;
  if (!bannerStyle)
  {
    v4 = 10.0;
    goto LABEL_5;
  }
  if (bannerStyle == 1)
  {
    v4 = 8.0;
LABEL_5:
    -[SFBannerBackgroundView _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v4);
  }
  -[SFBannerBackgroundView _updateVibrancy](self, "_updateVibrancy");
}

- (void)_updateVibrancy
{
  void *v3;
  int v4;
  void *v5;
  int64_t bannerStyle;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  -[SFBannerBackgroundView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "sf_usesVibrantAppearance");

  if (v4)
  {
    -[SFBannerBackgroundView contentView](self, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", 0);

    bannerStyle = self->_bannerStyle;
    v7 = 10;
    if (bannerStyle != 1)
      v7 = 0;
    if (bannerStyle)
      v8 = v7;
    else
      v8 = 6;
    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", v8);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[SFBannerBackgroundView setEffect:](self, "setEffect:");
  }
  else
  {
    -[SFBannerBackgroundView setEffect:](self, "setEffect:", 0);
    v9 = self->_bannerStyle;
    if (v9 == 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemGroupedBackgroundColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9)
        return;
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (id)v10;
    -[SFBannerBackgroundView contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v12);

  }
}

- (int64_t)bannerStyle
{
  return self->_bannerStyle;
}

@end
