@implementation SUUIParallaxImageView

- (SUUIParallaxImageView)initWithFrame:(CGRect)a3
{
  SUUIParallaxImageView *v3;
  SUUIImageView *v4;
  uint64_t v5;
  SUUIImageView *innerImageView;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SUUIParallaxImageView;
  v3 = -[SUUIParallaxImageView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [SUUIImageView alloc];
    -[SUUIParallaxImageView bounds](v3, "bounds");
    v5 = -[SUUIImageView initWithFrame:](v4, "initWithFrame:");
    innerImageView = v3->_innerImageView;
    v3->_innerImageView = (SUUIImageView *)v5;

    -[SUUIParallaxImageView addSubview:](v3, "addSubview:", v3->_innerImageView);
    -[SUUIParallaxImageView setClipsToBounds:](v3, "setClipsToBounds:", 1);
  }
  return v3;
}

- (void)setImagePadding:(UIEdgeInsets)a3
{
  if (a3.left != self->_imagePadding.left
    || a3.top != self->_imagePadding.top
    || a3.right != self->_imagePadding.right
    || a3.bottom != self->_imagePadding.bottom)
  {
    self->_imagePadding = a3;
    -[SUUIParallaxImageView _updateInnerImageView](self, "_updateInnerImageView");
    -[SUUIParallaxImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)image
{
  return (id)-[SUUIImageView image](self->_innerImageView, "image");
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

- (void)setImage:(id)a3
{
  -[SUUIImageView setImage:](self->_innerImageView, "setImage:", a3);
}

- (id)placeholder
{
  return -[SUUIImageView placeholder](self->_innerImageView, "placeholder");
}

- (void)setPlaceholder:(id)a3
{
  -[SUUIImageView setPlaceholder:](self->_innerImageView, "setPlaceholder:", a3);
}

- (void)setImageSize:(CGSize)a3
{
  if (a3.width != self->_imageSize.width || a3.height != self->_imageSize.height)
  {
    self->_imageSize = a3;
    -[SUUIParallaxImageView _updateInnerImageView](self, "_updateInnerImageView");
    -[SUUIParallaxImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (double)maximumPerspectiveHeightForSize:(CGSize)a3
{
  return 0.0;
}

- (void)updateForChangedDistanceFromVanishingPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  SUUIImageView *innerImageView;
  double top;
  double left;
  double bottom;
  double right;
  SUUIImageView *v25;
  _OWORD v26[3];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGRect v30;
  CGRect v31;

  -[SUUIParallaxImageView frame](self, "frame");
  v4 = v3;
  v6 = v5;
  -[SUUIParallaxImageView window](self, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIParallaxImageView convertPoint:toView:](self, "convertPoint:toView:", v7, v4, v6);
  v9 = v8;
  v11 = v10;

  -[SUUIParallaxImageView window](self, "window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v13 = v9 / CGRectGetWidth(v30);

  -[SUUIParallaxImageView window](self, "window");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v15 = (v11 + -64.0) / (CGRectGetHeight(v31) + -128.0);

  v16 = 1.0;
  if (v13 <= 1.0)
    v17 = v13;
  else
    v17 = 1.0;
  v18 = fmax(v17, 0.0);
  if (v15 <= 1.0)
    v16 = v15;
  v19 = fmax(v16, 0.0);
  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  innerImageView = self->_innerImageView;
  if (innerImageView)
  {
    -[SUUIImageView transform](innerImageView, "transform");
  }
  else
  {
    v27 = 0uLL;
    v28 = 0uLL;
  }
  top = self->_imagePadding.top;
  left = self->_imagePadding.left;
  bottom = self->_imagePadding.bottom;
  right = self->_imagePadding.right;
  *(double *)&v29 = v18 * (left + right);
  *((double *)&v29 + 1) = v19 * (top + bottom);
  if (right > 0.00000011920929 && left < 0.00000011920929)
    *(double *)&v29 = -(v18 * (left + right));
  if (bottom > 0.00000011920929 && top < 0.00000011920929)
    *((double *)&v29 + 1) = -(v19 * (top + bottom));
  v25 = self->_innerImageView;
  v26[0] = v27;
  v26[1] = v28;
  v26[2] = v29;
  -[SUUIImageView setTransform:](v25, "setTransform:", v26);
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  objc_super v12;
  CGRect v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUIParallaxImageView frame](self, "frame");
  v14.origin.x = v8;
  v14.origin.y = v9;
  v14.size.width = v10;
  v14.size.height = v11;
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)SUUIParallaxImageView;
    -[SUUIParallaxImageView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    -[SUUIParallaxImageView _updateInnerImageView](self, "_updateInnerImageView");
    -[SUUIParallaxImageView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
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

- (void)_updateInnerImageView
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;

  -[SUUIParallaxImageView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v7 = self->_imagePadding.left + self->_imagePadding.right;
  v9 = v8 + v7;
  v10 = self->_imagePadding.top + self->_imagePadding.bottom;
  v12 = v11 + v10;
  -[SUUIImageView setImageSize:](self->_innerImageView, "setImageSize:", v7 + self->_imageSize.width, v10 + self->_imageSize.height);
  -[SUUIImageView setFrame:](self->_innerImageView, "setFrame:", v4, v6, v9, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_innerImageView, 0);
}

@end
