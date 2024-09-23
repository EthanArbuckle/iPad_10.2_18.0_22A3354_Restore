@implementation MRUMediaControlsModuleRoutingView

- (MRUMediaControlsModuleRoutingView)initWithFrame:(CGRect)a3
{
  MRUMediaControlsModuleRoutingView *v3;
  MRUMediaControlsModuleRoutingView *v4;
  UIView *v5;
  UIView *backgroundView;
  void *v7;
  UIView *v8;
  UIView *separatorView;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)MRUMediaControlsModuleRoutingView;
  v3 = -[MRUMediaControlsModuleRoutingView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MRUMediaControlsModuleRoutingView setClipsToBounds:](v3, "setClipsToBounds:", 1);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    backgroundView = v4->_backgroundView;
    v4->_backgroundView = v5;

    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.952941176, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_backgroundView, "setBackgroundColor:", v7);

    -[MRUMediaControlsModuleRoutingView addSubview:](v4, "addSubview:", v4->_backgroundView);
    -[UIView _setDrawsAsBackdropOverlayWithBlendMode:](v4->_backgroundView, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
    v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    separatorView = v4->_separatorView;
    v4->_separatorView = v8;

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_separatorView, "setBackgroundColor:", v10);

    -[MRUMediaControlsModuleRoutingView addSubview:](v4, "addSubview:", v4->_separatorView);
  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  CGFloat width;
  CGFloat height;
  BOOL ShouldBeVertical;
  void *v10;
  double v11;
  double v12;
  double MinX;
  double MinY;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  objc_super v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21.receiver = self;
  v21.super_class = (Class)MRUMediaControlsModuleRoutingView;
  -[MRUMediaControlsModuleRoutingView layoutSubviews](&v21, sel_layoutSubviews);
  -[MRUMediaControlsModuleRoutingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  width = self->_contentSize.width;
  height = self->_contentSize.height;
  ShouldBeVertical = MRULayoutShouldBeVertical();
  -[MRUMediaControlsModuleRoutingView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");
  v12 = 1.0 / v11;

  v22.origin.x = v4;
  v22.origin.y = v6;
  v22.size.width = width;
  v22.size.height = height;
  MinX = CGRectGetMinX(v22);
  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = width;
  v23.size.height = height;
  MinY = CGRectGetMinY(v23);
  v15 = v4;
  v16 = v6;
  v17 = width;
  v18 = height;
  if (ShouldBeVertical)
  {
    v19 = CGRectGetWidth(*(CGRect *)&v15);
    -[UIView setFrame:](self->_separatorView, "setFrame:", MinX, MinY, v19, v12);
    v24.origin.x = MinX;
    v24.origin.y = MinY;
    v24.size.width = v19;
    v24.size.height = v12;
    CGRectGetHeight(v24);
  }
  else
  {
    v20 = CGRectGetHeight(*(CGRect *)&v15);
    -[MRUMediaControlsModuleRoutingView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[UIView setFrame:](self->_separatorView, "setFrame:");
    v25.origin.x = MinX;
    v25.origin.y = MinY;
    v25.size.width = v12;
    v25.size.height = v20;
    CGRectGetWidth(v25);
  }
  UIRectInset();
  -[MRUMediaControlsModuleRoutingView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[MRUMediaControlsModuleRoutingView bounds](self, "bounds");
  MPRectByApplyingUserInterfaceLayoutDirectionInRect();
  -[UIView setFrame:](self->_contentView, "setFrame:");
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
    -[MRUMediaControlsModuleRoutingView addSubview:](self, "addSubview:", self->_contentView);
    -[MRUMediaControlsModuleRoutingView setNeedsLayout](self, "setNeedsLayout");
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__MRUMediaControlsModuleRoutingView_setContentView___block_invoke;
    v8[3] = &unk_1E5818C88;
    v8[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v8);
    v5 = v7;
  }

}

uint64_t __52__MRUMediaControlsModuleRoutingView_setContentView___block_invoke(uint64_t a1)
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
    -[MRUMediaControlsModuleRoutingView updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (void)setContentSize:(CGSize)a3
{
  _QWORD v5[5];

  if (a3.width != self->_contentSize.width || a3.height != self->_contentSize.height)
  {
    self->_contentSize = a3;
    -[MRUMediaControlsModuleRoutingView setNeedsLayout](self, "setNeedsLayout");
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __52__MRUMediaControlsModuleRoutingView_setContentSize___block_invoke;
    v5[3] = &unk_1E5818C88;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v5);
  }
}

uint64_t __52__MRUMediaControlsModuleRoutingView_setContentSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)updateVisualStyling
{
  -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 4, self->_separatorView);
}

- (UIView)contentView
{
  return self->_contentView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
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
