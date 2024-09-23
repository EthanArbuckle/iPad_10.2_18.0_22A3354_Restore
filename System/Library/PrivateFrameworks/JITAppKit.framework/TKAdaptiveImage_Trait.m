@implementation TKAdaptiveImage_Trait

- (TKAdaptiveImage_Trait)init
{
  TKAdaptiveImage_Trait *v2;
  TKAdaptiveImage_Trait *v4;
  objc_super v5;
  SEL v6;
  TKAdaptiveImage_Trait *v7;

  v6 = a2;
  v7 = 0;
  v5.receiver = self;
  v5.super_class = (Class)TKAdaptiveImage_Trait;
  v7 = -[TKAdaptiveImage_Trait init](&v5, sel_init);
  objc_storeStrong((id *)&v7, v7);
  if (v7)
  {
    v7->_horizontalSizeClass = 0;
    v7->_verticalSizeClass = 0;
    v7->_useReadableWidth = 1;
    v2 = v7;
    v7->_crop.origin = (CGPoint)TKAdaptiveImageFullCrop;
    v2->_crop.size = (CGSize)xmmword_21CAC83F0;
  }
  v4 = v7;
  objc_storeStrong((id *)&v7, 0);
  return v4;
}

- (void)setQuality:(double)a3
{
  double v3;

  v3 = a3;
  if (a3 > 1.0 || a3 <= 0.0)
    v3 = 0.850000024;
  self->_quality = v3;
}

- (void)setCrop:(CGRect)a3
{
  CGRect v3;

  v3 = a3;
  if (a3.origin.x < 0.0 || a3.origin.x >= 1.0)
    v3.origin.x = 0.0;
  if (a3.origin.y < 0.0 || a3.origin.y >= 1.0)
    v3.origin.y = 0.0;
  if (a3.size.width <= 0.0 || a3.size.width > 1.0)
    v3.size.width = 1.0;
  if (a3.size.height <= 0.0 || a3.size.height > 1.0)
    v3.size.height = 1.0;
  self->_crop = v3;
}

- (BOOL)compatibleWithTrait:(id)a3
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  TKAdaptiveImage_Trait *v8;
  NSURL *url;
  id v10;
  BOOL v11;
  CGRect rect2;
  id location[2];
  TKAdaptiveImage_Trait *v14;

  v14 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  url = v14->_url;
  v10 = (id)objc_msgSend(location[0], "url");
  v11 = 0;
  if ((-[NSURL isEqual:](url, "isEqual:") & 1) != 0)
  {
    v8 = v14;
    objc_msgSend(location[0], "crop");
    rect2.origin.x = v3;
    rect2.origin.y = v4;
    rect2.size.width = v5;
    rect2.size.height = v6;
    v11 = CGRectEqualToRect(v8->_crop, rect2);
  }

  objc_storeStrong(location, 0);
  return v11;
}

- (int64_t)horizontalSizeClass
{
  return self->_horizontalSizeClass;
}

- (void)setHorizontalSizeClass:(int64_t)a3
{
  self->_horizontalSizeClass = a3;
}

- (int64_t)verticalSizeClass
{
  return self->_verticalSizeClass;
}

- (void)setVerticalSizeClass:(int64_t)a3
{
  self->_verticalSizeClass = a3;
}

- (BOOL)useReadableWidth
{
  return self->_useReadableWidth;
}

- (void)setUseReadableWidth:(BOOL)a3
{
  self->_useReadableWidth = a3;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  height = self->_size.height;
  width = self->_size.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (CGSize)relativeSize
{
  double width;
  double height;
  CGSize result;

  height = self->_relativeSize.height;
  width = self->_relativeSize.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRelativeSize:(CGSize)a3
{
  self->_relativeSize = a3;
}

- (CGRect)crop
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  y = self->_crop.origin.y;
  x = self->_crop.origin.x;
  height = self->_crop.size.height;
  width = self->_crop.size.width;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGSize)minSize
{
  double width;
  double height;
  CGSize result;

  height = self->_minSize.height;
  width = self->_minSize.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMinSize:(CGSize)a3
{
  self->_minSize = a3;
}

- (CGSize)maxSize
{
  double width;
  double height;
  CGSize result;

  height = self->_maxSize.height;
  width = self->_maxSize.width;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxSize:(CGSize)a3
{
  self->_maxSize = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)quality
{
  return self->_quality;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
}

@end
