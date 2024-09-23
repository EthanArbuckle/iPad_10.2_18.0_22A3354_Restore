@implementation UIColor(HUAdditions)

+ (uint64_t)hu_keyColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
}

+ (uint64_t)hu_mediaPlatterBackgroundColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0941176471, 0.04);
}

+ (uint64_t)hu_quickControlBackgroundGrayColor
{
  return objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", 0.937254902, 0.937254902, 0.956862745, 1.0);
}

+ (id)hu_homePodControlCellBackgroundColor
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;

  if (objc_msgSend(MEMORY[0x1E0D319D0], "shouldUseControlCenterMaterials"))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "userInterfaceStyle");

    if (v3 == 2)
      objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.15, 1.0);
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGroupedBackgroundColor");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

- (BOOL)isEqualToColor:()HUAdditions
{
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10);
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);

  return vabdd_f64(v13, v9) < 0.00000011920929
      && vabdd_f64(v12, v8) < 0.00000011920929
      && vabdd_f64(v11, v7) < 0.00000011920929
      && vabdd_f64(v10, v6) < 0.00000011920929;
}

@end
