@implementation HUAlbumIconContentView

- (HUAlbumIconContentView)initWithFrame:(CGRect)a3
{
  HUAlbumIconContentView *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUAlbumIconContentView;
  v3 = -[HUIconContentView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x24BDF6AE8]);
    -[HUAlbumIconContentView setImageView:](v3, "setImageView:", v4);

    -[HUAlbumIconContentView imageView](v3, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentMode:", 1);

    -[HUAlbumIconContentView imageView](v3, "imageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 4.0);

    -[HUAlbumIconContentView imageView](v3, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMasksToBounds:", 1);

    -[HUAlbumIconContentView imageView](v3, "imageView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUAlbumIconContentView addSubview:](v3, "addSubview:", v10);

  }
  return v3;
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
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HUAlbumIconContentView;
  -[HUAlbumIconContentView layoutSubviews](&v12, sel_layoutSubviews);
  -[HUAlbumIconContentView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[HUAlbumIconContentView imageView](self, "imageView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

}

- (void)updateWithIconDescriptor:(id)a3 displayStyle:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  unint64_t v16;
  objc_super v17;

  v5 = a5;
  v8 = a3;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v11)
  {
    objc_msgSend(v11, "imageData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUIconContentView iconDescriptor](self, "iconDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "imageData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqual:", v14);

  }
  else
  {
    v15 = 1;
  }
  v16 = -[HUIconContentView displayStyle](self, "displayStyle");
  v17.receiver = self;
  v17.super_class = (Class)HUAlbumIconContentView;
  -[HUIconContentView updateWithIconDescriptor:displayStyle:animated:](&v17, sel_updateWithIconDescriptor_displayStyle_animated_, v9, a4, v5);
  if (!v15 || v16 != a4)
    -[HUAlbumIconContentView _updateIconImage](self, "_updateIconImage");

}

- (void)setIconSize:(unint64_t)a3
{
  unint64_t v5;
  objc_super v6;

  v5 = -[HUIconContentView iconSize](self, "iconSize");
  v6.receiver = self;
  v6.super_class = (Class)HUAlbumIconContentView;
  -[HUIconContentView setIconSize:](&v6, sel_setIconSize_, a3);
  if (v5 != a3)
    -[HUAlbumIconContentView _updateIconImage](self, "_updateIconImage");
}

- (void)_updateIconImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_opt_class();
  -[HUIconContentView iconDescriptor](self, "iconDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v9 = v4;

  if (v9)
  {
    v5 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(v9, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageWithData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUAlbumIconContentView imageView](self, "imageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImage:", v7);

  }
  else
  {
    -[HUAlbumIconContentView imageView](self, "imageView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setImage:", 0);
  }

}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
