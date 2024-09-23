@implementation UIImage(CarPlayUI)

- (BOOL)isSquared
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(a1, "size");
  v3 = v2;
  objc_msgSend(a1, "size");
  v5 = 1.0;
  if (v4 >= 1.0)
    v5 = v4;
  v6 = v3 / v5;
  return v6 <= 1.01999998 && v6 >= 0.980000019;
}

@end
