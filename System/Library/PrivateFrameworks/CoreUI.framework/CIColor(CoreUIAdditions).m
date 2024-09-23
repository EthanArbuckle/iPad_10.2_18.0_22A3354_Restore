@implementation CIColor(CoreUIAdditions)

+ (CIColor)colorWithSRGBRed:()CoreUIAdditions green:blue:alpha:
{
  CGColorSpace *SRGB;
  CGColor *v9;
  CIColor *v10;
  CGFloat components[4];

  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v9 = CGColorCreate(SRGB, components);
  v10 = +[CIColor colorWithCGColor:](CIColor, "colorWithCGColor:", v9);
  CGColorRelease(v9);
  return v10;
}

+ (CIColor)colorWithSRGBRed:()CoreUIAdditions green:blue:
{
  CGColorSpace *SRGB;
  CGColor *v7;
  CIColor *v8;
  CGFloat components[4];

  SRGB = (CGColorSpace *)_CUIColorSpaceGetSRGB();
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = 1.0;
  v7 = CGColorCreate(SRGB, components);
  v8 = +[CIColor colorWithCGColor:](CIColor, "colorWithCGColor:", v7);
  CGColorRelease(v7);
  return v8;
}

@end
