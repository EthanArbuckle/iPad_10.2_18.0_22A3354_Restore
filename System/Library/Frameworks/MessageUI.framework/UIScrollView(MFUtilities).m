@implementation UIScrollView(MFUtilities)

- (double)mf_visibleFrame
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "frame");
  v3 = v2;
  objc_msgSend(a1, "contentInset");
  return v3 + v4;
}

- (double)mf_visibleBounds
{
  double v2;
  double v3;
  double v4;

  objc_msgSend(a1, "bounds");
  v3 = v2;
  objc_msgSend(a1, "contentInset");
  return v3 + v4;
}

- (double)mf_visibleHeight
{
  CGRect v2;

  objc_msgSend(a1, "mf_visibleFrame");
  return CGRectGetHeight(v2);
}

- (double)mf_minContentOffset
{
  double v2;
  double v3;

  objc_msgSend(a1, "contentInset");
  v3 = -v2;
  objc_msgSend(a1, "contentInset");
  return v3;
}

- (double)mf_maxContentOffset
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect v8;
  CGRect v9;

  objc_msgSend(a1, "contentSize");
  v3 = v2;
  objc_msgSend(a1, "bounds");
  v4 = v3 - CGRectGetWidth(v8);
  objc_msgSend(a1, "contentInset");
  v6 = v4 + v5;
  objc_msgSend(a1, "contentSize");
  objc_msgSend(a1, "bounds");
  CGRectGetHeight(v9);
  objc_msgSend(a1, "contentInset");
  return v6;
}

@end
