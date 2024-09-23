@implementation SUUICrossFadingTabBarButton

- (SUUICrossFadingTabBarButton)initWithFrame:(CGRect)a3
{
  SUUICrossFadingTabBarButton *v3;
  UILabel *v4;
  UILabel *standardTitleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  UILabel *selectedTitleLabel;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  UIImageView *v16;
  UIImageView *standardImageView;
  UIImageView *v18;
  UIImageView *selectedImageView;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SUUICrossFadingTabBarButton;
  v3 = -[SUUICrossFadingTabBarButton initWithFrame:](&v22, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    standardTitleLabel = v3->_standardTitleLabel;
    v3->_standardTitleLabel = v4;

    v6 = v3->_standardTitleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6, "setFont:", v7);

    -[UILabel setOpaque:](v3->_standardTitleLabel, "setOpaque:", 0);
    v8 = v3->_standardTitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.57254902, 1.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v8, "setTextColor:", v9);

    -[UILabel setBackgroundColor:](v3->_standardTitleLabel, "setBackgroundColor:", 0);
    -[SUUICrossFadingTabBarButton addSubview:](v3, "addSubview:", v3->_standardTitleLabel);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    selectedTitleLabel = v3->_selectedTitleLabel;
    v3->_selectedTitleLabel = v10;

    -[UILabel setAlpha:](v3->_selectedTitleLabel, "setAlpha:", 0.0);
    v12 = v3->_selectedTitleLabel;
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setOpaque:](v3->_selectedTitleLabel, "setOpaque:", 0);
    v14 = v3->_selectedTitleLabel;
    -[SUUICrossFadingTabBarButton tintColor](v3, "tintColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v14, "setTextColor:", v15);

    -[UILabel setBackgroundColor:](v3->_selectedTitleLabel, "setBackgroundColor:", 0);
    -[SUUICrossFadingTabBarButton addSubview:](v3, "addSubview:", v3->_selectedTitleLabel);
    -[UILabel setAdjustsLetterSpacingToFitWidth:](v3->_standardTitleLabel, "setAdjustsLetterSpacingToFitWidth:", 1);
    -[UILabel setAdjustsLetterSpacingToFitWidth:](v3->_selectedTitleLabel, "setAdjustsLetterSpacingToFitWidth:", 1);
    v16 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    standardImageView = v3->_standardImageView;
    v3->_standardImageView = v16;

    -[SUUICrossFadingTabBarButton addSubview:](v3, "addSubview:", v3->_standardImageView);
    v18 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    selectedImageView = v3->_selectedImageView;
    v3->_selectedImageView = v18;

    -[UIImageView setAlpha:](v3->_selectedImageView, "setAlpha:", 0.0);
    -[SUUICrossFadingTabBarButton addSubview:](v3, "addSubview:", v3->_selectedImageView);
    -[UILabel _setDrawsAsBackdropOverlayWithBlendMode:](v3->_standardTitleLabel, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
    -[UIImageView _setDrawsAsBackdropOverlayWithBlendMode:](v3->_standardImageView, "_setDrawsAsBackdropOverlayWithBlendMode:", 1);
    -[SUUICrossFadingTabBarButton layer](v3, "layer");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setAllowsGroupOpacity:", 0);

  }
  return v3;
}

