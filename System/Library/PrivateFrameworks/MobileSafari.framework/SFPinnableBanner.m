@implementation SFPinnableBanner

+ (double)unpinAnimationDuration
{
  return 0.25;
}

+ (double)unpinAnimationDelay
{
  return 6.0;
}

+ (double)pinAnimationDelay
{
  return 0.0;
}

+ (BOOL)omitsBottomSeparator
{
  return 0;
}

- (SFPinnableBanner)initWithFrame:(CGRect)a3
{
  SFPinnableBanner *v3;
  SFPinnableBanner *v4;
  SFPinnableBanner *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFPinnableBanner;
  v3 = -[SFPinnableBanner initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_separableFromStatusBar = 1;
    -[SFPinnableBanner _setUpSeparators](v3, "_setUpSeparators");
    v5 = v4;
  }

  return v4;
}

- (void)_setUpSeparators
{
  UIView *v3;
  UIView *topSeparator;
  void *v5;
  double Width;
  void *v7;
  UIView *v8;
  UIView *bottomSeparator;
  void *v10;
  double Height;
  double v12;
  double v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  v3 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
  topSeparator = self->_topSeparator;
  self->_topSeparator = v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", v5);

  -[SFPinnableBanner bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[UIView setFrame:](self->_topSeparator, "setFrame:", 0.0, 0.0, Width, _SFOnePixel());
  -[UIView setAutoresizingMask:](self->_topSeparator, "setAutoresizingMask:", 34);
  -[SFPinnableBanner addSubview:](self, "addSubview:", self->_topSeparator);
  if ((objc_msgSend((id)objc_opt_class(), "omitsBottomSeparator") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineOutlineColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_topSeparator, "setBackgroundColor:", v7);

    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    bottomSeparator = self->_bottomSeparator;
    self->_bottomSeparator = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_bottomSeparator, "setBackgroundColor:", v10);

    -[SFPinnableBanner bounds](self, "bounds");
    Height = CGRectGetHeight(v15);
    v12 = Height - _SFOnePixel();
    -[SFPinnableBanner bounds](self, "bounds");
    v13 = CGRectGetWidth(v16);
    -[UIView setFrame:](self->_bottomSeparator, "setFrame:", 0.0, v12, v13, _SFOnePixel());
    -[UIView setAutoresizingMask:](self->_bottomSeparator, "setAutoresizingMask:", 10);
    -[SFPinnableBanner addSubview:](self, "addSubview:", self->_bottomSeparator);
  }
}

- (void)setShowsTopSeparator:(BOOL)a3
{
  -[UIView setHidden:](self->_topSeparator, "setHidden:", !a3);
}

- (BOOL)showsTopSeparator
{
  UIView *topSeparator;

  topSeparator = self->_topSeparator;
  if (topSeparator)
    LOBYTE(topSeparator) = !-[UIView isHidden](topSeparator, "isHidden");
  return (char)topSeparator;
}

- (void)setShowsBottomSeparator:(BOOL)a3
{
  -[UIView setHidden:](self->_bottomSeparator, "setHidden:", !a3);
}

- (BOOL)showsBottomSeparator
{
  UIView *bottomSeparator;

  bottomSeparator = self->_bottomSeparator;
  if (bottomSeparator)
    LOBYTE(bottomSeparator) = !-[UIView isHidden](bottomSeparator, "isHidden");
  return (char)bottomSeparator;
}

- (BOOL)shouldUsePlainTheme
{
  return 0;
}

- (void)setTheme:(id)a3
{
  -[SFPinnableBanner setTheme:animated:](self, "setTheme:animated:", a3, 0);
}

- (void)setTheme:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  v4 = a4;
  v7 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_theme, a3);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __38__SFPinnableBanner_setTheme_animated___block_invoke;
    aBlock[3] = &unk_1E21E2050;
    aBlock[4] = self;
    v8 = _Block_copy(aBlock);
    v9 = v8;
    if (v4)
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 50331650, v8, 0);
    else
      (*((void (**)(void *))v8 + 2))(v8);

  }
}

void __38__SFPinnableBanner_setTheme_animated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_setLocalOverrideTraitCollection:", v2);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "overrideTintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setTintColor:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "separatorColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineOutlineColor");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 416), "setBackgroundColor:", v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setBackgroundColor:", v7);
  objc_msgSend(*(id *)(a1 + 32), "themeDidChange");

}

- (BOOL)isPinnedToTop
{
  return self->_pinnedToTop;
}

- (void)setPinnedToTop:(BOOL)a3
{
  self->_pinnedToTop = a3;
}

- (NSNumber)pinnedOffset
{
  return self->_pinnedOffset;
}

- (void)setPinnedOffset:(id)a3
{
  objc_storeStrong((id *)&self->_pinnedOffset, a3);
}

- (BOOL)separableFromStatusBar
{
  return self->_separableFromStatusBar;
}

- (void)setSeparableFromStatusBar:(BOOL)a3
{
  self->_separableFromStatusBar = a3;
}

- (BOOL)isInitiallyBehindNavigationBar
{
  return self->_initiallyBehindNavigationBar;
}

- (void)setInitiallyBehindNavigationBar:(BOOL)a3
{
  self->_initiallyBehindNavigationBar = a3;
}

- (SFBannerTheme)theme
{
  return self->_theme;
}

- (SFOverlayProvider)overlayProvider
{
  return self->_overlayProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayProvider, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_pinnedOffset, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
}

@end
