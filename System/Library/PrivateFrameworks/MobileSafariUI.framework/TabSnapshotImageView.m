@implementation TabSnapshotImageView

- (TabSnapshotImageView)initWithImage:(id)a3
{
  TabSnapshotImageView *v3;
  TabSnapshotImageView *v4;
  TabSnapshotImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabSnapshotImageView;
  v3 = -[TabSnapshotImageView initWithImage:](&v7, sel_initWithImage_, a3);
  v4 = v3;
  if (v3)
  {
    -[TabSnapshotImageView _setUpImageView](v3, "_setUpImageView");
    v5 = v4;
  }

  return v4;
}

- (void)_setUpImageView
{
  -[TabSnapshotImageView setContentMode:](self, "setContentMode:", 2);
  self->_keepImageAligned = 1;
}

- (TabSnapshotImageView)initWithFrame:(CGRect)a3
{
  TabSnapshotImageView *v3;
  TabSnapshotImageView *v4;
  TabSnapshotImageView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TabSnapshotImageView;
  v3 = -[TabSnapshotImageView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TabSnapshotImageView _setUpImageView](v3, "_setUpImageView");
    v5 = v4;
  }

  return v4;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[TabSnapshotImageView image](self, "image");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    v6.receiver = self;
    v6.super_class = (Class)TabSnapshotImageView;
    -[TabSnapshotImageView setImage:](&v6, sel_setImage_, v4);
    if (self->_keepImageAligned)
      -[TabSnapshotImageView updateImageAlignment](self, "updateImageAlignment");
  }

}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TabSnapshotImageView;
  -[TabSnapshotImageView layoutSubviews](&v3, sel_layoutSubviews);
  if (self->_keepImageAligned)
    -[TabSnapshotImageView updateImageAlignment](self, "updateImageAlignment");
}

- (void)updateImageAlignment
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v3 = (void *)objc_opt_class();
  -[TabSnapshotImageView image](self, "image");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v4 = imageSizeOnScreen(v16);
  v6 = v5;
  -[TabSnapshotImageView bounds](self, "bounds");
  objc_msgSend(v3, "contentsRectWithSnapshotSize:imageViewSize:imagePosition:cropInsets:", v4, v6, *(_QWORD *)&self->_cropInsets.top, *(_QWORD *)&self->_cropInsets.left, *(_QWORD *)&self->_cropInsets.bottom, *(_QWORD *)&self->_cropInsets.right);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[TabSnapshotImageView layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setContentsRect:", v8, v10, v12, v14);

}

+ (CGRect)contentsRectWithSnapshotSize:(CGSize)a3 imageViewSize:(CGSize)a4 imagePosition:(CGPoint)a5 cropInsets:(UIEdgeInsets)a6
{
  double height;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double width;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  height = a4.height;
  v7 = 1.0;
  v8 = 1.0;
  v9 = 0.0;
  v10 = 0.0;
  if (a3.width != 0.0)
  {
    v11 = a3.height;
    if (a3.height != 0.0 && a4.width != 0.0 && height != 0.0)
    {
      width = a3.width;
      objc_msgSend((id)objc_opt_class(), "imageScaleRatioWithOnScreenImageSize:imageViewSize:cropInsets:", a3.width, a3.height, a4.width, height, a6.top, a6.left, a6.bottom, a6.right);
      v13 = width - a6.left - a6.right;
      v15 = (v11 - a6.top - a6.bottom) * v14;
      v10 = a5.x / (v13 * v14);
      v9 = (a5.y + (v15 - height) * -0.5) / v15;
      v8 = v13 / width;
      _SFRoundFloatToPixels();
      v7 = 1.0 - fmax(v16 / v15, 0.0);
    }
  }
  v17 = v10;
  v18 = v9;
  v19 = v8;
  result.size.height = v7;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

+ (double)imageScaleRatioWithOnScreenImageSize:(CGSize)a3 imageViewSize:(CGSize)a4 cropInsets:(UIEdgeInsets)a5
{
  double v5;
  double result;

  v5 = a4.height / (a3.height - a5.top - a5.bottom);
  result = a4.width / (a3.width - a5.left - a5.right);
  if (v5 > result)
    return v5;
  return result;
}

- (void)setCropInsets:(UIEdgeInsets)a3
{
  if (self->_cropInsets.left != a3.left
    || self->_cropInsets.top != a3.top
    || self->_cropInsets.right != a3.right
    || self->_cropInsets.bottom != a3.bottom)
  {
    self->_cropInsets = a3;
    if (self->_keepImageAligned)
      -[TabSnapshotImageView updateImageAlignment](self, "updateImageAlignment");
  }
}

- (void)setImagePosition:(CGPoint)a3
{
  if (a3.x != self->_imagePosition.x || a3.y != self->_imagePosition.y)
  {
    self->_imagePosition = a3;
    if (self->_keepImageAligned)
      -[TabSnapshotImageView updateImageAlignment](self, "updateImageAlignment");
  }
}

- (double)imageScaleRatio
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  void *v17;
  double v18;
  CGRect v20;

  -[TabSnapshotImageView image](self, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  v5 = v4;
  v7 = v6;
  -[TabSnapshotImageView bounds](self, "bounds");
  v12 = 1.0;
  if (v3)
  {
    if (v5 != 0.0 && v7 != 0.0)
    {
      v13 = v8;
      v14 = v9;
      v15 = v10;
      v16 = v11;
      if (CGRectGetWidth(*(CGRect *)&v8) != 0.0)
      {
        v20.origin.x = v13;
        v20.origin.y = v14;
        v20.size.width = v15;
        v20.size.height = v16;
        if (CGRectGetHeight(v20) != 0.0)
        {
          v17 = (void *)objc_opt_class();
          objc_msgSend(v17, "imageScaleRatioWithOnScreenImageSize:imageViewSize:cropInsets:", imageSizeOnScreen(v3));
          v12 = v18;
        }
      }
    }
  }

  return v12;
}

+ (CGSize)imageSizeOnScreen:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = imageSizeOnScreen(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGPoint)imagePosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_imagePosition.x;
  y = self->_imagePosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (UIEdgeInsets)cropInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_cropInsets.top;
  left = self->_cropInsets.left;
  bottom = self->_cropInsets.bottom;
  right = self->_cropInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (BOOL)keepImageAligned
{
  return self->_keepImageAligned;
}

- (void)setKeepImageAligned:(BOOL)a3
{
  self->_keepImageAligned = a3;
}

@end
