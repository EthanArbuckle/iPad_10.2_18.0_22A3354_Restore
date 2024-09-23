@implementation HKAdjustableTapTargetButton

- (void)setHitTargetInsets:(UIEdgeInsets)a3
{
  self->_insetSet = 1;
  self->_hitTargetInsets = a3;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double top;
  double left;
  CGPoint v14;

  y = a3.y;
  x = a3.x;
  -[HKAdjustableTapTargetButton bounds](self, "bounds", a4);
  if (self->_insetSet)
  {
    top = self->_hitTargetInsets.top;
    left = self->_hitTargetInsets.left;
    v7 = v7 + left;
    v8 = v8 + top;
    v9 = v9 - (left + self->_hitTargetInsets.right);
    v10 = v10 - (top + self->_hitTargetInsets.bottom);
  }
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(*(CGRect *)&v7, v14);
}

- (UIEdgeInsets)hitTargetInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitTargetInsets.top;
  left = self->_hitTargetInsets.left;
  bottom = self->_hitTargetInsets.bottom;
  right = self->_hitTargetInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

@end
