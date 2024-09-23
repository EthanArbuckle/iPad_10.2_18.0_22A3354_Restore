@implementation CUINamedLayerImage

- (CUINamedLayerImage)initWithName:(id)a3 usingRenditionKey:(id)a4 fromTheme:(unint64_t)a5
{
  CUINamedLayerImage *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUINamedLayerImage;
  result = -[CUINamedImage initWithName:usingRenditionKey:fromTheme:](&v6, sel_initWithName_usingRenditionKey_fromTheme_, a3, a4, a5);
  if (result)
  {
    result->_opacity = 1.0;
    result->_blendMode = 0;
  }
  return result;
}

- (double)opacity
{
  double v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUINamedLayerImage;
  -[CUINamedImage opacity](&v5, sel_opacity);
  return v3 * self->_opacity;
}

- (int)blendMode
{
  int result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CUINamedLayerImage;
  result = -[CUINamedImage blendMode](&v4, sel_blendMode);
  if (self->_blendMode > 0)
    return self->_blendMode;
  return result;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->_frame = a3;
}

- (void)setOpacity:(double)a3
{
  self->_opacity = a3;
}

- (void)setBlendMode:(int)a3
{
  self->_blendMode = a3;
}

- (BOOL)fixedFrame
{
  return self->_fixedFrame;
}

- (void)setFixedFrame:(BOOL)a3
{
  self->_fixedFrame = a3;
}

@end
