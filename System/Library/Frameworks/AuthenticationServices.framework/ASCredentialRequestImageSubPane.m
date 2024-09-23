@implementation ASCredentialRequestImageSubPane

- (ASCredentialRequestImageSubPane)initWithImage:(id)a3 imageStyle:(int64_t)a4
{
  id v6;
  void *v7;
  ASCredentialRequestImageSubPane *v8;
  ASCredentialRequestImageSubPane *v9;
  ASCredentialRequestImageSubPane *v10;
  objc_super v12;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "_imageViewWithImage:imageStyle:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v12.receiver = self;
  v12.super_class = (Class)ASCredentialRequestImageSubPane;
  v8 = -[ASCredentialRequestSubPane initWithView:](&v12, sel_initWithView_, v7);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_imageView, v7);
    v9->_imageStyle = a4;
    v10 = v9;
  }

  return v9;
}

- (ASCredentialRequestImageSubPane)initWithImage:(id)a3
{
  return -[ASCredentialRequestImageSubPane initWithImage:imageStyle:](self, "initWithImage:imageStyle:", a3, 0);
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
}

- (void)addToStackView:(id)a3 withCustomSpacingAfter:(double)a4 context:(id)a5
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  objc_super v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v20.receiver = self;
  v20.super_class = (Class)ASCredentialRequestImageSubPane;
  -[ASCredentialRequestSubPane addToStackView:withCustomSpacingAfter:context:](&v20, sel_addToStackView_withCustomSpacingAfter_context_, a3, a5, a4);
  if (!self->_imageStyle)
  {
    -[UIImageView image](self->_imageView, "image");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "size");
    v8 = v7;
    v10 = v9;

    if (v10 == 0.0)
      v11 = 1.0;
    else
      v11 = v8 / v10;
    v12 = (void *)MEMORY[0x24BDD1628];
    -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[ASViewServiceInterfaceUtilities headerIconSize](ASViewServiceInterfaceUtilities, "headerIconSize");
    objc_msgSend(v13, "constraintEqualToConstant:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v15;
    -[UIImageView widthAnchor](self->_imageView, "widthAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView heightAnchor](self->_imageView, "heightAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:multiplier:", v17, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[1] = v18;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateConstraints:", v19);

  }
}

+ (id)_imageViewWithImage:(id)a3 imageStyle:(int64_t)a4
{
  void *v4;
  id v7;
  uint64_t v8;

  v7 = a3;
  switch(a4)
  {
    case 2:
      objc_msgSend(a1, "_systemIconViewWithImage:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      objc_msgSend(a1, "_customIconViewWithImage:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0:
      objc_msgSend(a1, "_appIconViewWithImage:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v4 = (void *)v8;
      break;
  }

  return v4;
}

+ (id)_appIconViewWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  CGColor *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x24BEBD668];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  +[ASViewServiceInterfaceUtilities headerIconCornerRadius](ASViewServiceInterfaceUtilities, "headerIconCornerRadius");
  objc_msgSend(v5, "_setContinuousCornerRadius:");
  objc_msgSend(v5, "setClipsToBounds:", 1);
  v6 = +[ASViewServiceInterfaceUtilities iconBorderColor](ASViewServiceInterfaceUtilities, "iconBorderColor");
  objc_msgSend(v5, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBorderColor:", v6);

  +[ASViewServiceInterfaceUtilities iconBorderWidth](ASViewServiceInterfaceUtilities, "iconBorderWidth");
  v9 = v8;
  objc_msgSend(v5, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBorderWidth:", v9);

  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  return v5;
}

+ (id)_customIconViewWithImage:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x24BEBD668];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithImage:", v4);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 60.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPreferredSymbolConfiguration:", v6);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  return v5;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (int64_t)imageStyle
{
  return self->_imageStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
