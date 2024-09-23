@implementation UIColor(UIColor)

- (float)componentRGBA
{
  int v3;
  float result;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;

  v9 = 0.0;
  v7 = 0;
  v8 = 0;
  v5 = 0.0;
  v6 = 0;
  if (objc_msgSend(a1, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6))
  {
    return v9;
  }
  else
  {
    v3 = objc_msgSend(a1, "getWhite:alpha:", &v5, &v6);
    result = 0.0;
    if (!v3)
      return result;
    return v5;
  }
}

- (__n64)vectorRGBA
{
  unsigned __int32 v1;
  __n64 result;

  objc_msgSend(a1, "componentRGBA");
  result.n64_u32[1] = v1;
  return result;
}

+ (uint64_t)colorWithVectorRGBA:()UIColor
{
  LODWORD(a2) = a1.n128_u32[1];
  LODWORD(a3) = a1.n128_u32[2];
  LODWORD(a4) = a1.n128_u32[3];
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithComponentRGBA:", a1.n128_f64[0], a2, a3, a4);
}

+ (uint64_t)colorWithComponentRGBA:()UIColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", a1, a2, a3, a4);
}

- (double)red
{
  float v1;

  objc_msgSend(a1, "componentRGBA");
  return v1;
}

- (double)green
{
  float v1;

  objc_msgSend(a1, "componentRGBA");
  return v1;
}

- (double)blue
{
  float v1;

  objc_msgSend(a1, "componentRGBA");
  return v1;
}

- (double)alpha
{
  float v1;

  objc_msgSend(a1, "componentRGBA");
  return v1;
}

@end
