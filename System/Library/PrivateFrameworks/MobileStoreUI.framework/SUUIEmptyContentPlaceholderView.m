@implementation SUUIEmptyContentPlaceholderView

- (void)maskPlaceholdersInBackdropView:(id)a3
{
  UILabel *label;
  void *v5;
  UILabel *v6;
  void *v7;
  UIImageView *imageView;
  void *v9;
  id v10;

  if (a3)
  {
    v10 = a3;
    objc_msgSend(v10, "removeMaskViews");
    label = self->_label;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](label, "setBackgroundColor:", v5);

    -[UILabel setOpaque:](self->_label, "setOpaque:", 0);
    v6 = self->_label;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    -[UILabel _setBackdropMaskViewFlags:](self->_label, "_setBackdropMaskViewFlags:", 2);
    objc_msgSend(v10, "updateMaskViewsForView:", self->_label);
    -[UIImageView setAlpha:](self->_imageView, "setAlpha:", 0.2);
    imageView = self->_imageView;
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v9);

    -[UIImageView setOpaque:](self->_imageView, "setOpaque:", 0);
    -[UIImageView _setBackdropMaskViewFlags:](self->_imageView, "_setBackdropMaskViewFlags:", 2);
    objc_msgSend(v10, "updateMaskViewsForView:", self->_imageView);

  }
}

- (UIImage)placeholderImage
{
  return -[UIImageView image](self->_imageView, "image");
}

- (NSString)placeholderMessage
{
  return -[UILabel text](self->_label, "text");
}

- (UILabel)placeholderMessageLabel
{
  UILabel *label;
  UILabel *v4;
  UILabel *v5;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;

  label = self->_label;
  if (!label)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    v5 = self->_label;
    self->_label = v4;

    v6 = self->_label;
    -[SUUIEmptyContentPlaceholderView backgroundColor](self, "backgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v6, "setBackgroundColor:", v7);

    v8 = self->_label;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 14.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v8, "setFont:", v9);

    -[UILabel setHidden:](self->_label, "setHidden:", 1);
    -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](self->_label, "setTextAlignment:", 1);
    v10 = self->_label;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.0, 0.6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v10, "setTextColor:", v11);

    -[SUUIEmptyContentPlaceholderView addSubview:](self, "addSubview:", self->_label);
    label = self->_label;
  }
  return label;
}

