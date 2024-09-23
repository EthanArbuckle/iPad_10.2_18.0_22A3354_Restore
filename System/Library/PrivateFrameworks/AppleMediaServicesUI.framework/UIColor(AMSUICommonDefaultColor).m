@implementation UIColor(AMSUICommonDefaultColor)

+ (id)ams_dim
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, 0.6);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithWhite:alpha:", 0.0, 0.6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ams_mediaBorder
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "colorWithWhite:alpha:", 0.0, 0.08);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorWithWhite:alpha:", 1.0, 0.08);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)ams_shadow
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "systemGray4Color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "blackColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "ams_dynamicColorWithLightColor:darkColor:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
