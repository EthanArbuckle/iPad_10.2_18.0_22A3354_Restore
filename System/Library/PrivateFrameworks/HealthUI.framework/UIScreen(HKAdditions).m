@implementation UIScreen(HKAdditions)

+ (BOOL)hk_currentDeviceHas4InchScreen
{
  return objc_msgSend(MEMORY[0x1E0DC3BF8], "_screenHeightSizeClassForCurrentDevice") == 0;
}

+ (uint64_t)_screenHeightSizeClassForCurrentDevice
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  uint64_t v8;

  v2 = (void *)objc_opt_class();
  objc_msgSend(a1, "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nativeBounds");
  v5 = v4;
  objc_msgSend(a1, "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = objc_msgSend(v2, "screenHeightSizeClassForHeight:scale:", v5, v7);

  return v8;
}

+ (BOOL)hk_currentDeviceHas4Point7InchScreen
{
  return objc_msgSend(MEMORY[0x1E0DC3BF8], "_screenHeightSizeClassForCurrentDevice") == 1;
}

+ (BOOL)hk_currentDeviceHas5Point8InchScreen
{
  return objc_msgSend(MEMORY[0x1E0DC3BF8], "_screenHeightSizeClassForCurrentDevice") == 2;
}

+ (BOOL)hk_currentDeviceHasDisplayZoomedEnabled
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  _BOOL8 v7;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "scale");
  v4 = v3;
  objc_msgSend(a1, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v7 = v4 < v6;

  return v7;
}

@end
