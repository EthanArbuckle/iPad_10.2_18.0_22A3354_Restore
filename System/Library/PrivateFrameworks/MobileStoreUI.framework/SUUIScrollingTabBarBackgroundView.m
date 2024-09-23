@implementation SUUIScrollingTabBarBackgroundView

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
  _UIBackdropView *backdropView;
  double v17;
  double MinX;
  CGFloat v19;
  double v20;
  CGFloat v21;
  objc_super v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v22.receiver = self;
  v22.super_class = (Class)SUUIScrollingTabBarBackgroundView;
  -[SUUIScrollingTabBarBackgroundView layoutSubviews](&v22, sel_layoutSubviews);
  -[SUUIScrollingTabBarBackgroundView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SUUIScrollingTabBarBackgroundView traitCollection](self, "traitCollection");
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
  backdropView = self->_backdropView;
  if (backdropView)
    -[_UIBackdropView setFrame:](backdropView, "setFrame:", v4, v6, v8, v10);
  v17 = 1.0 / v13;
  if (self->_topHairlineView)
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    MinX = CGRectGetMinX(v23);
    v24.origin.x = v4;
    v24.origin.y = v6;
    v24.size.width = v8;
    v24.size.height = v10;
    v19 = CGRectGetMinY(v24) - v17;
    v25.origin.x = v4;
    v25.origin.y = v6;
    v25.size.width = v8;
    v25.size.height = v10;
    -[UIView setFrame:](self->_topHairlineView, "setFrame:", MinX, v19, CGRectGetWidth(v25), v17);
  }
  if (self->_bottomHairlineView)
  {
    v26.origin.x = v4;
    v26.origin.y = v6;
    v26.size.width = v8;
    v26.size.height = v10;
    v20 = CGRectGetMinX(v26);
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    v21 = CGRectGetMaxY(v27) - v17;
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    -[UIView setFrame:](self->_bottomHairlineView, "setFrame:", v20, v21, CGRectGetWidth(v28), v17);
  }
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
  v10.super_class = (Class)SUUIScrollingTabBarBackgroundView;
  v4 = a3;
  -[SUUIScrollingTabBarBackgroundView traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "displayScale", v10.receiver, v10.super_class);
  v6 = v5;

  -[SUUIScrollingTabBarBackgroundView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");
  v9 = vabdd_f64(v6, v8);

  if (v9 > 0.00000011920929)
    -[SUUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackdropBarGroupName:(id)a3
{
  NSString *v4;
  NSString *v5;
  NSString *v6;
  NSString *backdropBarGroupName;
  _UIBackdropView *backdropView;
  NSString *v9;

  v4 = (NSString *)a3;
  v5 = v4;
  if (self->_backdropBarGroupName != v4)
  {
    v9 = v4;
    v6 = (NSString *)-[NSString copy](v4, "copy");
    backdropBarGroupName = self->_backdropBarGroupName;
    self->_backdropBarGroupName = v6;

    v5 = v9;
    backdropView = self->_backdropView;
    if (backdropView)
    {
      -[_UIBackdropView setGroupName:](backdropView, "setGroupName:", v9);
      v5 = v9;
    }
  }

}

- (void)setShowsBackdrop:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  _UIBackdropView *v6;
  _UIBackdropView *backdropView;

  if (self->_showsBackdrop != a3)
  {
    self->_showsBackdrop = a3;
    if (a3)
    {
      if (self->_backdropView)
      {
        v4 = 0;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x24BEBDB78]);
        -[SUUIScrollingTabBarBackgroundView bounds](self, "bounds");
        v6 = (_UIBackdropView *)objc_msgSend(v5, "initWithFrame:privateStyle:", 2010);
        backdropView = self->_backdropView;
        self->_backdropView = v6;

        -[_UIBackdropView setUserInteractionEnabled:](self->_backdropView, "setUserInteractionEnabled:", 0);
        if (self->_backdropBarGroupName)
          -[_UIBackdropView setGroupName:](self->_backdropView, "setGroupName:");
        -[SUUIScrollingTabBarBackgroundView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_backdropView, 0);
        -[SUUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
        v4 = !self->_showsBackdrop;
      }
    }
    else
    {
      v4 = 1;
    }
    -[_UIBackdropView setHidden:](self->_backdropView, "setHidden:", v4);
  }
}

