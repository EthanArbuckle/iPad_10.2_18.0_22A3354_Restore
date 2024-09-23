@implementation NTKAdjustableTapTargetButton

- (NTKAdjustableTapTargetButton)initWithFrame:(CGRect)a3
{
  NTKAdjustableTapTargetButton *result;
  __int128 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NTKAdjustableTapTargetButton;
  result = -[NTKAdjustableTapTargetButton initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    v4 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
    *(_OWORD *)&result->_touchEdgeInsets.top = *MEMORY[0x1E0DC49E8];
    *(_OWORD *)&result->_touchEdgeInsets.bottom = v4;
  }
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  double top;
  double left;
  double v9;
  double v10;
  double v11;
  double v12;
  CGPoint v14;
  CGRect v15;

  y = a3.y;
  x = a3.x;
  -[NTKAdjustableTapTargetButton bounds](self, "bounds", a4);
  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  v15.origin.x = v9 + left;
  v15.origin.y = v10 + top;
  v15.size.width = v11 - (left + self->_touchEdgeInsets.right);
  v15.size.height = v12 - (top + self->_touchEdgeInsets.bottom);
  v14.x = x;
  v14.y = y;
  return CGRectContainsPoint(v15, v14);
}

- (UIEdgeInsets)touchEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchEdgeInsets.top;
  left = self->_touchEdgeInsets.left;
  bottom = self->_touchEdgeInsets.bottom;
  right = self->_touchEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchEdgeInsets = a3;
}

@end
