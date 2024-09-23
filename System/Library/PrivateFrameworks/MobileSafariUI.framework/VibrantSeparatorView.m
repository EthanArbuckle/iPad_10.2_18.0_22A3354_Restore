@implementation VibrantSeparatorView

- (void)setNonVibrantColor:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_nonVibrantColor, a3);
  if (!self->_usesVibrantEffect)
    -[VibrantSeparatorView setBackgroundColor:](self, "setBackgroundColor:", v5);

}

- (void)setUsesVibrantEffect:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;
  void *v7;
  UIView *v8;
  UIView *colorBurn;
  UIView *v10;
  void *v11;
  void *v12;
  void *v13;
  UIView *v14;
  UIView *plusD;
  UIView *v16;
  void *v17;
  void *v18;
  void *v19;
  UIView *v20;
  UIView *v21;

  if (((!self->_usesVibrantEffect ^ a3) & 1) == 0)
  {
    v5 = !a3;
    self->_usesVibrantEffect = a3;
    -[VibrantSeparatorView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAllowsGroupOpacity:", v5);

    -[VibrantSeparatorView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAllowsGroupBlending:", v5);

    if (a3)
    {
      -[VibrantSeparatorView setBackgroundColor:](self, "setBackgroundColor:", 0);
      v8 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      colorBurn = self->_colorBurn;
      self->_colorBurn = v8;

      -[UIView setAutoresizingMask:](self->_colorBurn, "setAutoresizingMask:", 18);
      v10 = self->_colorBurn;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.4, 1.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v11);

      -[UIView layer](self->_colorBurn, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2BC0]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCompositingFilter:", v13);

      -[VibrantSeparatorView addSubview:](self, "addSubview:", self->_colorBurn);
      v14 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      plusD = self->_plusD;
      self->_plusD = v14;

      -[UIView setAutoresizingMask:](self->_plusD, "setAutoresizingMask:", 18);
      v16 = self->_plusD;
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.31, 0.25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v16, "setBackgroundColor:", v17);

      -[UIView layer](self->_plusD, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2E98]);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCompositingFilter:", v19);

      -[VibrantSeparatorView addSubview:](self, "addSubview:", self->_plusD);
    }
    else
    {
      -[VibrantSeparatorView setBackgroundColor:](self, "setBackgroundColor:", self->_nonVibrantColor);
      -[UIView removeFromSuperview](self->_colorBurn, "removeFromSuperview");
      v20 = self->_colorBurn;
      self->_colorBurn = 0;

      -[UIView removeFromSuperview](self->_plusD, "removeFromSuperview");
      v21 = self->_plusD;
      self->_plusD = 0;

    }
  }
}

- (BOOL)usesVibrantEffect
{
  return self->_usesVibrantEffect;
}

- (UIColor)nonVibrantColor
{
  return self->_nonVibrantColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVibrantColor, 0);
  objc_storeStrong((id *)&self->_plusD, 0);
  objc_storeStrong((id *)&self->_colorBurn, 0);
}

@end
