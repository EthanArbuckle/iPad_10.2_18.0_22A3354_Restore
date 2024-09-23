@implementation JFXOverlayEffectDebugViewRect

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

- (double)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(double)a3
{
  self->_borderWidth = a3;
}

- (UIColor)borderColor
{
  return self->_borderColor;
}

- (void)setBorderColor:(id)a3
{
  objc_storeStrong((id *)&self->_borderColor, a3);
}

- (BOOL)ignoreTransform
{
  return self->_ignoreTransform;
}

- (void)setIgnoreTransform:(BOOL)a3
{
  self->_ignoreTransform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_borderColor, 0);
}

@end