- (void)setPlaceholderImage:(id)a3
{
  id v4;
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  UIImageView *v8;
  id v9;

  v4 = a3;
  imageView = self->_imageView;
  v9 = v4;
  if (v4)
  {
    if (!imageView)
    {
      v6 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      v7 = self->_imageView;
      self->_imageView = v6;

      -[SUUIEmptyContentPlaceholderView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
    -[UIImageView setImage:](imageView, "setImage:", v9);
    -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    -[SUUIEmptyContentPlaceholderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
    v8 = self->_imageView;
    self->_imageView = 0;

  }
}

- (void)setPlaceholderImageInsets:(UIEdgeInsets)a3
{
  self->_imageInsets = a3;
  -[SUUIEmptyContentPlaceholderView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPlaceholderMessage:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    -[SUUIEmptyContentPlaceholderView placeholderMessageLabel](self, "placeholderMessageLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 0);
    objc_msgSend(v4, "setText:", v5);
    -[SUUIEmptyContentPlaceholderView setNeedsLayout](self, "setNeedsLayout");

  }
  else
  {
    -[UILabel setHidden:](self->_label, "setHidden:", 1);
    -[UILabel setText:](self->_label, "setText:", 0);
  }

}

- (void)setShowsSignInButton:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[SUUIEmptyContentPlaceholderView signInButton](self, "signInButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", !v3);

}

- (UIButton)signInButton
{
  UIButton *signInButton;
  UIButton *v4;
  UIButton *v5;
  void *v6;
  void *v7;

  signInButton = self->_signInButton;
  if (!signInButton)
  {
    objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
    v4 = (UIButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_signInButton;
    self->_signInButton = v4;

    -[UIButton setHidden:](self->_signInButton, "setHidden:", 1);
    -[UIButton titleLabel](self->_signInButton, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 18.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    -[SUUIEmptyContentPlaceholderView addSubview:](self, "addSubview:", self->_signInButton);
    signInButton = self->_signInButton;
  }
  return signInButton;
}

- (BOOL)showsSignInButton
{
  UIButton *signInButton;

  signInButton = self->_signInButton;
  if (signInButton)
    LOBYTE(signInButton) = -[UIButton isHidden](signInButton, "isHidden") ^ 1;
  return (char)signInButton;
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
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double top;
  double v19;
  double v20;
  float v21;
  CGFloat v22;
  double v23;
  double v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;

  -[SUUIEmptyContentPlaceholderView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = v3 + -30.0;
  -[UIImageView frame](self->_imageView, "frame");
  v9 = v8;
  v11 = v10;
  -[UILabel frame](self->_label, "frame");
  v12 = v7;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", v7, 1.79769313e308);
  v14 = v13;
  if ((-[UIButton isHidden](self->_signInButton, "isHidden") & 1) != 0)
  {
    v15 = *(double *)(MEMORY[0x24BDBF090] + 24);
    v29 = *MEMORY[0x24BDBF090];
    v30 = *(double *)(MEMORY[0x24BDBF090] + 16);
  }
  else
  {
    -[UIButton sizeToFit](self->_signInButton, "sizeToFit");
    -[UIButton frame](self->_signInButton, "frame");
    v17 = (v4 - v16) * 0.5;
    v29 = floorf(v17);
    v30 = v16;
  }
  top = self->_imageInsets.top;
  v19 = v15 + 20.0;
  v28 = v15;
  if (v15 <= 0.00000011920929)
    v19 = -0.0;
  v20 = v19 + v14 + v11 + self->_imageInsets.bottom + top;
  v21 = (v4 - v9) * 0.5;
  v22 = floorf(v21);
  *(float *)&v20 = (v6 - v20) * 0.5;
  v23 = v11;
  v24 = v9;
  v25 = top + floorf(*(float *)&v20);
  v31.origin.x = v22;
  v31.origin.y = v25;
  v31.size.width = v24;
  v31.size.height = v23;
  v26 = CGRectGetMaxY(v31) + self->_imageInsets.bottom;
  v32.origin.x = 15.0;
  v32.origin.y = v26;
  v32.size.width = v7;
  v32.size.height = v14;
  v27 = CGRectGetMaxY(v32) + 20.0;
  -[UIImageView setFrame:](self->_imageView, "setFrame:", v22, v25, v24, v23);
  -[UILabel setFrame:](self->_label, "setFrame:", 15.0, v26, v12, v14);
  -[UIButton setFrame:](self->_signInButton, "setFrame:", v29, v27, v30, v28);
}

- (void)setBackgroundColor:(id)a3
{
  UIImageView *imageView;
  id v5;
  objc_super v6;

  imageView = self->_imageView;
  v5 = a3;
  -[UIImageView setBackgroundColor:](imageView, "setBackgroundColor:", v5);
  -[UILabel setBackgroundColor:](self->_label, "setBackgroundColor:", v5);
  v6.receiver = self;
  v6.super_class = (Class)SUUIEmptyContentPlaceholderView;
  -[SUUIEmptyContentPlaceholderView setBackgroundColor:](&v6, sel_setBackgroundColor_, v5);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGSize result;

  width = a3.width;
  -[UIImageView frame](self->_imageView, "frame", a3.width, a3.height);
  v6 = v5;
  v8 = v7;
  -[UILabel sizeThatFits:](self->_label, "sizeThatFits:", width + -30.0, 1.79769313e308);
  v10 = v9;
  v12 = v11;
  if ((-[UIButton isHidden](self->_signInButton, "isHidden") & 1) != 0)
  {
    v13 = *(double *)(MEMORY[0x24BDBF148] + 8);
  }
  else
  {
    -[UIButton sizeToFit](self->_signInButton, "sizeToFit");
    -[UIButton frame](self->_signInButton, "frame");
  }
  v14 = v13 + 20.0;
  if (v13 <= 0.00000011920929)
    v14 = -0.0;
  v15 = v14 + v12 + v8 + self->_imageInsets.bottom + self->_imageInsets.top;
  if (v6 >= v10)
    v16 = v6;
  else
    v16 = v10;
  v17 = v16 + 30.0;
  result.height = v15;
  result.width = v17;
  return result;
}

- (UIEdgeInsets)placeholderImageInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_imageInsets.top;
  left = self->_imageInsets.left;
  bottom = self->_imageInsets.bottom;
  right = self->_imageInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInButton, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
