@implementation _CCUIPositionRememberingSeparator

- (CGRect)cachedExpandedRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cachedExpandedRect.origin.x;
  y = self->_cachedExpandedRect.origin.y;
  width = self->_cachedExpandedRect.size.width;
  height = self->_cachedExpandedRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCachedExpandedRect:(CGRect)a3
{
  self->_cachedExpandedRect = a3;
}

@end
