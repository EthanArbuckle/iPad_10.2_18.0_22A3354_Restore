@implementation UIColor(MobileSafariExtras)

+ (id)sf_colorNamed:()MobileSafariExtras
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0CB34D0];
  v5 = a3;
  objc_msgSend(v4, "sf_mobileSafariFrameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "colorNamed:inBundle:compatibleWithTraitCollection:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (uint64_t)sf_safariAccentColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("AccentColor"));
}

+ (uint64_t)sf_transparentBarHairlineColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("TransparentBarHairlineColor"));
}

- (uint64_t)sf_isDarkColor
{
  uint64_t result;
  double v2;

  v2 = 0.0;
  LODWORD(result) = objc_msgSend(a1, "getWhite:alpha:", &v2, 0);
  if (v2 < 0.6)
    return result;
  else
    return 0;
}

+ (id)sf_alternateLabelColor
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)sf_alternateLabelColor_alternateLabelColor;
  if (!sf_alternateLabelColor_alternateLabelColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    dynamicAlteranteColor(v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sf_alternateLabelColor_alternateLabelColor;
    sf_alternateLabelColor_alternateLabelColor = v2;

    v0 = (void *)sf_alternateLabelColor_alternateLabelColor;
  }
  return v0;
}

+ (uint64_t)sf_barHairlineShadowColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_19);
}

+ (uint64_t)sf_separateTabBarHighlightColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("SeparateTabBarHighlightColor"));
}

+ (uint64_t)sf_defaultWebContentBackgroundColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("DefaultWebContentBackground"));
}

+ (uint64_t)sf_barHairlineOutlineColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("BarHairlineOutlineColor"));
}

+ (uint64_t)sf_secondaryBarHairlineOutlineColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("SecondaryBarHairlineOutlineColor"));
}

+ (uint64_t)sf_tabSeparatorColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("TabSeparatorColor"));
}

+ (id)sf_alternateSecondaryLabelColor
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor;
  if (!sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    dynamicAlteranteColor(v1);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor;
    sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor = v2;

    v0 = (void *)sf_alternateSecondaryLabelColor_alternateSecondaryLabelColor;
  }
  return v0;
}

- (id)sf_darkenedColor
{
  id v2;
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * 0.75, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)sf_slightlyDarkenedColor
{
  id v2;
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * 0.9, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)sf_brightenedColor
{
  id v2;
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * 1.25, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)sf_muchBrightenedColor
{
  id v2;
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * 1.5, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

- (id)sf_muchDarkenedColor
{
  id v2;
  double v4;
  double v5;
  double v6;
  double v7;

  v6 = 0.0;
  v7 = 0.0;
  v4 = 0.0;
  v5 = 0.0;
  if ((objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4) & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * 0.5, v4);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = a1;
  }
  return v2;
}

+ (id)safari_labelColorFromNumber:()MobileSafariExtras
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "integerValue");
  if (v3 == 2)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3)
      objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (uint64_t)safari_scribbleThemeColor
{
  return objc_msgSend(a1, "sf_colorNamed:", CFSTR("ScribbleThemeColor"));
}

@end
