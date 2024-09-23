@implementation SUUIProductPageHeaderFloatingView

- (SUUIProductPageHeaderFloatingView)initWithSectionTitles:(id)a3 isPad:(BOOL)a4
{
  id v6;
  SUUIProductPageHeaderFloatingView *v7;
  SUUIProductPageSegmentedControl *v8;
  UISegmentedControl *sectionControl;
  UISegmentedControl *v10;
  void *v11;
  void *v12;
  UIView *v13;
  UIView *separatorView;
  UIView *v15;
  void *v16;
  void *v17;
  objc_super v19;

  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUUIProductPageHeaderFloatingView;
  v7 = -[SUUIProductPageHeaderFloatingView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v7)
  {
    v8 = -[SUUIProductPageSegmentedControl initWithItems:]([SUUIProductPageSegmentedControl alloc], "initWithItems:", v6);
    sectionControl = v7->_sectionControl;
    v7->_sectionControl = &v8->super;

    -[UISegmentedControl setSelectedSegmentIndex:](v7->_sectionControl, "setSelectedSegmentIndex:", 0);
    v10 = v7->_sectionControl;
    -[SUUIColorScheme secondaryTextColor](v7->_colorScheme, "secondaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UISegmentedControl setTintColor:](v10, "setTintColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl setTintColor:](v10, "setTintColor:", v12);

    }
    -[SUUIProductPageHeaderFloatingView addSubview:](v7, "addSubview:", v7->_sectionControl);
    v13 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    separatorView = v7->_separatorView;
    v7->_separatorView = v13;

    v15 = v7->_separatorView;
    -[SUUIColorScheme primaryTextColor](v7->_colorScheme, "primaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.70588237, 1.0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v15, "setBackgroundColor:", v17);

    }
    -[SUUIProductPageHeaderFloatingView addSubview:](v7, "addSubview:", v7->_separatorView);
    v7->_isPad = a4;
    -[SUUIProductPageHeaderFloatingView _reloadBackdropView](v7, "_reloadBackdropView");
  }

  return v7;
}

- (void)setBackdropAlpha:(double)a3
{
  double v5;

  -[SUUIProductPageHeaderFloatingView backdropAlpha](self, "backdropAlpha");
  if (v5 != a3)
    -[UIView setAlpha:](self->_backdropAlphaView, "setAlpha:", a3);
}

- (double)backdropAlpha
{
  double result;

  -[UIView alpha](self->_backdropAlphaView, "alpha");
  return result;
}

- (void)setColorScheme:(id)a3
{
  SUUIColorScheme *v5;
  SUUIColorScheme **p_colorScheme;
  UISegmentedControl *sectionControl;
  void *v8;
  void *v9;
  UIView *separatorView;
  void *v11;
  void *v12;
  SUUIColorScheme *v13;

  v5 = (SUUIColorScheme *)a3;
  p_colorScheme = &self->_colorScheme;
  if (self->_colorScheme != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_colorScheme, a3);
    sectionControl = self->_sectionControl;
    -[SUUIColorScheme secondaryTextColor](*p_colorScheme, "secondaryTextColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[UISegmentedControl setTintColor:](sectionControl, "setTintColor:", v8);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.517647059, 1.0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[UISegmentedControl setTintColor:](sectionControl, "setTintColor:", v9);

    }
    separatorView = self->_separatorView;
    -[SUUIColorScheme primaryTextColor](*p_colorScheme, "primaryTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v11);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.70588237, 1.0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](separatorView, "setBackgroundColor:", v12);

    }
    -[SUUIProductPageHeaderFloatingView _reloadBackdropView](self, "_reloadBackdropView");
    v5 = v13;
  }

}

- (int64_t)selectedSectionIndex
{
  return -[UISegmentedControl selectedSegmentIndex](self->_sectionControl, "selectedSegmentIndex");
}

- (void)setSelectedSectionIndex:(int64_t)a3
{
  -[UISegmentedControl setSelectedSegmentIndex:](self->_sectionControl, "setSelectedSegmentIndex:", a3);
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
  UISegmentedControl *sectionControl;
  double v12;
  float v13;
  UIView *separatorView;
  void *v15;
  double v16;
  double v17;
  _UIBackdropView *backdropView;
  UIView *backdropAlphaView;

  -[SUUIProductPageHeaderFloatingView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  sectionControl = self->_sectionControl;
  if (sectionControl)
  {
    -[UISegmentedControl sizeToFit](sectionControl, "sizeToFit");
    -[UISegmentedControl frame](self->_sectionControl, "frame");
    if (self->_isPad)
      v12 = 290.0;
    else
      v12 = v8 + -30.0;
    v13 = (v8 - v12) * 0.5;
    -[UISegmentedControl setFrame:](self->_sectionControl, "setFrame:", roundf(v13), 10.0);
  }
  separatorView = self->_separatorView;
  if (separatorView)
  {
    -[UIView frame](separatorView, "frame");
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "scale");
    v17 = 1.0 / v16;

    -[UIView setFrame:](self->_separatorView, "setFrame:", 0.0, v10 - v17, v8, v17);
  }
  backdropView = self->_backdropView;
  if (backdropView)
    -[_UIBackdropView setFrame:](backdropView, "setFrame:", v4, v6, v8, v10);
  backdropAlphaView = self->_backdropAlphaView;
  if (backdropAlphaView)
    -[UIView setFrame:](backdropAlphaView, "setFrame:", v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  -[UISegmentedControl sizeThatFits:](self->_sectionControl, "sizeThatFits:", a3.width, a3.height);
  v5 = v4 + 20.0;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)_reloadBackdropView
{
  _UIBackdropView *v3;
  UIView *v4;
  void *v5;
  void *v6;
  _UIBackdropView *v7;
  _UIBackdropView *backdropView;
  UIView *v9;
  UIView *backdropAlphaView;
  UIView *v11;
  void *v12;
  void *v13;

  if (!self->_colorScheme && !self->_isPad)
  {
    if (!self->_backdropView)
    {
      v7 = (_UIBackdropView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB78]), "initWithPrivateStyle:", 10060);
      backdropView = self->_backdropView;
      self->_backdropView = v7;

      -[SUUIProductPageHeaderFloatingView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0);
    }
    if (!self->_backdropAlphaView)
    {
      v9 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
      backdropAlphaView = self->_backdropAlphaView;
      self->_backdropAlphaView = v9;

      v11 = self->_backdropAlphaView;
      -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v12);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v11, "setBackgroundColor:", v13);

      }
      -[SUUIProductPageHeaderFloatingView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropAlphaView, 1);
    }
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  -[_UIBackdropView removeFromSuperview](self->_backdropView, "removeFromSuperview");
  v3 = self->_backdropView;
  self->_backdropView = 0;

  -[UIView removeFromSuperview](self->_backdropAlphaView, "removeFromSuperview");
  v4 = self->_backdropAlphaView;
  self->_backdropAlphaView = 0;

  -[SUUIColorScheme backgroundColor](self->_colorScheme, "backgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
LABEL_13:
    -[SUUIProductPageHeaderFloatingView setBackgroundColor:](self, "setBackgroundColor:", v5);
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderFloatingView setBackgroundColor:](self, "setBackgroundColor:", v6);

LABEL_14:
  -[SUUIProductPageHeaderFloatingView setNeedsLayout](self, "setNeedsLayout");
}

- (SUUIColorScheme)colorScheme
{
  return self->_colorScheme;
}

- (UIControl)sectionControl
{
  return &self->_sectionControl->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_backdropAlphaView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_colorScheme, 0);
  objc_storeStrong((id *)&self->_sectionControl, 0);
}

@end
