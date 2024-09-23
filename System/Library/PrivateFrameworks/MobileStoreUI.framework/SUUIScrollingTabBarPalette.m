@implementation SUUIScrollingTabBarPalette

- (SUUIScrollingTabBarPalette)initWithFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SUUIScrollingTabBarPalette *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  SUUIScrollingTabBarBackgroundView *v16;
  SUUIScrollingTabBarBackgroundView *backgroundView;
  uint64_t v18;
  UIView *contentView;
  objc_super v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v21.receiver = self;
  v21.super_class = (Class)SUUIScrollingTabBarPalette;
  v7 = -[SUUIScrollingTabBarPalette initWithFrame:](&v21, sel_initWithFrame_);
  if (v7)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v7->_paletteHeight = CGRectGetHeight(v22);
    -[SUUIScrollingTabBarPalette bounds](v7, "bounds");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = -[SUUIScrollingTabBarBackgroundView initWithFrame:]([SUUIScrollingTabBarBackgroundView alloc], "initWithFrame:", v8, v10, v12, v14);
    backgroundView = v7->_backgroundView;
    v7->_backgroundView = v16;

    -[SUUIScrollingTabBarPalette addSubview:](v7, "addSubview:", v7->_backgroundView);
    v18 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v9, v11, v13, v15);
    contentView = v7->_contentView;
    v7->_contentView = (UIView *)v18;

    -[SUUIScrollingTabBarPalette addSubview:](v7, "addSubview:", v7->_contentView);
    v7->_tabBarBackgroundExtendsBehindPalette = 1;
  }
  return v7;
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
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIScrollingTabBarPalette;
  -[SUUIScrollingTabBarPalette layoutSubviews](&v16, sel_layoutSubviews);
  -[SUUIScrollingTabBarPalette bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIScrollingTabBarPalette traitCollection](self, "traitCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "displayScale");
  v13 = v12;

  if (v13 < 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "scale");
    v13 = v15;

  }
  -[SUUIScrollingTabBarBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v8, v10);
  -[UIView setFrame:](self->_contentView, "setFrame:", v4, v6, v8, v10 + -1.0 / v13);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIScrollingTabBarPalette;
  v4 = a3;
  -[SUUIScrollingTabBarPalette traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[SUUIScrollingTabBarPalette traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929)
    -[SUUIScrollingTabBarPalette setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTabBarBackgroundExtendsBehindPalette:(BOOL)a3
{
  id WeakRetained;

  if (self->_tabBarBackgroundExtendsBehindPalette != a3)
  {
    self->_tabBarBackgroundExtendsBehindPalette = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(WeakRetained, "tabBarBackgroundExtendsBehindPaletteDidChangeForPalette:", self);

  }
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (void)_setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (double)paletteHeight
{
  return self->_paletteHeight;
}

- (BOOL)tabBarBackgroundExtendsBehindPalette
{
  return self->_tabBarBackgroundExtendsBehindPalette;
}

- (SUUIScrollingTabBarPaletteDelegate)_delegate
{
  return (SUUIScrollingTabBarPaletteDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SUUIScrollingTabBarBackgroundView)_backgroundView
{
  return self->_backgroundView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end
