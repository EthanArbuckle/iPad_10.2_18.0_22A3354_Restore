@implementation AVLabel

- (void)setContentIntersection:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_contentIntersection;
  double v9;
  double v10;
  unint64_t v11;
  _BOOL4 v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_contentIntersection = &self->_contentIntersection;
  if (!CGRectEqualToRect(self->_contentIntersection, a3))
  {
    p_contentIntersection->origin.x = x;
    p_contentIntersection->origin.y = y;
    p_contentIntersection->size.width = width;
    p_contentIntersection->size.height = height;
    -[AVLabel bounds](self, "bounds");
    v11 = (unint64_t)(COERCE__INT64(fabs(v9 * v10)) - 0x10000000000000) >> 53;
    v14 = (COERCE__INT64(v9 * v10) >= 0 && v11 <= 0x3FE
        || (unint64_t)(COERCE__INT64(v9 * v10) - 1) <= 0xFFFFFFFFFFFFELL)
       && p_contentIntersection->size.height * p_contentIntersection->size.width / (v9 * v10) > 0.5;
    if (self->_labelIsOverVideo != v14)
    {
      self->_labelIsOverVideo = v14;
      -[AVLabel setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2 * self->_labelIsOverVideo);
    }
  }
}

- (CGRect)contentIntersection
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_contentIntersection.origin.x;
  y = self->_contentIntersection.origin.y;
  width = self->_contentIntersection.size.width;
  height = self->_contentIntersection.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

@end
