@implementation UIColor(GKColorAdditions)

- (double)_gkLuminance
{
  id v1;
  CGColorSpace *ColorSpace;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  CGColorSpaceModel Model;
  double result;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v1 = objc_retainAutorelease(a1);
  ColorSpace = CGColorGetColorSpace((CGColorRef)objc_msgSend(v1, "CGColor"));
  if (!ColorSpace)
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Assertion failed"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKColorPalette.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPathComponent");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (colorSpace != ((void *)0))\n[%s (%s:%d)]"), v4, "-[UIColor(GKColorAdditions) _gkLuminance]", objc_msgSend(v6, "UTF8String"), 253);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v7);
  }
  v14 = 0.0;
  Model = CGColorSpaceGetModel(ColorSpace);
  if (Model == kCGColorSpaceModelRGB)
  {
    v12 = 0.0;
    v13 = 0.0;
    v10 = 0;
    v11 = 0.0;
    objc_msgSend(v1, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10);
    return v12 * 0.7152 + v13 * 0.2126 + v11 * 0.0722;
  }
  else
  {
    result = 0.0;
    if (Model == kCGColorSpaceModelMonochrome)
    {
      v13 = 0.0;
      objc_msgSend(v1, "getWhite:alpha:", &v14, &v13, 0.0);
      return v14;
    }
  }
  return result;
}

@end
