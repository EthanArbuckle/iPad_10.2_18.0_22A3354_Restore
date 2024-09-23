@implementation AEGridOverlayLayoutInfo

- (AEGridOverlayLayoutInfo)initWithGradientImageSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  AEGridOverlayLayoutInfo *result;
  objc_super v6;

  height = a3.height;
  width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)AEGridOverlayLayoutInfo;
  result = -[AEGridOverlayLayoutInfo init](&v6, sel_init);
  if (result)
  {
    result->__gradientImageSize.width = width;
    result->__gradientImageSize.height = height;
  }
  return result;
}

- (CGSize)tileSystemLayoutSizeFittingSize:(CGSize)a3
{
  double height;
  CGFloat width;
  double v5;
  double v6;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[AEGridOverlayLayoutInfo _gradientImageSize](self, "_gradientImageSize");
  if (v5 >= height)
    v5 = height;
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (CGSize)_gradientImageSize
{
  double width;
  double height;
  CGSize result;

  width = self->__gradientImageSize.width;
  height = self->__gradientImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
