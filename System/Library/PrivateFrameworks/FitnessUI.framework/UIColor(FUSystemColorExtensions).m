@implementation UIColor(FUSystemColorExtensions)

+ (uint64_t)fu_systemRedColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 1.0, 0.231372549, 0.188235294, 1.0);
}

+ (uint64_t)fu_systemYellowColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 1.0, 0.901960784, 0.125490196, 1.0);
}

+ (uint64_t)fu_systemMintColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.0, 0.960784314, 0.917647059, 1.0);
}

+ (uint64_t)fu_systemBlueColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.125490196, 0.580392157, 0.980392157, 1.0);
}

+ (uint64_t)fu_systemGreenColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.0156862745, 0.870588235, 0.443137255, 1.0);
}

+ (uint64_t)fu_systemOrangeColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 1.0, 0.584313725, 0.0, 1.0);
}

+ (uint64_t)fu_systemPinkColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.980392157, 0.0666666667, 0.309803922, 1.0);
}

+ (uint64_t)fu_systemPurpleColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.411764706, 0.37254902, 1.0, 1.0);
}

+ (uint64_t)fu_systemGreyColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.607843137, 0.62745098, 0.666666667, 1.0);
}

+ (uint64_t)fu_systemTealBlueColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.352941176, 0.784313725, 0.980392157, 1.0);
}

+ (uint64_t)fu_systemTextGreyColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.682352941, 0.705882353, 0.749019608, 1.0);
}

+ (uint64_t)fu_platterWhiteColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.949019608, 0.956862745, 0.988235294, 0.14);
}

+ (id)fu_platterBlueColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemBlueColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterGreenColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemGreenColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterOrangeColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemOrangeColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterRedColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemRedColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterYellowColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemYellowColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.14);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterPinkColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemPinkColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterPurpleColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemPurpleColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (uint64_t)fu_platterDaliTealColor
{
  return objc_msgSend(a1, "colorWithRed:green:blue:alpha:", 0.0, 0.819607843, 0.807843137, 0.15);
}

+ (id)fu_platterTealBlueColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemTealBlueColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.15);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)fu_platterMintColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "fu_systemMintColor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "colorWithAlphaComponent:", 0.2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
