@implementation MRUNowPlayingContainerView

- (MRUNowPlayingContainerView)initWithFrame:(CGRect)a3
{
  MRUNowPlayingContainerView *v3;
  MRUNowPlayingContainerView *v4;
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  UIView *v8;
  UIView *separatorView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRUNowPlayingContainerView;
  v3 = -[MRUNowPlayingContainerView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUNowPlayingContainerView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_backgroundView, "setBackgroundColor:", v7);

    -[UIView setAlpha:](v4->_backgroundView, "setAlpha:", 0.1);
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v4->_backgroundView, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
    -[MRUNowPlayingContainerView addSubview:](v4, "addSubview:", v4->_backgroundView);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separatorView, "setBackgroundColor:", v10);

    -[MRUNowPlayingContainerView addSubview:](v4, "addSubview:", v4->_separatorView);
    v4->_showSeparator = 1;
    -[MRUNowPlayingContainerView updateVisibility](v4, "updateVisibility");
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double Width;
  void *v17;
  double v18;
  CGFloat v19;
  CGFloat MinX;
  CGFloat MinY;
  CGFloat Height;
  objc_super v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v23.receiver = self;
  v23.super_class = (Class)MRUNowPlayingContainerView;
  -[MRUNowPlayingContainerView layoutSubviews](&v23, sel_layoutSubviews);
  -[MRUNowPlayingContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    -[MRUNowPlayingContainerView traitCollection](self, "traitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayScale");
    v19 = 1.0 / v18;

    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    MinX = CGRectGetMinX(v28);
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    MinY = CGRectGetMinY(v29);
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    Height = CGRectGetHeight(v30);
    -[MRUNowPlayingContainerView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIView setFrame:](self->_separatorView, "setFrame:");
    v31.origin.x = MinX;
    v31.origin.y = MinY;
    v31.size.width = v19;
    v31.size.height = Height;
    CGRectGetWidth(v31);
  }
  else
  {
    -[MRUNowPlayingContainerView traitCollection](self, "traitCollection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "displayScale");
    v13 = 1.0 / v12;

    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    v14 = CGRectGetMinX(v24);
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    v15 = CGRectGetMinY(v25);
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    Width = CGRectGetWidth(v26);
    -[UIView setFrame:](self->_separatorView, "setFrame:", v14, v15, Width, v13);
    v27.origin.x = v14;
    v27.origin.y = v15;
    v27.size.width = Width;
    v27.size.height = v13;
    CGRectGetHeight(v27);
  }
  UIRectInset();
  -[MRUNowPlayingContainerView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[MRUNowPlayingContainerView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_contentView, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v6 = 0.0;
  if (self->_showSeparator && self->_supportsHorizontalLayout && !MRULayoutShouldBeVertical())
  {
    -[MRUNowPlayingContainerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayScale");
    v9 = 1.0 / v8;

    height = height - v9;
    v6 = v9 + 0.0;
  }
  -[UIView sizeThatFits:](self->_contentView, "sizeThatFits:", width, height);
  v11 = v6 + v10;
  v12 = width;
  result.height = v11;
  result.width = v12;
  return result;
}

- (void)setContentView:(id)a3
{
  UIView *v5;
  UIView *contentView;
  UIView *v7;
  _QWORD v8[5];

  v5 = (UIView *)a3;
  contentView = self->_contentView;
  if (contentView != v5)
  {
    v7 = v5;
    -[UIView removeFromSuperview](contentView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_contentView, a3);
    -[MRUNowPlayingContainerView addSubview:](self, "addSubview:", self->_contentView);
    -[MRUNowPlayingContainerView setNeedsLayout](self, "setNeedsLayout");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__MRUNowPlayingContainerView_setContentView___block_invoke;
    v8[3] = &unk_1E5818C88;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    v5 = v7;
  }

}

uint64_t __45__MRUNowPlayingContainerView_setContentView___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUNowPlayingContainerView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setShowSeparator:(BOOL)a3
{
  if (self->_showSeparator != a3)
  {
    self->_showSeparator = a3;
    -[MRUNowPlayingContainerView updateVisibility](self, "updateVisibility");
    -[MRUNowPlayingContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (void)updateVisibility
{
  -[UIView setHidden:](self->_separatorView, "setHidden:", !self->_showSeparator);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (BOOL)showSeparator
{
  return self->_showSeparator;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  self->_supportsHorizontalLayout = a3;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
