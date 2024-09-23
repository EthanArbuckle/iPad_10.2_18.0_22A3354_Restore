@implementation HKSleepSomnogramBar

- (HKSleepSomnogramBar)initWithBarRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  CGFloat x;
  HKSleepSomnogramBar *result;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)HKSleepSomnogramBar;
  result = -[HKSleepSomnogramBar init](&v8, sel_init);
  if (result)
  {
    result->_barRect.origin.y = y;
    result->_barRect.size.width = width;
    result->_barRect.size.height = height;
    result->_top = y;
    result->_bottom = y + height;
    result->_left = x;
    result->_right = x + width;
    result->_horizontalMidpoint = x + width * 0.5;
    result->_barRect.origin.x = x;
  }
  return result;
}

- (CGRect)barRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_barRect.origin.x;
  y = self->_barRect.origin.y;
  width = self->_barRect.size.width;
  height = self->_barRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)top
{
  return self->_top;
}

- (double)bottom
{
  return self->_bottom;
}

- (double)left
{
  return self->_left;
}

- (double)right
{
  return self->_right;
}

- (double)horizontalMidpoint
{
  return self->_horizontalMidpoint;
}

@end