- (void)layoutSubviews
{
  CGFloat x;
  double width;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat rect;
  CGFloat rect_8;
  CGFloat rect_16;
  CGFloat rect_24;
  objc_super v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;

  v41.receiver = self;
  v41.super_class = (Class)SUUICrossFadingTabBarButton;
  -[SUUICrossFadingTabBarButton layoutSubviews](&v41, sel_layoutSubviews);
  -[SUUICrossFadingTabBarButton bounds](self, "bounds");
  v43 = CGRectInset(v42, 0.0, 2.0);
  x = v43.origin.x;
  rect_24 = v43.origin.y;
  width = v43.size.width;
  height = v43.size.height;
  -[UILabel sizeThatFits:](self->_standardTitleLabel, "sizeThatFits:", v43.size.width, v43.size.height);
  v7 = v6;
  v9 = v8;
  -[UILabel sizeThatFits:](self->_selectedTitleLabel, "sizeThatFits:", width, height);
  v12 = *MEMORY[0x24BDBF090];
  v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
  if (v7 < v10)
    v7 = v10;
  if (v9 >= v11)
    v14 = v9;
  else
    v14 = v11;
  v36 = v14;
  rect = *MEMORY[0x24BDBF090];
  v44.origin.x = x;
  rect_8 = width;
  rect_16 = x;
  v44.origin.y = rect_24;
  v44.size.width = width;
  v44.size.height = height;
  v15 = CGRectGetWidth(v44);
  v45.origin.x = v12;
  v45.origin.y = v13;
  v45.size.width = v7;
  v45.size.height = v36;
  v16 = (v15 - CGRectGetWidth(v45)) * 0.5;
  v46.origin.x = x;
  v46.origin.y = rect_24;
  v46.size.width = width;
  v46.size.height = height;
  CGRectGetMaxY(v46);
  v47.origin.x = v16;
  v47.origin.y = v13;
  v17 = v13;
  v47.size.width = v7;
  v47.size.height = v36;
  CGRectGetHeight(v47);
  UICeilToViewScale();
  v19 = v18;
  UICeilToViewScale();
  v21 = v20;
  UIFloorToViewScale();
  v23 = v22;
  UIFloorToViewScale();
  v25 = v24;
  -[UILabel setFrame:](self->_standardTitleLabel, "setFrame:", v23, v24, v19, v21);
  -[UILabel setFrame:](self->_selectedTitleLabel, "setFrame:", v23, v25, v19, v21);
  -[UIImage size](self->_image, "size");
  v27 = v26;
  v29 = v28;
  -[UIImage size](self->_selectedImage, "size");
  if (v27 < v30)
    v27 = v30;
  if (v29 < v31)
    v29 = v31;
  v48.origin.x = v23;
  v48.origin.y = v25;
  v48.size.width = v19;
  v48.size.height = v21;
  CGRectGetMidX(v48);
  v49.origin.x = rect;
  v49.origin.y = v17;
  v49.size.width = v27;
  v49.size.height = v29;
  CGRectGetWidth(v49);
  UIFloorToViewScale();
  v33 = v32;
  v50.origin.x = rect_16;
  v50.origin.y = rect_24;
  v50.size.width = rect_8;
  v50.size.height = height;
  CGRectGetHeight(v50);
  v51.origin.x = v33;
  v51.origin.y = v17;
  v51.size.width = v27;
  v51.size.height = v29;
  CGRectGetHeight(v51);
  UIFloorToViewScale();
  v35 = v34 + -4.0;
  -[UIImageView setFrame:](self->_standardImageView, "setFrame:", v33, v34 + -4.0, v27, v29);
  -[UIImageView setFrame:](self->_selectedImageView, "setFrame:", v33, v35, v27, v29);
}

