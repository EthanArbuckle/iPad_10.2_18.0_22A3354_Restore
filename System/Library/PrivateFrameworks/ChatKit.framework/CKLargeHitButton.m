@implementation CKLargeHitButton

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
  -[CKLargeHitButton ck_hitTestInsets](self, "ck_hitTestInsets");
  if (v11 == *(double *)(MEMORY[0x1E0CEB4B0] + 8)
    && v8 == *MEMORY[0x1E0CEB4B0]
    && v10 == *(double *)(MEMORY[0x1E0CEB4B0] + 24)
    && v9 == *(double *)(MEMORY[0x1E0CEB4B0] + 16))
  {
    v32.receiver = self;
    v32.super_class = (Class)CKLargeHitButton;
    v29 = -[CKLargeHitButton pointInside:withEvent:](&v32, sel_pointInside_withEvent_, v7, x, y);
  }
  else
  {
    -[CKLargeHitButton bounds](self, "bounds");
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v22 = v21;
    -[CKLargeHitButton ck_hitTestInsets](self, "ck_hitTestInsets");
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

- (UIEdgeInsets)ck_hitTestInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_ck_hitTestInsets.top;
  left = self->_ck_hitTestInsets.left;
  bottom = self->_ck_hitTestInsets.bottom;
  right = self->_ck_hitTestInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setCk_hitTestInsets:(UIEdgeInsets)a3
{
  self->_ck_hitTestInsets = a3;
}

@end
