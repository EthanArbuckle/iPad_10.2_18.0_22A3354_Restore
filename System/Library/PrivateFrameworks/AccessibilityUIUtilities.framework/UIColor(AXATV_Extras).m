@implementation UIColor(AXATV_Extras)

- (double)_atvaccessibilityAlphaComponent
{
  double v3;

  v3 = 1.0;
  if ((objc_msgSend(a1, "getWhite:alpha:", 0, &v3) & 1) == 0
    && (objc_msgSend(a1, "getHue:saturation:brightness:alpha:", 0, 0, 0, &v3) & 1) == 0)
  {
    objc_msgSend(a1, "getRed:green:blue:alpha:", 0, 0, 0, &v3);
  }
  return v3;
}

@end
