@implementation PHEdgeInsetButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  BOOL v29;
  BOOL v30;
  objc_super v32;
  CGPoint v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PHEdgeInsetButton touchAreaEdgeInsets](self, "touchAreaEdgeInsets");
  if (v11 == UIEdgeInsetsZero.left
    && v8 == UIEdgeInsetsZero.top
    && v10 == UIEdgeInsetsZero.right
    && v9 == UIEdgeInsetsZero.bottom)
  {
    v32.receiver = self;
    v32.super_class = (Class)PHEdgeInsetButton;
    v29 = -[PHEdgeInsetButton pointInside:withEvent:](&v32, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    -[PHEdgeInsetButton bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[PHEdgeInsetButton touchAreaEdgeInsets](self, "touchAreaEdgeInsets");
    v24 = v18 + v23;
    v27 = v20 - (v25 + v26);
    v34.size.height = v22 - (v23 + v28);
    v34.origin.x = v16 + v25;
    v34.origin.y = v24;
    v34.size.width = v27;
    v33.x = x;
    v33.y = y;
    v29 = CGRectContainsPoint(v34, v33);
  }
  v30 = v29;

  return v30;
}

- (UIEdgeInsets)touchAreaEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_touchAreaEdgeInsets.top;
  left = self->_touchAreaEdgeInsets.left;
  bottom = self->_touchAreaEdgeInsets.bottom;
  right = self->_touchAreaEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTouchAreaEdgeInsets:(UIEdgeInsets)a3
{
  self->_touchAreaEdgeInsets = a3;
}

@end
