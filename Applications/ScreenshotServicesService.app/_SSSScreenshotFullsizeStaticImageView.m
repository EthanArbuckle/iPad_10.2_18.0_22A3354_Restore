@implementation _SSSScreenshotFullsizeStaticImageView

- (_SSSScreenshotFullsizeStaticImageView)initWithFrame:(CGRect)a3
{
  _SSSScreenshotFullsizeStaticImageView *v3;
  UIImageView *v4;
  UIImageView *imageView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_SSSScreenshotFullsizeStaticImageView;
  v3 = -[_SSSScreenshotFullsizeStaticImageView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  imageView = v3->_imageView;
  v3->_imageView = v4;

  -[_SSSScreenshotFullsizeStaticImageView addSubview:](v3, "addSubview:", v3->_imageView);
  -[_SSSScreenshotFullsizeStaticImageView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
  return v3;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  void *v6;
  unsigned int v7;
  const CALayerContentsFilter *v8;
  _BYTE v9[32];

  -[_SSSScreenshotFullsizeStaticImageView cropInfo](self, "cropInfo");
  if (!CGRectIsEmpty(*(CGRect *)v9))
  {
    -[_SSSScreenshotFullsizeStaticImageView sizeMultiplier](self, "sizeMultiplier");
    v4 = *(double *)&v9[16] * v3;
    -[_SSSScreenshotFullsizeStaticImageView sizeMultiplier](self, "sizeMultiplier");
    -[UIImageView setFrame:](self->_imageView, "setFrame:", *(double *)v9, *(double *)&v9[8], v4, *(double *)&v9[24] * v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_imageView, "layer"));
    v7 = -[_SSSScreenshotFullsizeStaticImageView useTrilinearMinificationFilter](self, "useTrilinearMinificationFilter");
    v8 = &kCAFilterTrilinear;
    if (!v7)
      v8 = &kCAFilterLinear;
    objc_msgSend(v6, "setMinificationFilter:", *v8);

  }
}

- (void)setImage:(id)a3
{
  -[UIImageView setImage:](self->_imageView, "setImage:", a3);
  -[_SSSScreenshotFullsizeStaticImageView setNeedsLayout](self, "setNeedsLayout");
  -[_SSSScreenshotFullsizeStaticImageView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
}

- (UIImage)image
{
  return -[UIImageView image](self->_imageView, "image");
}

- (void)setCropInfo:(SSSCropInfo *)a3
{
  CGSize size;
  CGPoint origin;

  origin = a3->currentRect.origin;
  size = a3->currentRect.size;
  self->_cropInfo.totalSize = a3->totalSize;
  self->_cropInfo.currentRect.origin = origin;
  self->_cropInfo.currentRect.size = size;
  -[_SSSScreenshotFullsizeStaticImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setSizeMultiplier:(CGSize)a3
{
  self->_sizeMultiplier = a3;
  -[_SSSScreenshotFullsizeStaticImageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setUseTrilinearMinificationFilter:(BOOL)a3
{
  self->_useTrilinearMinificationFilter = a3;
  -[_SSSScreenshotFullsizeStaticImageView setNeedsLayout](self, "setNeedsLayout");
}

- (id)generateImageForScreenshot:(id)a3
{
  return 0;
}

- (SSSCropInfo)cropInfo
{
  CGPoint v3;

  v3 = *(CGPoint *)&self[1].totalSize.height;
  retstr->totalSize = *(CGSize *)&self->currentRect.size.height;
  retstr->currentRect.origin = v3;
  retstr->currentRect.size = *(CGSize *)&self[1].currentRect.origin.y;
  return self;
}

- (CGSize)sizeMultiplier
{
  double width;
  double height;
  CGSize result;

  width = self->_sizeMultiplier.width;
  height = self->_sizeMultiplier.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)useTrilinearMinificationFilter
{
  return self->_useTrilinearMinificationFilter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
