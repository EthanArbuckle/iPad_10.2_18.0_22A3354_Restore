@implementation CAMPanoramaLabel

- (UIEdgeInsets)_textInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v2 = CAMPixelWidthForView(self);
  v3 = v2 * 2.0 + 2.0;
  v4 = 11.0;
  v5 = 10.0;
  v6 = v2 + 2.0;
  result.right = v5;
  result.bottom = v3;
  result.left = v4;
  result.top = v6;
  return result;
}

- (double)_backgroundAlpha
{
  return 0.3;
}

@end
