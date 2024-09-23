@implementation AKToolbarBackgroundView

- (AKToolbarBackgroundView)initWithFrame:(CGRect)a3
{
  AKToolbarBackgroundView *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)AKToolbarBackgroundView;
  v3 = -[AKToolbarBackgroundView initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "_secondarySystemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarBackgroundView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_blurStyle = 2;
    v5 = objc_alloc(MEMORY[0x24BDF6F90]);
    v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[AKToolbarBackgroundView setSeparatorLine:](v3, "setSeparatorLine:", v6);

    objc_msgSend(MEMORY[0x24BDF6950], "_separatorColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarBackgroundView separatorLine](v3, "separatorLine");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

    -[AKToolbarBackgroundView separatorLine](v3, "separatorLine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[AKToolbarBackgroundView separatorLine](v3, "separatorLine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "heightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    objc_msgSend(v11, "constraintEqualToConstant:", 1.0 / v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setActive:", 1);

    -[AKToolbarBackgroundView _hostSeparatorInView:](v3, "_hostSeparatorInView:", v3);
  }
  return v3;
}

- (void)setOpaque:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKToolbarBackgroundView;
  -[AKToolbarBackgroundView setOpaque:](&v4, sel_setOpaque_, a3);
  -[AKToolbarBackgroundView updateSeparatorVisibility](self, "updateSeparatorVisibility");
}

- (void)setBackgroundColor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AKToolbarBackgroundView;
  -[AKToolbarBackgroundView setBackgroundColor:](&v4, sel_setBackgroundColor_, a3);
  -[AKToolbarBackgroundView updateSeparatorVisibility](self, "updateSeparatorVisibility");
}

- (void)updateSeparatorVisibility
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  if (-[AKToolbarBackgroundView isTranslucent](self, "isTranslucent"))
  {
    v3 = 0;
  }
  else if (-[AKToolbarBackgroundView isOpaque](self, "isOpaque"))
  {
    -[AKToolbarBackgroundView backgroundColor](self, "backgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v3 = 1;
  }
  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", v3);

}

- (void)setBlurStyle:(int64_t)a3
{
  id v4;

  if (self->_blurStyle != a3)
  {
    self->_blurStyle = a3;
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", -[AKToolbarBackgroundView blurStyle](self, "blurStyle"));
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", v4);

  }
}

- (void)setTranslucent:(BOOL)a3
{
  void *v4;
  UIVisualEffectView *v5;
  UIVisualEffectView *visualEffectView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  self->_translucent = a3;
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", -[AKToolbarBackgroundView blurStyle](self, "blurStyle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (UIVisualEffectView *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6FC8]), "initWithEffect:", v4);
    visualEffectView = self->_visualEffectView;
    self->_visualEffectView = v5;

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setBackgroundColor:](self->_visualEffectView, "setBackgroundColor:", v7);

    -[UIView ak_addSubview:withEdgeInsets:](self, "ak_addSubview:withEdgeInsets:", self->_visualEffectView, *MEMORY[0x24BDF7718], *(double *)(MEMORY[0x24BDF7718] + 8), *(double *)(MEMORY[0x24BDF7718] + 16), *(double *)(MEMORY[0x24BDF7718] + 24));
    -[AKToolbarBackgroundView sendSubviewToBack:](self, "sendSubviewToBack:", self->_visualEffectView);
    -[UIVisualEffectView contentView](self->_visualEffectView, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AKToolbarBackgroundView _hostSeparatorInView:](self, "_hostSeparatorInView:", v8);

    -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOpaque:", 0);

  }
  else
  {
    -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setOpaque:", 1);

    -[AKToolbarBackgroundView _hostSeparatorInView:](self, "_hostSeparatorInView:", self);
    -[UIVisualEffectView removeFromSuperview](self->_visualEffectView, "removeFromSuperview");
    v4 = self->_visualEffectView;
    self->_visualEffectView = 0;
  }

  -[AKToolbarBackgroundView updateSeparatorVisibility](self, "updateSeparatorVisibility");
}

- (void)setSeparatorColor:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)setBackgroundImage:(id)a3 forToolbarPosition:(int64_t)a4 barMetrics:(int64_t)a5
{
  NSLog(CFSTR("MarkupViewController toolbar is deprecated"), a2, a3, a4, a5);
}

- (void)setShadowImage:(id)a3 forToolbarPosition:(int64_t)a4
{
  NSLog(CFSTR("MarkupViewController toolbar is deprecated"), a2, a3, a4);
}

- (void)_hostSeparatorInView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
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
  id v18;

  v4 = a3;
  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v6);

  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leadingAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "constraintEqualToAnchor:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActive:", 1);

  -[AKToolbarBackgroundView separatorLine](self, "separatorLine");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "trailingAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "trailingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

}

- (UIView)separatorLine
{
  return self->_separatorLine;
}

- (void)setSeparatorLine:(id)a3
{
  objc_storeStrong((id *)&self->_separatorLine, a3);
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (BOOL)isTranslucent
{
  return self->_translucent;
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_separatorLine, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
