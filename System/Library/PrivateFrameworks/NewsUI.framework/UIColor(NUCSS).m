@implementation UIColor(NUCSS)

- (id)nu_colorToCSSRGBA
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v4 = 0.0;
  v5 = 0.0;
  v3 = 0.0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("rgba(%.0f, %.0f, %.0f, %.0f)"), v5 * 255.0, v4 * 255.0, v3 * 255.0, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
