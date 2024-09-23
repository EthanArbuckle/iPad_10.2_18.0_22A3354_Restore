@implementation SUUIRoundedRectButton

- (SUUIRoundedRectButton)initWithFrame:(CGRect)a3
{
  SUUIRoundedRectButton *v3;
  SUUIRoundedRectButton *v4;
  void *v5;
  void *v6;
  UIView *v7;
  UIView *borderView;
  UIView *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SUUIRoundedRectButton;
  v3 = -[SUUIRoundedRectButton initWithFrame:](&v16, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUIRoundedRectButton setTitleEdgeInsets:](v3, "setTitleEdgeInsets:", 0.0, 15.0, 0.0, 15.0);
    -[SUUIRoundedRectButton titleLabel](v4, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);

    -[SUUIRoundedRectButton titleLabel](v4, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMinimumScaleFactor:", 0.933333333);

    v7 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    borderView = v4->_borderView;
    v4->_borderView = v7;

    -[UIView setAutoresizingMask:](v4->_borderView, "setAutoresizingMask:", 18);
    v9 = v4->_borderView;
    -[SUUIRoundedRectButton bounds](v4, "bounds");
    -[UIView setFrame:](v9, "setFrame:");
    -[UIView setUserInteractionEnabled:](v4->_borderView, "setUserInteractionEnabled:", 0);
    -[SUUIRoundedRectButton addSubview:](v4, "addSubview:", v4->_borderView);
    -[UIView layer](v4->_borderView, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUIRoundedRectButton tintColor](v4, "tintColor");
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(v11, "CGColor"));

    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    objc_msgSend(v10, "setBorderWidth:", 1.0 / v13);

    objc_msgSend(v10, "setCornerRadius:", 7.0);
    -[SUUIRoundedRectButton _reloadColors](v4, "_reloadColors");
    -[SUUIRoundedRectButton _reloadFonts](v4, "_reloadFonts");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v4, sel__reloadFonts, *MEMORY[0x24BEBE088], 0);

  }
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE088], 0);

  v4.receiver = self;
  v4.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton dealloc](&v4, sel_dealloc);
}

- (void)setSubtitleWithLabel:(id)a3
{
  UILabel *v5;
  UILabel **p_subtitleLabel;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v5 = (UILabel *)a3;
  p_subtitleLabel = &self->_subtitleLabel;
  if (self->_subtitleLabel != v5)
  {
    -[SUUIRoundedRectButton titleEdgeInsets](self, "titleEdgeInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    if (-[UILabel isDescendantOfView:](*p_subtitleLabel, "isDescendantOfView:", self))
    {
      -[UILabel removeFromSuperview](*p_subtitleLabel, "removeFromSuperview");
      v8 = v8 + 14.0;
    }
    objc_storeStrong((id *)&self->_subtitleLabel, a3);
    if (*p_subtitleLabel)
    {
      -[SUUIRoundedRectButton insertSubview:belowSubview:](self, "insertSubview:belowSubview:", *p_subtitleLabel, self->_borderView);
      -[SUUIRoundedRectButton _reloadColors](self, "_reloadColors");
      v8 = v8 + -14.0;
    }
    v15.receiver = self;
    v15.super_class = (Class)SUUIRoundedRectButton;
    -[SUUIRoundedRectButton setTitleEdgeInsets:](&v15, sel_setTitleEdgeInsets_, v8, v10, v12, v14);
  }

}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect v14;

  if (self->_subtitleLabel)
  {
    -[SUUIRoundedRectButton bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UILabel frame](self->_subtitleLabel, "frame");
    v12 = v11;
    v14.origin.x = v4;
    v14.origin.y = v6;
    v14.size.width = v8;
    v14.size.height = v10;
    -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", 0.0, CGRectGetMaxY(v14) - v12 + -5.0, v8, v12);
  }
  v13.receiver = self;
  v13.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton layoutSubviews](&v13, sel_layoutSubviews);
}

- (void)setEnabled:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton setEnabled:](&v6, sel_setEnabled_);
  v5 = 0.33;
  if (v3)
    v5 = 1.0;
  -[SUUIRoundedRectButton setAlpha:](self, "setAlpha:", v5);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  objc_super v11;

  v3 = a3;
  if (-[SUUIRoundedRectButton isHighlighted](self, "isHighlighted") != a3)
  {
    -[UIView layer](self->_borderView, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationForKey:", CFSTR("borderWidth"));
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C38]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCompositingFilter:", v6);

    -[SUUIRoundedRectButton _basicAnimationWithKeyPath:](self, "_basicAnimationWithKeyPath:", CFSTR("backgroundColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDuration:", 0.12);
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v8, "CGColor"));

      -[SUUIRoundedRectButton tintColor](self, "tintColor");
    }
    else
    {
      -[SUUIRoundedRectButton tintColor](self, "tintColor");
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      objc_msgSend(v7, "setFromValue:", objc_msgSend(v9, "CGColor"));

      objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    }
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setToValue:", objc_msgSend(v10, "CGColor"));

    objc_msgSend(v7, "setDelegate:", self);
    objc_msgSend(v5, "addAnimation:forKey:", v7, CFSTR("borderWidth"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton setHighlighted:](&v11, sel_setHighlighted_, v3);
}

- (void)setTitleEdgeInsets:(UIEdgeInsets)a3
{
  objc_super v3;

  if (self->_subtitleLabel)
    a3.top = a3.top + -14.0;
  v3.receiver = self;
  v3.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton setTitleEdgeInsets:](&v3, sel_setTitleEdgeInsets_, a3.top, a3.left, a3.bottom, a3.right);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  objc_super v5;
  CGSize result;

  v5.receiver = self;
  v5.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton sizeThatFits:](&v5, sel_sizeThatFits_, a3.width, 45.0);
  v4 = 45.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  -[SUUIRoundedRectButton _reloadColors](self, "_reloadColors");
  v3.receiver = self;
  v3.super_class = (Class)SUUIRoundedRectButton;
  -[SUUIRoundedRectButton tintColorDidChange](&v3, sel_tintColorDidChange);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  int v5;
  void *v6;
  id v7;

  v5 = -[SUUIRoundedRectButton isHighlighted](self, "isHighlighted", a3, a4);
  -[UIView layer](self->_borderView, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDE56B0], "filterWithType:", *MEMORY[0x24BDE5C38]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCompositingFilter:", v6);

  }
  else
  {
    objc_msgSend(v7, "setCompositingFilter:", 0);
  }

}

- (id)_basicAnimationWithKeyPath:(id)a3
{
  void *v3;
  float v4;
  double v5;

  objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFillMode:", *MEMORY[0x24BDE5978]);
  objc_msgSend(v3, "setRemovedOnCompletion:", 0);
  UIAnimationDragCoefficient();
  *(float *)&v5 = 1.0 / v4;
  objc_msgSend(v3, "setSpeed:", v5);
  return v3;
}

- (void)_reloadColors
{
  void *v3;
  void *v4;
  id v5;

  -[SUUIRoundedRectButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView layer](self->_borderView, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_retainAutorelease(v3);
  objc_msgSend(v4, "setBorderColor:", objc_msgSend(v5, "CGColor"));

  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v5);
  -[SUUIRoundedRectButton setTitleColor:forState:](self, "setTitleColor:forState:", v5, 0);

}

- (void)_reloadFonts
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x24BEBE220], 2, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIRoundedRectButton titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v5, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
}

@end
