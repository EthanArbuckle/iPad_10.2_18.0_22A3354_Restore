@implementation CAMFlashBadge

- (CAMFlashBadge)initWithFrame:(CGRect)a3
{
  CAMFlashBadge *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImage *contentImage;
  CAMFlashBadge *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CAMFlashBadge;
  v3 = -[CEKBadgeView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0DC3870];
    CAMCameraUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageNamed:inBundle:", CFSTR("CAMFlashBadge"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageWithRenderingMode:", 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageWithTintColor:", v8);
    v9 = objc_claimAutoreleasedReturnValue();
    contentImage = v3->__contentImage;
    v3->__contentImage = (UIImage *)v9;

    v11 = v3;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[CAMFlashBadge _imageSize](self, "_imageSize");
  -[CAMFlashBadge _imageInsets](self, "_imageInsets");
  UICeilToViewScale();
  v4 = v3;
  UICeilToViewScale();
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (CGSize)_imageSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[UIImage size](self->__contentImage, "size");
  v4 = v3;
  v6 = v5;
  -[CAMFlashBadge traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredContentSizeCategory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x1E0DC4918];
  if ((objc_msgSend(v8, "isEqualToString:", *MEMORY[0x1E0DC4918]) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D0D028], "_textHeightForContentSize:", v8);
    objc_msgSend(MEMORY[0x1E0D0D028], "_textHeightForContentSize:", v9);
    UIRoundToViewScale();
    v4 = v10;
    UIRoundToViewScale();
    v6 = v11;
  }

  v12 = v4;
  v13 = v6;
  result.height = v13;
  result.width = v12;
  return result;
}

- (UIEdgeInsets)_imageInsets
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
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIEdgeInsets result;

  -[CAMFlashBadge _imageSize](self, "_imageSize");
  v4 = v3;
  objc_msgSend(MEMORY[0x1E0D0D028], "_defaultTextInsets");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)MEMORY[0x1E0D0D028];
  -[CAMFlashBadge traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "preferredContentSizeCategory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_heightForContentSize:textInsets:", v15, v6, v8, v10, v12);
  v17 = v16;

  UICeilToViewScale();
  v19 = v17 - v4 - v18;
  v20 = 16.0;
  v21 = 16.0;
  result.right = v21;
  result.bottom = v19;
  result.left = v20;
  result.top = v18;
  return result;
}

- (id)_maskImage
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CGSize v17;

  -[CAMFlashBadge bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[CAMFlashBadge _imageSize](self, "_imageSize");
  v8 = v7;
  v10 = v9;
  -[CAMFlashBadge _imageInsets](self, "_imageInsets");
  v12 = v11;
  v14 = v13;
  v17.width = v4;
  v17.height = v6;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  -[UIImage drawInRect:](self->__contentImage, "drawInRect:", v14, v12, v8, v10);
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v15;
}

- (void)traitCollectionDidChange:(id)a3
{
  void *v4;
  id v5;
  id v6;

  objc_msgSend(a3, "preferredContentSizeCategory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMFlashBadge traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredContentSizeCategory");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v6 && (objc_msgSend(v5, "isEqualToString:", v6) & 1) == 0)
    -[CAMFlashBadge setNeedsDisplay](self, "setNeedsDisplay");

}

- (UIImage)_contentImage
{
  return self->__contentImage;
}

- (void)set_contentImage:(id)a3
{
  objc_storeStrong((id *)&self->__contentImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentImage, 0);
}

@end
