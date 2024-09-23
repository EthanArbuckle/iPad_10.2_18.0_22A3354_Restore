@implementation HUNamedWallpaperCell

- (HUNamedWallpaperCell)initWithFrame:(CGRect)a3
{
  HUNamedWallpaperCell *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *imageView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HUNamedWallpaperCell;
  v3 = -[HUNamedWallpaperCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA658]);
    -[HUNamedWallpaperCell contentView](v3, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v6 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v6;

    -[UIImageView setAutoresizingMask:](v3->_imageView, "setAutoresizingMask:", 18);
    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 0);
    -[UIImageView setClipsToBounds:](v3->_imageView, "setClipsToBounds:", 1);
    -[UIImageView layer](v3->_imageView, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setCornerRadius:", 4.0);

    -[HUNamedWallpaperCell contentView](v3, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[HUNamedWallpaperCell imageView](self, "imageView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUNamedWallpaperCell imageView](self, "imageView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (void)setContentMode:(int64_t)a3
{
  id v4;

  self->_contentMode = a3;
  -[HUNamedWallpaperCell imageView](self, "imageView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentMode:", a3);

}

- (int64_t)contentMode
{
  return self->_contentMode;
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
