@implementation ICSEffectPickerViewCell

- (ICSEffectPickerViewCell)initWithFrame:(CGRect)a3
{
  ICSEffectPickerViewCell *v3;
  ICSEffectPickerViewCell *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)ICSEffectPickerViewCell;
  v3 = -[ICSEffectPickerViewCell initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell layer](v3, "layer"));
    objc_msgSend(v5, "setMasksToBounds:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell layer](v4, "layer"));
    objc_msgSend(v6, "setCornerRadius:", 10.0);

  }
  return v4;
}

- (void)setVideoEffect:(id)a3
{
  TUVideoEffect **p_videoEffect;
  id v6;
  void *v7;
  id v8;

  p_videoEffect = &self->_videoEffect;
  objc_storeStrong((id *)&self->_videoEffect, a3);
  v6 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TUVideoEffect thumbnailImage](*p_videoEffect, "thumbnailImage"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell imageView](self, "imageView"));
  objc_msgSend(v7, "setImage:", v8);

}

- (UIImageView)imageView
{
  UIImageView *imageView;
  UIImageView *v4;
  UIImageView *v5;
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
  void *v18;
  void *v19;
  _QWORD v21[4];

  imageView = self->_imageView;
  if (!imageView)
  {
    v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    v5 = self->_imageView;
    self->_imageView = v4;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](self->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    objc_msgSend(v6, "setMasksToBounds:", 1);

    -[ICSEffectPickerViewCell addSubview:](self, "addSubview:", self->_imageView);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](self->_imageView, "heightAnchor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell heightAnchor](self, "heightAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -20.0));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](self->_imageView, "widthAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell widthAnchor](self, "widthAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v11, -20.0));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](self->_imageView, "centerXAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell centerXAnchor](self, "centerXAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](self->_imageView, "centerYAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell centerYAnchor](self, "centerYAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));

    v21[0] = v9;
    v21[1] = v12;
    v21[2] = v15;
    v21[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    imageView = self->_imageView;
  }
  return imageView;
}

- (void)setSelected:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ICSEffectPickerViewCell;
  -[ICSEffectPickerViewCell setSelected:](&v12, "setSelected:");
  if (v3)
  {
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.3)));
    v6 = objc_msgSend(v5, "CGColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell layer](self, "layer"));
    objc_msgSend(v7, "setBorderColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell layer](self, "layer"));
    objc_msgSend(v8, "setBorderWidth:", 2.0);

    v9 = objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5, 0.5));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEffectPickerViewCell layer](self, "layer"));
    objc_msgSend(v10, "setBorderWidth:", 0.0);

    v9 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  }
  v11 = (void *)v9;
  -[ICSEffectPickerViewCell setBackgroundColor:](self, "setBackgroundColor:", v9);

}

+ (NSString)reuseIdentifier
{
  return (NSString *)CFSTR("ICSEffectPickerViewCellReuseIdentifier");
}

- (TUVideoEffect)videoEffect
{
  return self->_videoEffect;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_videoEffect, 0);
}

@end
