@implementation SUUIIPhoneSlideshowCell

- (SUUIIPhoneSlideshowCell)initWithFrame:(CGRect)a3
{
  SUUIIPhoneSlideshowCell *v3;
  UIImageView *v4;
  UIImageView *imageView;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIIPhoneSlideshowCell;
  v3 = -[SUUIIPhoneSlideshowCell initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
    imageView = v3->_imageView;
    v3->_imageView = v4;

    -[UIImageView setContentMode:](v3->_imageView, "setContentMode:", 1);
    -[SUUIIPhoneSlideshowCell contentView](v3, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v3->_imageView);

  }
  return v3;
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (CGRect)imageFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIImageView frame](self->_imageView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setImage:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[UIImageView image](self->_imageView, "image");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[UIImageView setImage:](self->_imageView, "setImage:", v6);
    -[SUUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");
    v5 = v6;
  }

}

- (void)setImageSize:(CGSize)a3
{
  if (self->_imageSize.width != a3.width || self->_imageSize.height != a3.height)
  {
    self->_imageSize = a3;
    -[SUUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setVideo:(BOOL)a3
{
  UIImageView *playIcon;
  _BOOL4 v5;
  UIImageView *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *v11;
  void *v12;
  id v13;

  playIcon = self->_playIcon;
  if ((((playIcon == 0) ^ a3) & 1) == 0)
  {
    v5 = a3;
    -[UIImageView removeFromSuperview](playIcon, "removeFromSuperview");
    v6 = self->_playIcon;
    self->_playIcon = 0;

    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x24BEBD640];
      if (-[SUUIIPhoneSlideshowCell isHighlighted](self, "isHighlighted"))
        v8 = CFSTR("PlayControlPressed");
      else
        v8 = CFSTR("PlayControl");
      objc_msgSend(v7, "imageNamed:inBundle:", v8, v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v9);
      v11 = self->_playIcon;
      self->_playIcon = v10;

      -[SUUIIPhoneSlideshowCell contentView](self, "contentView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "addSubview:", self->_playIcon);

      -[SUUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (BOOL)isVideo
{
  return self->_playIcon != 0;
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SUUIIPhoneSlideshowCell;
  -[SUUIIPhoneSlideshowCell setHighlighted:](&v9, sel_setHighlighted_);
  if (self->_playIcon)
  {
    v5 = (void *)MEMORY[0x24BEBD640];
    if (v3)
      v6 = CFSTR("PlayControlPressed");
    else
      v6 = CFSTR("PlayControl");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageNamed:inBundle:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIImageView setImage:](self->_playIcon, "setImage:", v8);
    -[SUUIIPhoneSlideshowCell setNeedsLayout](self, "setNeedsLayout");

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  UIImageView *imageView;
  double width;
  double height;
  void *v12;
  double v13;
  double v14;
  float v15;
  float v16;
  UIImageView *playIcon;
  UIImageView *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SUUIIPhoneSlideshowCell;
  -[SUUIIPhoneSlideshowCell layoutSubviews](&v19, sel_layoutSubviews);
  -[SUUIIPhoneSlideshowCell contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  imageView = self->_imageView;
  if (imageView)
  {
    width = self->_imageSize.width;
    height = self->_imageSize.height;
    if (width == *MEMORY[0x24BDBF148] && height == *(double *)(MEMORY[0x24BDBF148] + 8))
    {
      -[UIImageView image](imageView, "image");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "size");
      width = v13;
      height = v14;

      imageView = self->_imageView;
    }
    v15 = (v5 - fmin(width, v5)) * 0.5;
    v16 = (v7 - fmin(height, v7)) * 0.5;
    -[UIImageView setFrame:](imageView, "setFrame:", roundf(v15), roundf(v16));
  }
  playIcon = self->_playIcon;
  if (playIcon)
  {
    -[UIImageView sizeToFit](playIcon, "sizeToFit");
    -[UIImageView frame](self->_playIcon, "frame");
    v18 = self->_playIcon;
    -[SUUIIPhoneSlideshowCell center](self, "center");
    -[UIImageView setCenter:](v18, "setCenter:");
    -[SUUIIPhoneSlideshowCell bringSubviewToFront:](self, "bringSubviewToFront:", self->_playIcon);
  }
}

- (void)prepareForReuse
{
  -[UIImageView setImage:](self->_imageView, "setImage:", 0);
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playIcon, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
