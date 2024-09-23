@implementation UIColor(ITKUtilities)

+ (uint64_t)itk_randomColor
{
  double v0;
  double v1;

  v0 = (double)arc4random_uniform(0xFFu) / 255.0;
  v1 = (double)arc4random_uniform(0xFFu) / 255.0;
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", v0, v1, (double)arc4random_uniform(0xFFu) / 255.0, 1.0);
}

- (uint64_t)itk_colorWith20PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.2);
}

- (uint64_t)itk_colorWith40PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.4);
}

- (uint64_t)itk_colorWith60PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.6);
}

- (uint64_t)itk_colorWith80PercentOpacity
{
  return objc_msgSend(a1, "colorWithAlphaComponent:", 0.8);
}

- (id)itk_colorWithMaxSaturation
{
  double v2;
  double v3;
  uint64_t v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0;
  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v5, &v4, &v3, &v2);
  objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithHue:saturation:brightness:alpha:", v5, 1.0, v3, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (uint64_t)itk_resolvedColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithCGColor:", objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
}

+ (uint64_t)itk_labelColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "labelColor");
}

+ (uint64_t)itk_secondaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "secondaryLabelColor");
}

+ (uint64_t)itk_tertiaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "tertiaryLabelColor");
}

+ (uint64_t)itk_quaternaryLabelColor
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "quaternaryLabelColor");
}

+ (uint64_t)itk_colorWith256Red:()ITKUtilities green:blue:alpha:
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", a1 / 255.0, a2 / 255.0, a3 / 255.0, a4 / 255.0);
}

+ (uint64_t)itk_colorWith256Red:()ITKUtilities green:blue:unitAlpha:
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", a1 / 255.0, a2 / 255.0, a3 / 255.0);
}

@end
