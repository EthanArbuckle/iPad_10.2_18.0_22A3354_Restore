@implementation SFUnifiedTabBarItemViewCloseButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  BOOL v8;
  objc_super v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFUnifiedTabBarItemViewCloseButton;
  if (-[SFUnifiedTabBarItemViewCloseButton pointInside:withEvent:](&v10, sel_pointInside_withEvent_, v7, x, y))
  {
    if (objc_msgSend(v7, "buttonMask"))
      v8 = -[SFUnifiedTabBarItemViewCloseButton pointInsideForPointer:](self, "pointInsideForPointer:", x, y);
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)pointInsideForPointer:(CGPoint)a3
{
  double y;
  double x;
  SFUnifiedTabBarItemViewCloseButton *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGPoint v18;
  CGRect v19;

  y = a3.y;
  x = a3.x;
  v5 = self;
  -[SFUnifiedTabBarItemViewCloseButton _imageView](self, "_imageView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "convertPoint:fromView:", v5, x, y);
  v18.x = v15;
  v18.y = v16;
  v19.origin.x = v8;
  v19.origin.y = v10;
  v19.size.width = v12;
  v19.size.height = v14;
  LOBYTE(v5) = CGRectContainsPoint(v19, v18);

  return (char)v5;
}

@end
