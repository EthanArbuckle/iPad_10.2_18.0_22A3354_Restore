@implementation UIColor(SCNAdditions)

+ (uint64_t)scn_colorWithC3DColor:()SCNAdditions
{
  CGColor *ExtendedSRGBWithC3DColor;
  uint64_t v4;

  if (!a3)
    return 0;
  ExtendedSRGBWithC3DColor = C3DCGColorCreateExtendedSRGBWithC3DColor(*(_QWORD *)a3, *(_QWORD *)(a3 + 8));
  v4 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", ExtendedSRGBWithC3DColor);
  CGColorRelease(ExtendedSRGBWithC3DColor);
  return v4;
}

+ (uint64_t)scn_colorWithModelIORed:()SCNAdditions green:blue:alpha:options:
{
  CGColorSpace *v4;
  CGColor *v5;
  CGColor *ExtendedSRGBWithCGColor;
  uint64_t v7;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v4 = (CGColorSpace *)C3DColorSpaceITUR_709();
  v5 = CGColorCreate(v4, components);
  ExtendedSRGBWithCGColor = C3DCGColorCreateExtendedSRGBWithCGColor(v5);
  v7 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", ExtendedSRGBWithCGColor);
  CGColorRelease(ExtendedSRGBWithCGColor);
  CGColorRelease(v5);
  return v7;
}

- (CGColor)scn_C3DColorIgnoringColorSpace:()SCNAdditions success:
{
  CGColor *result;
  CGColor *v7;

  result = (CGColor *)objc_msgSend(a1, "CGColor");
  v7 = result;
  if (result)
  {
    result = (CGColor *)C3DColor4WithCGColor(result, a3);
    if (!a4)
      return result;
  }
  else if (!a4)
  {
    return result;
  }
  *a4 = v7 != 0;
  return result;
}

+ (uint64_t)scn_colorWithLinearSRGBRed:()SCNAdditions green:blue:alpha:
{
  CGColorSpace *v4;
  CGColor *v5;
  uint64_t v6;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v4 = (CGColorSpace *)C3DColorSpaceLinearSRGB();
  v5 = CGColorCreate(v4, components);
  v6 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v5);
  CGColorRelease(v5);
  return v6;
}

+ (uint64_t)scn_colorWithLinearDisplayP3Red:()SCNAdditions green:blue:alpha:
{
  CGColorSpace *v4;
  CGColor *v5;
  uint64_t v6;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  v4 = (CGColorSpace *)C3DColorSpaceLinearDisplayP3();
  v5 = CGColorCreate(v4, components);
  v6 = objc_msgSend(MEMORY[0x1E0CEA478], "colorWithCGColor:", v5);
  CGColorRelease(v5);
  return v6;
}

- (double)scn_colorComponentsForModelIO
{
  return C3DCGColorGetITUR_709Components((CGColorRef)objc_msgSend(a1, "CGColor"));
}

@end
