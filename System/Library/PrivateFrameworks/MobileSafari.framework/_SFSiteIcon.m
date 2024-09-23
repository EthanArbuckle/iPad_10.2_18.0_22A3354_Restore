@implementation _SFSiteIcon

+ (double)cornerRadius
{
  return 10.0;
}

+ (id)defaultIconKeyColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_56);
}

+ (double)labelWidthForIconSize:(int64_t)a3
{
  double result;

  result = 46.0;
  if (a3 != 1)
    result = 22.0;
  if (a3 == 2)
    return 56.0;
  return result;
}

+ (double)fontPointSizeForIconSize:(int64_t)a3
{
  double result;

  result = 37.0;
  if (a3 != 1)
    result = 18.0;
  if (a3 == 2)
    return 44.0;
  return result;
}

+ (CGSize)sizeForIconSize:(int64_t)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 32.0;
  if (a3 == 1)
    v3 = 60.0;
  if (a3 == 2)
    v3 = 76.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

+ (CGSize)minimumAcceptableSizeForDownloadedIcon
{
  double v2;
  double v3;
  CGSize result;

  v2 = 57.0;
  v3 = 57.0;
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)defaultSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(a1, "sizeForIconSize:", objc_msgSend(a1, "_defaultIconSize"));
  result.height = v3;
  result.width = v2;
  return result;
}

+ (int64_t)_defaultIconSize
{
  if (_SFDeviceIsPad())
    return 2;
  else
    return 1;
}

+ (id)defaultGlyph
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "fontPointSizeForIconSize:", objc_msgSend(a1, "_defaultIconSize"));
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 3, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("safari"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "flattenedImageWithColor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "imageWithRenderingMode:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)precompositedDefaultIcon
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39___SFSiteIcon_precompositedDefaultIcon__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (precompositedDefaultIcon_onceToken != -1)
    dispatch_once(&precompositedDefaultIcon_onceToken, block);
  return (id)precompositedDefaultIcon_icon;
}

@end
