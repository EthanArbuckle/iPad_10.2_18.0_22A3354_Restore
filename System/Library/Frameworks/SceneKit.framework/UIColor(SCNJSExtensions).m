@implementation UIColor(SCNJSExtensions)

+ (uint64_t)color:()SCNJSExtensions :::
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:");
}

- (double)r
{
  return COERCE_FLOAT(objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0));
}

- (double)g
{
  return COERCE_FLOAT((unint64_t)objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0) >> 32);
}

- (double)b
{
  float v1;

  objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  return v1;
}

- (double)a
{
  float v1;

  objc_msgSend(a1, "scn_C3DColorIgnoringColorSpace:success:", 0, 0);
  return v1;
}

@end
