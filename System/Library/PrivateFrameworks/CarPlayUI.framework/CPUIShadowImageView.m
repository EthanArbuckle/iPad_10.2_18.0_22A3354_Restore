@implementation CPUIShadowImageView

- (CPUIShadowImageView)initWithFrame:(CGRect)a3
{
  CPUIShadowImageView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  UIImageView *placeholderView;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  objc_super v49;
  _QWORD v50[10];

  v50[8] = *MEMORY[0x24BDAC8D0];
  v49.receiver = self;
  v49.super_class = (Class)CPUIShadowImageView;
  v3 = -[CPUIShadowImageView initWithFrame:](&v49, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[CPUIShadowImageView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShadowPathIsBounds:", 1);

    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_imageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView layer](v3->_imageView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 6.0);

    -[UIImageView layer](v3->_imageView, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 1);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v3->_imageView, "setBackgroundColor:", v10);

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", 0);
    placeholderView = v3->_placeholderView;
    v3->_placeholderView = (UIImageView *)v11;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_placeholderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView _setContinuousCornerRadius:](v3->_placeholderView, "_setContinuousCornerRadius:", 6.0);
    -[UIImageView setClipsToBounds:](v3->_placeholderView, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setBackgroundColor:](v3->_placeholderView, "setBackgroundColor:", v13);

    -[CPUIShadowImageView addSubview:](v3, "addSubview:", v3->_placeholderView);
    -[CPUIShadowImageView addSubview:](v3, "addSubview:", v3->_imageView);
    v35 = (void *)MEMORY[0x24BDD1628];
    -[CPUIShadowImageView placeholderView](v3, "placeholderView");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView topAnchor](v3, "topAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v50[0] = v45;
    -[CPUIShadowImageView placeholderView](v3, "placeholderView");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView bottomAnchor](v3, "bottomAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToAnchor:", v42);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v50[1] = v41;
    -[CPUIShadowImageView placeholderView](v3, "placeholderView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "leadingAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView leadingAnchor](v3, "leadingAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v38);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v50[2] = v37;
    -[CPUIShadowImageView placeholderView](v3, "placeholderView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView trailingAnchor](v3, "trailingAnchor");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v33);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v50[3] = v32;
    -[CPUIShadowImageView imageView](v3, "imageView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "topAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView topAnchor](v3, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "constraintEqualToAnchor:", v29);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50[4] = v28;
    -[CPUIShadowImageView imageView](v3, "imageView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView bottomAnchor](v3, "bottomAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v50[5] = v24;
    -[CPUIShadowImageView imageView](v3, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "leadingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView leadingAnchor](v3, "leadingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v50[6] = v17;
    -[CPUIShadowImageView imageView](v3, "imageView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CPUIShadowImageView trailingAnchor](v3, "trailingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "constraintEqualToAnchor:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v50[7] = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v50, 8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "activateConstraints:", v22);

    -[CPUIShadowImageView setupVisibleEffects:](v3, "setupVisibleEffects:", 1);
    -[CPUIShadowImageView setImage:](v3, "setImage:", 0);
  }
  return v3;
}

- (BOOL)_isDarkMode
{
  void *v2;
  BOOL v3;

  -[CPUIShadowImageView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

  return v3;
}

- (void)setImage:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t *v10;
  uint64_t v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  -[CPUIShadowImageView imageView](self, "imageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v15);

  if (v15)
  {
    -[CPUIShadowImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = 0;
  }
  else
  {
    v9 = -[CPUIShadowImageView _isDarkMode](self, "_isDarkMode");
    v10 = (uint64_t *)MEMORY[0x24BDE5BE8];
    if (!v9)
      v10 = (uint64_t *)MEMORY[0x24BDE5BA0];
    v11 = *v10;
    -[CPUIShadowImageView layer](self, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = v11;
  }
  objc_msgSend(v6, "setCompositingFilter:", v8);
  v12 = v15 != 0;

  -[CPUIShadowImageView layer](self, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAllowsGroupOpacity:", v12);

  -[CPUIShadowImageView layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsGroupBlending:", v12);

  -[CPUIShadowImageView setupVisibleEffects:](self, "setupVisibleEffects:", objc_msgSend(v15, "isSquared"));
  -[CPUIShadowImageView setNeedsDisplay](self, "setNeedsDisplay");

}

- (void)setPlaceholderImage:(id)a3
{
  id v5;
  void *v6;

  objc_storeStrong((id *)&self->_placeholderImage, a3);
  v5 = a3;
  -[CPUIShadowImageView placeholderView](self, "placeholderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setImage:", v5);

  -[CPUIShadowImageView setNeedsDisplay](self, "setNeedsDisplay");
}

- (int64_t)contentMode
{
  return -[UIImageView contentMode](self->_imageView, "contentMode");
}

- (void)setContentMode:(int64_t)a3
{
  if (-[UIImageView contentMode](self->_imageView, "contentMode") != a3)
    -[UIImageView setContentMode:](self->_imageView, "setContentMode:", a3);
}

- (void)setupVisibleEffects:(BOOL)a3
{
  double v4;
  id v5;
  double v6;
  id v7;

  -[CPUIShadowImageView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "setShadowColor:", objc_msgSend(v5, "CGColor"));

    LODWORD(v6) = 1036831949;
    objc_msgSend(v7, "setShadowOpacity:", v6);
    objc_msgSend(v7, "setShadowRadius:", 4.0);
    objc_msgSend(v7, "setShadowOffset:", 0.0, 2.0);
  }
  else
  {
    LODWORD(v4) = 0;
    objc_msgSend(v7, "setShadowOpacity:", v4);
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CPUIShadowImageView;
  -[CPUIShadowImageView traitCollectionDidChange:](&v6, sel_traitCollectionDidChange_, a3);
  -[CPUIShadowImageView imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CPUIShadowImageView setImage:](self, "setImage:", v5);

}

- (void)setNeedsDisplay
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CPUIShadowImageView;
  -[CPUIShadowImageView setNeedsDisplay](&v4, sel_setNeedsDisplay);
  -[UIImageView image](self->_imageView, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIImageView setHidden:](self->_placeholderView, "setHidden:", v3 != 0);
}

- (UIImage)image
{
  return self->_image;
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (UIImageView)placeholderView
{
  return self->_placeholderView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end
