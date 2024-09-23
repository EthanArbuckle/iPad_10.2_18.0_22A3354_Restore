@implementation NUNIAstronomyLocationDotConfiguration

- (NUNIAstronomyLocationDotConfiguration)init
{
  NUNIAstronomyLocationDotConfiguration *v2;
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)NUNIAstronomyLocationDotConfiguration;
  v2 = -[NUNIAstronomyLocationDotConfiguration init](&v11, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDB8780], "sharedRenderingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "device");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "screenScale");
    v2->_screenScale = v5;
    objc_msgSend((id)objc_opt_class(), "_defaultSizeForDevice:", v4);
    v2->_defaultSize.width = v6;
    v2->_defaultSize.height = v7;
    objc_msgSend((id)objc_opt_class(), "_defaultOuterDotDiameterForDevice:", v4);
    v2->_defaultOuterDotDiameter = v8;
    objc_msgSend((id)objc_opt_class(), "_defaultInnerDotDiameterForDevice:", v4);
    v2->_defaultInnerDotDiameter = v9;

  }
  return v2;
}

+ (double)_defaultOuterDotDiameterForDevice:(id)a3
{
  double v3;

  _LayoutConstants(a3);
  return v3;
}

+ (double)_defaultInnerDotDiameterForDevice:(id)a3
{
  double v3;

  _LayoutConstants(a3);
  return v3;
}

+ (CGSize)_defaultSizeForDevice:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = _LayoutConstants(a3);
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (void)setScreenScale:(double)a3
{
  self->_screenScale = a3;
}

- (CGSize)defaultSize
{
  double width;
  double height;
  CGSize result;

  width = self->_defaultSize.width;
  height = self->_defaultSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setDefaultSize:(CGSize)a3
{
  self->_defaultSize = a3;
}

- (double)defaultOuterDotDiameter
{
  return self->_defaultOuterDotDiameter;
}

- (void)setDefaultOuterDotDiameter:(double)a3
{
  self->_defaultOuterDotDiameter = a3;
}

- (double)defaultInnerDotDiameter
{
  return self->_defaultInnerDotDiameter;
}

- (void)setDefaultInnerDotDiameter:(double)a3
{
  self->_defaultInnerDotDiameter = a3;
}

@end
