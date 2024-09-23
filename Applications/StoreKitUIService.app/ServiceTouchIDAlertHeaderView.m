@implementation ServiceTouchIDAlertHeaderView

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (NSString)message
{
  return -[UILabel text](self->_messageLabel, "text");
}

- (void)setImage:(id)a3
{
  id v4;
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  id v8;

  v4 = a3;
  imageView = self->_imageView;
  v8 = v4;
  if (v4)
  {
    if (!imageView)
    {
      v6 = (UIImageView *)objc_alloc_init((Class)UIImageView);
      v7 = self->_imageView;
      self->_imageView = v6;

      -[ServiceTouchIDAlertHeaderView addSubview:](self, "addSubview:", self->_imageView);
      imageView = self->_imageView;
    }
    -[UIImageView setHidden:](imageView, "setHidden:", 0);
    -[UIImageView setImage:](self->_imageView, "setImage:", v8);
    -[UIImageView sizeToFit](self->_imageView, "sizeToFit");
    -[ServiceTouchIDAlertHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UIImageView setHidden:](imageView, "setHidden:", 1);
  }

}

- (void)setMessage:(id)a3
{
  id v4;
  UILabel *messageLabel;
  void *v6;
  UILabel *v7;
  UILabel *v8;
  UILabel *v9;
  void *v10;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  id v15;

  v4 = a3;
  messageLabel = self->_messageLabel;
  v15 = v4;
  if (v4)
  {
    if (!messageLabel)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleFootnote));
      v7 = (UILabel *)objc_alloc_init((Class)UILabel);
      v8 = self->_messageLabel;
      self->_messageLabel = v7;

      v9 = self->_messageLabel;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v9, "setBackgroundColor:", v10);

      v11 = self->_messageLabel;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v6, 0.0));
      -[UILabel setFont:](v11, "setFont:", v12);

      -[UILabel setNumberOfLines:](self->_messageLabel, "setNumberOfLines:", 0);
      -[UILabel setTextAlignment:](self->_messageLabel, "setTextAlignment:", 1);
      v13 = self->_messageLabel;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      -[UILabel setTextColor:](v13, "setTextColor:", v14);

      -[ServiceTouchIDAlertHeaderView addSubview:](self, "addSubview:", self->_messageLabel);
      messageLabel = self->_messageLabel;
    }
    -[UILabel setHidden:](messageLabel, "setHidden:", 0);
    -[UILabel setText:](self->_messageLabel, "setText:", v15);
    -[ServiceTouchIDAlertHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel setHidden:](messageLabel, "setHidden:", 1);
  }

}

- (void)setTitle:(id)a3
{
  id v4;
  UILabel *titleLabel;
  void *v6;
  void *v7;
  UILabel *v8;
  UILabel *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;

  v4 = a3;
  titleLabel = self->_titleLabel;
  v16 = v4;
  if (v4)
  {
    if (!titleLabel)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor preferredFontDescriptorWithTextStyle:](UIFontDescriptor, "preferredFontDescriptorWithTextStyle:", UIFontTextStyleBody));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", 2));

      v8 = (UILabel *)objc_alloc_init((Class)UILabel);
      v9 = self->_titleLabel;
      self->_titleLabel = v8;

      v10 = self->_titleLabel;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[UILabel setBackgroundColor:](v10, "setBackgroundColor:", v11);

      v12 = self->_titleLabel;
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v7, 0.0));
      -[UILabel setFont:](v12, "setFont:", v13);

      -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 2);
      -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
      v14 = self->_titleLabel;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      -[UILabel setTextColor:](v14, "setTextColor:", v15);

      -[ServiceTouchIDAlertHeaderView addSubview:](self, "addSubview:", self->_titleLabel);
      titleLabel = self->_titleLabel;
    }
    -[UILabel setHidden:](titleLabel, "setHidden:", 0);
    -[UILabel setText:](self->_titleLabel, "setText:", v16);
    -[ServiceTouchIDAlertHeaderView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", 1);
  }

}

