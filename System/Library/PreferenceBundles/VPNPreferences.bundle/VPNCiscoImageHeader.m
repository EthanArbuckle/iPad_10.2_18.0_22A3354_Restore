@implementation VPNCiscoImageHeader

- (VPNCiscoImageHeader)initWithSpecifier:(id)a3
{
  id v4;
  VPNCiscoImageHeader *v5;
  VPNCiscoImageHeader *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VPNCiscoImageHeader;
  v5 = -[VPNCiscoImageHeader initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v5 == self)
  {
    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:", CFSTR("Cisco.png"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
    -[VPNCiscoImageHeader setImageView:](self, "setImageView:", v10);

    -[VPNCiscoImageHeader imageView](self, "imageView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNCiscoImageHeader addSubview:](self, "addSubview:", v11);

    objc_msgSend(v4, "propertyForKey:", CFSTR("VisibleOnInit"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      v14 = objc_msgSend(v12, "BOOLValue") ^ 1;
    else
      v14 = 1;
    -[VPNCiscoImageHeader imageView](self, "imageView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", v14);

    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (double)preferredHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;

  -[VPNCiscoImageHeader imageView](self, "imageView", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    -[VPNCiscoImageHeader imageView](self, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "image");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v5 = v8 + 0.0;

  }
  return v5;
}

- (void)setImageHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[VPNCiscoImageHeader imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VPNCiscoImageHeader;
  -[VPNCiscoImageHeader layoutSubviews](&v18, sel_layoutSubviews);
  -[VPNCiscoImageHeader imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[VPNCiscoImageHeader imageView](self, "imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  v10 = floor(v9 * 0.5) - floor(v5 * 0.5);
  -[VPNCiscoImageHeader imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "image");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "size");
  v14 = v13;
  v16 = v15;

  -[VPNCiscoImageHeader imageView](self, "imageView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFrame:", v10, -10.0, v14, v16);

}

- (UIImageView)imageView
{
  return (UIImageView *)objc_getProperty(self, a2, 416, 1);
}

- (void)setImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
