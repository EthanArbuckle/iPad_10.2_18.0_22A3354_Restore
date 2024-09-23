@implementation UIScrollView(GKAdditions)

- (double)_gkPercentScrolled
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect v7;
  CGRect v8;

  objc_msgSend(a1, "contentSize");
  objc_msgSend(a1, "frame");
  CGRectGetHeight(v7);
  objc_msgSend(a1, "contentOffset");
  objc_msgSend(a1, "contentSize");
  v3 = v2;
  objc_msgSend(a1, "frame");
  v4 = v3 - CGRectGetWidth(v8);
  objc_msgSend(a1, "contentOffset");
  return v5 / v4;
}

@end
