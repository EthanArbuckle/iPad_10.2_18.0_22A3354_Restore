@implementation UIView(SKExtensions)

- (BOOL)_sk_isAtLeast50PercentOnScreen
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  _BOOL8 v12;
  CGPoint v14;
  CGRect v15;

  objc_msgSend(a1, "center");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "convertPoint:fromView:", v7, v3, v5);
    v9 = v8;
    v11 = v10;

    objc_msgSend(v6, "bounds");
    v14.x = v9;
    v14.y = v11;
    v12 = CGRectContainsPoint(v15, v14);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

@end
