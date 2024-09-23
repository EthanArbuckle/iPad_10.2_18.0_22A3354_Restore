@implementation UIScreen(HeartRhythmUI)

+ (BOOL)hrui_currentDeviceHas5Point8InchScreen
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeBounds");
  v4 = v3;
  objc_msgSend(a1, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v7 = v4 / v6;

  return v7 > 700.0;
}

+ (BOOL)hrui_currentDeviceHasSmallPhoneScreen
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeBounds");
  v4 = v3;
  objc_msgSend(a1, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v7 = v4 / v6;

  return v7 <= 320.0;
}

+ (BOOL)hrui_currentDeviceHasMediumPhoneScreen
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeBounds");
  v4 = v3;
  objc_msgSend(a1, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v7 = v4 / v6;

  return v7 <= 375.0 && v7 > 320.0;
}

+ (BOOL)hrui_currentDeviceHasLargePhoneScreen
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "nativeBounds");
  v4 = v3;
  objc_msgSend(a1, "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nativeScale");
  v7 = v4 / v6;

  return v7 > 375.0;
}

@end