- (void)tintColorDidChange
{
  void *v3;
  UIImageView *selectedImageView;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUUICrossFadingTabBarButton;
  -[SUUICrossFadingTabBarButton tintColorDidChange](&v6, sel_tintColorDidChange);
  -[SUUICrossFadingTabBarButton tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_selectedTitleLabel, "setTextColor:", v3);
  selectedImageView = self->_selectedImageView;
  -[UIImage _flatImageWithColor:](self->_selectedImage, "_flatImageWithColor:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](selectedImageView, "setImage:", v5);

}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;

  if (self->_title != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    title = self->_title;
    self->_title = v5;

    -[UILabel setText:](self->_selectedTitleLabel, "setText:", v4);
    -[UILabel setText:](self->_standardTitleLabel, "setText:", v4);

    -[SUUICrossFadingTabBarButton setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setImage:(id)a3
{
  UIImageView *standardImageView;
  void *v6;
  void *v7;
  UIImage *v8;

  v8 = (UIImage *)a3;
  if (self->_image != v8)
  {
    objc_storeStrong((id *)&self->_image, a3);
    standardImageView = self->_standardImageView;
    -[UILabel textColor](self->_standardTitleLabel, "textColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _flatImageWithColor:](v8, "_flatImageWithColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](standardImageView, "setImage:", v7);

    -[SUUICrossFadingTabBarButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSelectedImage:(id)a3
{
  UIImageView *selectedImageView;
  void *v6;
  void *v7;
  UIImage *v8;

  v8 = (UIImage *)a3;
  if (self->_selectedImage != v8)
  {
    objc_storeStrong((id *)&self->_selectedImage, a3);
    selectedImageView = self->_selectedImageView;
    -[SUUICrossFadingTabBarButton tintColor](self, "tintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImage _flatImageWithColor:](v8, "_flatImageWithColor:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](selectedImageView, "setImage:", v7);

    -[SUUICrossFadingTabBarButton setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setSelectionProgress:(double)a3
{
  double v4;

  if (self->_selectionProgress != a3)
  {
    self->_selectionProgress = a3;
    if (a3 < 0.0)
      a3 = 0.0;
    v4 = fmin(a3, 1.0);
    -[UILabel setAlpha:](self->_selectedTitleLabel, "setAlpha:", v4);
    -[UILabel setAlpha:](self->_standardTitleLabel, "setAlpha:", 1.0 - v4);
    -[UIImageView setAlpha:](self->_selectedImageView, "setAlpha:", v4);
    -[UIImageView setAlpha:](self->_standardImageView, "setAlpha:", 1.0 - v4);
  }
}

- (void)_setBadgeValue:(id)a3
{
  id v4;
  _Badge *v5;
  double v6;
  double v7;
  double v8;
  _Badge *badge;
  _Badge *v10;
  _Badge *v11;
  id v12;

  v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (objc_msgSend(0, "length"))
      goto LABEL_10;
    v4 = 0;
LABEL_9:

    goto LABEL_10;
  }
  v4 = v12;
  if (!objc_msgSend(v4, "length"))
    goto LABEL_9;
  if (!v4)
  {
LABEL_10:
    -[_Badge removeFromSuperview](self->_badge, "removeFromSuperview");
    badge = self->_badge;
    self->_badge = 0;

    v4 = 0;
    goto LABEL_11;
  }
  v5 = self->_badge;
  if (v5)
  {
    -[_Badge frame](v5, "frame");
    v7 = v6;
    -[_Badge setText:](self->_badge, "setText:", v4);
    -[_Badge frame](self->_badge, "frame");
    if (v7 == v8)
      goto LABEL_11;
  }
  else
  {
    v10 = -[_Badge initWithText:]([_Badge alloc], "initWithText:", v4);
    v11 = self->_badge;
    self->_badge = v10;

    -[SUUICrossFadingTabBarButton addSubview:](self, "addSubview:", self->_badge);
  }
  -[SUUICrossFadingTabBarButton _positionBadge](self, "_positionBadge");
LABEL_11:

}

- (void)_positionBadge
{
  void *v3;
  _Badge *badge;
  BOOL v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[SUUICrossFadingTabBarButton superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  badge = self->_badge;
  if (badge)
    v5 = v3 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    v19 = v3;
    -[_Badge frame](badge, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    -[SUUICrossFadingTabBarButton superview](self, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUUICrossFadingTabBarButton convertPoint:fromView:](self, "convertPoint:fromView:", v12, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
    v14 = v13 + 3.0;

    -[UIImageView frame](self->_standardImageView, "frame");
    CGRectGetMaxX(v20);
    UIRoundToViewScale();
    v16 = v15 + -5.0;
    objc_msgSend(v19, "bounds");
    -[SUUICrossFadingTabBarButton convertPoint:fromView:](self, "convertPoint:fromView:", v19, CGRectGetMaxX(v21) + -0.5, 0.0);
    UIRoundToViewScale();
    v18 = v17;
    v22.origin.x = v7;
    v22.origin.y = v14;
    v22.size.width = v9;
    v22.size.height = v11;
    -[_Badge setFrame:](self->_badge, "setFrame:", fmax(fmin(v16, v18 - CGRectGetWidth(v22)), 0.0), v14, v9, v11);
    v3 = v19;
  }

}

- (NSString)title
{
  return self->_title;
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (double)selectionProgress
{
  return self->_selectionProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_badge, 0);
  objc_storeStrong((id *)&self->_standardImageView, 0);
  objc_storeStrong((id *)&self->_standardTitleLabel, 0);
  objc_storeStrong((id *)&self->_selectedImageView, 0);
  objc_storeStrong((id *)&self->_selectedTitleLabel, 0);
}

@end