- (void)shakeTitleView
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = (id)objc_claimAutoreleasedReturnValue(-[UILabel layer](self->_titleLabel, "layer"));
  objc_msgSend(v20, "removeAllAnimations");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x")));
  objc_msgSend(v2, "setMass:", 1.20000005);
  objc_msgSend(v2, "setStiffness:", 1200.0);
  objc_msgSend(v2, "setDamping:", 12.0);
  LODWORD(v3) = 1028389654;
  LODWORD(v4) = 990057071;
  LODWORD(v5) = 1059712716;
  LODWORD(v6) = 1.0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v3, v4, v5, v6));
  objc_msgSend(v2, "setTimingFunction:", v7);

  objc_msgSend(v2, "setDuration:", 0.860000014);
  objc_msgSend(v2, "setVelocity:", 0.0);
  objc_msgSend(v2, "setFillMode:", kCAFillModeBackwards);
  objc_msgSend(v20, "position");
  v9 = v8 + 60.0;
  *(float *)&v9 = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v9));
  objc_msgSend(v2, "setFromValue:", v10);

  objc_msgSend(v20, "addAnimation:forKey:", v2, CFSTR("position"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position.x")));
  LODWORD(v12) = 1036831949;
  LODWORD(v13) = 0.25;
  LODWORD(v14) = 0.25;
  LODWORD(v15) = 1.0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithControlPoints::::](CAMediaTimingFunction, "functionWithControlPoints::::", v13, v12, v14, v15));
  objc_msgSend(v11, "setTimingFunction:", v16);

  objc_msgSend(v11, "setDuration:", 0.0700000003);
  objc_msgSend(v11, "setFillMode:", kCAFillModeBackwards);
  objc_msgSend(v20, "position");
  v18 = v17 + -60.0;
  *(float *)&v18 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
  objc_msgSend(v11, "setFromValue:", v19);

  objc_msgSend(v20, "addAnimation:forKey:", v11, CFSTR("force"));
}

- (NSString)title
{
  return -[UILabel text](self->_titleLabel, "text");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  UIImageView *imageView;
  double v6;
  double MaxY;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  float v12;
  CGFloat v13;
  UILabel *titleLabel;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  UILabel *messageLabel;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;

  -[ServiceTouchIDAlertHeaderView bounds](self, "bounds");
  v4 = v3;
  imageView = self->_imageView;
  v6 = 0.0;
  MaxY = 18.0;
  if (imageView && (-[UIImageView isHidden](imageView, "isHidden") & 1) == 0)
  {
    -[UIImageView frame](self->_imageView, "frame");
    v9 = v8;
    v11 = v10;
    v12 = (v4 - v8) * 0.5;
    v13 = floorf(v12);
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v13, 18.0);
    v25.origin.y = 18.0;
    v25.origin.x = v13;
    v25.size.width = v9;
    v25.size.height = v11;
    MaxY = CGRectGetMaxY(v25);
    v6 = 9.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel && (-[UILabel isHidden](titleLabel, "isHidden") & 1) == 0)
  {
    -[UILabel frame](self->_titleLabel, "frame");
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v4 + -30.0, 1.79769313e308);
    v16 = v15;
    v18 = v17;
    *(float *)&v15 = (v4 - v15) * 0.5;
    v19 = floorf(*(float *)&v15);
    v20 = MaxY + v6;
    -[UILabel setFrame:](self->_titleLabel, "setFrame:", v19, v20, v16, v17);
    v26.origin.x = v19;
    v26.origin.y = v20;
    v26.size.width = v16;
    v26.size.height = v18;
    MaxY = CGRectGetMaxY(v26);
    v6 = 4.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel)
  {
    if ((-[UILabel isHidden](messageLabel, "isHidden") & 1) == 0)
    {
      -[UILabel frame](self->_messageLabel, "frame");
      -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", v4 + -30.0, 1.79769313e308);
      v23 = v22;
      *(float *)&v22 = (v4 - v22) * 0.5;
      -[UILabel setFrame:](self->_messageLabel, "setFrame:", floorf(*(float *)&v22), MaxY + v6, v23, v24);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  UIImageView *imageView;
  double v6;
  double v7;
  double v8;
  UILabel *titleLabel;
  UILabel *messageLabel;
  double v11;
  double v12;
  double v13;
  CGSize result;

  width = a3.width;
  imageView = self->_imageView;
  v6 = 0.0;
  if (imageView && (-[UIImageView isHidden](imageView, "isHidden", a3.width, a3.height) & 1) == 0)
  {
    -[UIImageView frame](self->_imageView, "frame");
    a3.width = 36.0;
    v7 = v8 + 36.0;
    v6 = 9.0;
  }
  else
  {
    v7 = 36.0;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel && (-[UILabel isHidden](titleLabel, "isHidden", a3.width, a3.height) & 1) == 0)
  {
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
    a3.width = v6 + a3.height;
    v7 = v7 + v6 + a3.height;
    v6 = 4.0;
  }
  messageLabel = self->_messageLabel;
  if (messageLabel && (-[UILabel isHidden](messageLabel, "isHidden", a3.width, a3.height) & 1) == 0)
  {
    -[UILabel sizeThatFits:](self->_messageLabel, "sizeThatFits:", width + -30.0, 1.79769313e308);
    v7 = v7 + v6 + v11;
  }
  v12 = width;
  v13 = v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