- (void)setShowsBottomHairline:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  UIView *v6;
  UIView *bottomHairlineView;
  UIView *v8;
  void *v9;

  if (self->_showsBottomHairline != a3)
  {
    self->_showsBottomHairline = a3;
    if (a3)
    {
      if (self->_bottomHairlineView)
      {
        v4 = 0;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x24BEBDB00]);
        v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        bottomHairlineView = self->_bottomHairlineView;
        self->_bottomHairlineView = v6;

        v8 = self->_bottomHairlineView;
        objc_msgSend(MEMORY[0x24BEBD4B8], "_barHairlineShadowColor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIView setBackgroundColor:](v8, "setBackgroundColor:", v9);

        -[UIView setUserInteractionEnabled:](self->_bottomHairlineView, "setUserInteractionEnabled:", 0);
        -[SUUIScrollingTabBarBackgroundView addSubview:](self, "addSubview:", self->_bottomHairlineView);
        -[SUUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
        v4 = !self->_showsBottomHairline;
      }
    }
    else
    {
      v4 = 1;
    }
    -[UIView setHidden:](self->_bottomHairlineView, "setHidden:", v4);
  }
}

- (void)setShowsTopHairline:(BOOL)a3
{
  _BOOL8 v4;
  id v5;
  UIView *v6;
  UIView *topHairlineView;

  if (self->_showsTopHairline != a3)
  {
    self->_showsTopHairline = a3;
    if (a3)
    {
      if (self->_topHairlineView)
      {
        v4 = 0;
      }
      else
      {
        v5 = objc_alloc(MEMORY[0x24BEBDB00]);
        v6 = (UIView *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        topHairlineView = self->_topHairlineView;
        self->_topHairlineView = v6;

        -[UIView setUserInteractionEnabled:](self->_topHairlineView, "setUserInteractionEnabled:", 0);
        -[SUUIScrollingTabBarBackgroundView _updateTopHairlineColor](self, "_updateTopHairlineColor");
        -[SUUIScrollingTabBarBackgroundView addSubview:](self, "addSubview:", self->_topHairlineView);
        -[SUUIScrollingTabBarBackgroundView setNeedsLayout](self, "setNeedsLayout");
        v4 = !self->_showsTopHairline;
      }
    }
    else
    {
      v4 = 1;
    }
    -[UIView setHidden:](self->_topHairlineView, "setHidden:", v4);
  }
}

- (void)setUsesOpaqueColorForTopHairline:(BOOL)a3
{
  if (self->_usesOpaqueColorForTopHairline != a3)
  {
    self->_usesOpaqueColorForTopHairline = a3;
    -[SUUIScrollingTabBarBackgroundView _updateTopHairlineColor](self, "_updateTopHairlineColor");
  }
}

- (void)_updateTopHairlineColor
{
  id v3;

  if (self->_usesOpaqueColorForTopHairline)
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.615686275, 1.0);
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "_barHairlineShadowColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIView setBackgroundColor:](self->_topHairlineView, "setBackgroundColor:", v3);

}

- (NSString)backdropBarGroupName
{
  return self->_backdropBarGroupName;
}

- (BOOL)showsBackdrop
{
  return self->_showsBackdrop;
}

- (BOOL)showsBottomHairline
{
  return self->_showsBottomHairline;
}

- (BOOL)showsTopHairline
{
  return self->_showsTopHairline;
}

- (BOOL)usesOpaqueColorForTopHairline
{
  return self->_usesOpaqueColorForTopHairline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropBarGroupName, 0);
  objc_storeStrong((id *)&self->_topHairlineView, 0);
  objc_storeStrong((id *)&self->_bottomHairlineView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end
