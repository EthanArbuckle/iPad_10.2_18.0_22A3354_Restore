@implementation SUUISlideshowImageScrollView

- (SUUISlideshowImageScrollView)initWithFrame:(CGRect)a3
{
  SUUISlideshowImageScrollView *v3;
  SUUISlideshowImageScrollView *v4;
  UIImage *image;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUISlideshowImageScrollView;
  v3 = -[SUUISlideshowImageScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SUUISlideshowImageScrollView setShowsHorizontalScrollIndicator:](v3, "setShowsHorizontalScrollIndicator:", 0);
    -[SUUISlideshowImageScrollView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[SUUISlideshowImageScrollView setBouncesZoom:](v4, "setBouncesZoom:", 1);
    -[SUUISlideshowImageScrollView setDecelerationRate:](v4, "setDecelerationRate:", *MEMORY[0x24BEBE728]);
    image = v4->_image;
    v4->_image = 0;

    v4->_centerPointBeforeResize = (CGPoint)*MEMORY[0x24BDBEFB0];
    v4->_scaleBeforeResize = 0.0;
  }
  return v4;
}

- (void)resetZoomScale
{
  -[SUUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  -[SUUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");
}

- (void)zoomIntoPoint:(CGPoint)a3
{
  double y;
  double x;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;

  y = a3.y;
  x = a3.x;
  -[SUUISlideshowImageScrollView zoomScale](self, "zoomScale");
  v7 = v6;
  -[SUUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  if (v7 == v8)
  {
    -[SUUISlideshowImageScrollView maximumZoomScale](self, "maximumZoomScale");
    v10 = v9;
    -[SUUISlideshowImageScrollView contentSize](self, "contentSize");
    v12 = v11;
    -[SUUISlideshowImageScrollView zoomScale](self, "zoomScale");
    v14 = v12 / v13;
    -[SUUISlideshowImageScrollView contentSize](self, "contentSize");
    v16 = v15;
    -[SUUISlideshowImageScrollView zoomScale](self, "zoomScale");
    v18 = v16 / v17;
    -[SUUISlideshowImageScrollView bounds](self, "bounds");
    v20 = v14 * (x / v19);
    -[SUUISlideshowImageScrollView bounds](self, "bounds");
    v22 = v18 * (y / v21);
    -[SUUISlideshowImageScrollView bounds](self, "bounds");
    v24 = v23 / v10;
    -[SUUISlideshowImageScrollView bounds](self, "bounds");
    -[SUUISlideshowImageScrollView zoomToRect:animated:](self, "zoomToRect:animated:", 1, v20 - v24 * 0.5, v22 - v25 / v10 * 0.5, v24);
  }
  else
  {
    -[SUUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
    -[SUUISlideshowImageScrollView setZoomScale:animated:](self, "setZoomScale:animated:", 1);
  }
}

- (CGRect)visibleRect
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
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[SUUISlideshowImageScrollView contentOffset](self, "contentOffset");
  v4 = v3;
  v6 = v5;
  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  v8 = v7;
  v10 = v9;
  -[SUUISlideshowImageScrollView zoomScale](self, "zoomScale");
  v12 = v6 / v11;
  v13 = v8 / v11;
  v14 = v10 / v11;
  v15 = v4 / v11;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v15;
  return result;
}

- (void)layoutSubviews
{
  double Width;
  double Height;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;

  v9.receiver = self;
  v9.super_class = (Class)SUUISlideshowImageScrollView;
  -[SUUISlideshowImageScrollView layoutSubviews](&v9, sel_layoutSubviews);
  if (self->_imageView)
  {
    -[SUUISlideshowImageScrollView bounds](self, "bounds");
    Width = CGRectGetWidth(v10);
    -[SUUISlideshowImageScrollView bounds](self, "bounds");
    Height = CGRectGetHeight(v11);
    -[UIImageView frame](self->_imageView, "frame");
    v7 = (Width - v6) * 0.5;
    if (v6 >= Width)
      v7 = 0.0;
    v8 = (Height - v5) * 0.5;
    if (v5 >= Height)
      v8 = 0.0;
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v7, v8);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SUUISlideshowImageScrollView frame](self, "frame");
  if (width == v9 && height == v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)SUUISlideshowImageScrollView;
    -[SUUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
  }
  else
  {
    -[SUUISlideshowImageScrollView _prepareToResize](self, "_prepareToResize");
    v11.receiver = self;
    v11.super_class = (Class)SUUISlideshowImageScrollView;
    -[SUUISlideshowImageScrollView setFrame:](&v11, sel_setFrame_, x, y, width, height);
    -[SUUISlideshowImageScrollView _recoverFromResize](self, "_recoverFromResize");
  }
}

- (void)setImage:(id)a3
{
  UIImageView *imageView;
  UIImageView *v6;
  UIImageView *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_image, a3);
  imageView = self->_imageView;
  if (imageView)
    -[UIImageView removeFromSuperview](imageView, "removeFromSuperview");
  v6 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v8);
  v7 = self->_imageView;
  self->_imageView = v6;

  -[SUUISlideshowImageScrollView addSubview:](self, "addSubview:", self->_imageView);
  objc_msgSend(v8, "size");
  -[SUUISlideshowImageScrollView setContentSize:](self, "setContentSize:");
  -[SUUISlideshowImageScrollView _resetMinMaxZoomScales](self, "_resetMinMaxZoomScales");
  -[SUUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  -[SUUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:");

}

- (void)_prepareToResize
{
  double MidX;
  CGFloat v4;
  CGFloat v5;
  double v6;
  CGRect v7;
  CGRect v8;

  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  MidX = CGRectGetMidX(v7);
  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  -[SUUISlideshowImageScrollView convertPoint:toView:](self, "convertPoint:toView:", self->_imageView, MidX, CGRectGetMidY(v8));
  self->_centerPointBeforeResize.x = v4;
  self->_centerPointBeforeResize.y = v5;
  -[SUUISlideshowImageScrollView zoomScale](self, "zoomScale");
  self->_scaleBeforeResize = v6;
}

- (void)_recoverFromResize
{
  double scaleBeforeResize;
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
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  -[SUUISlideshowImageScrollView _resetMinMaxZoomScales](self, "_resetMinMaxZoomScales");
  -[SUUISlideshowImageScrollView minimumZoomScale](self, "minimumZoomScale");
  if (scaleBeforeResize >= self->_scaleBeforeResize)
    scaleBeforeResize = self->_scaleBeforeResize;
  -[SUUISlideshowImageScrollView setZoomScale:](self, "setZoomScale:", scaleBeforeResize);
  -[SUUISlideshowImageScrollView convertPoint:fromView:](self, "convertPoint:fromView:", self->_imageView, self->_centerPointBeforeResize.x, self->_centerPointBeforeResize.y);
  v5 = v4;
  v7 = v6;
  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  v9 = v5 - v8 * 0.5;
  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  v11 = v7 - v10 * 0.5;
  -[SUUISlideshowImageScrollView contentSize](self, "contentSize");
  v13 = v12;
  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  v15 = v13 - v14;
  -[SUUISlideshowImageScrollView contentSize](self, "contentSize");
  v17 = v16;
  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  v19 = v17 - v18;
  if (v15 >= v9)
    v20 = v9;
  else
    v20 = v15;
  if (v19 >= v11)
    v21 = v11;
  else
    v21 = v19;
  if (*MEMORY[0x24BDBEFB0] >= v20)
    v22 = *MEMORY[0x24BDBEFB0];
  else
    v22 = v20;
  if (*(double *)(MEMORY[0x24BDBEFB0] + 8) >= v21)
    v23 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  else
    v23 = v21;
  -[SUUISlideshowImageScrollView setContentOffset:](self, "setContentOffset:", v22, v23);
}

- (void)_resetMinMaxZoomScales
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  -[SUUISlideshowImageScrollView bounds](self, "bounds");
  if (self->_image)
  {
    v7 = v5;
    v8 = v6;
    if (!CGRectIsEmpty(*(CGRect *)&v3))
    {
      -[UIImage size](self->_image, "size");
      v11 = 0.0;
      if (v7 > 0.0 && v8 > 0.0 && v9 > 0.0 && v10 > 0.0)
      {
        v12 = v7 / v9;
        v13 = v8 / v10;
        if (v12 >= v13)
          v11 = v13;
        else
          v11 = v12;
      }
      -[SUUISlideshowImageScrollView setMinimumZoomScale:](self, "setMinimumZoomScale:", v11);
      -[SUUISlideshowImageScrollView setMaximumZoomScale:](self, "setMaximumZoomScale:", v11 + v11);
    }
  }
}

- (UIImage)image
{
  return self->_image;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
