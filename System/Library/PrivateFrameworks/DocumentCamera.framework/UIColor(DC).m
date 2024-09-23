@implementation UIColor(DC)

+ (id)dc_darkerAccessibilityColorForColor:()DC
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v7, v6, v5 * 0.8, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)colorInBundleWithName:()DC
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "colorNamed:inBundle:compatibleWithTraitCollection:", v4, v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)DCExtractedDocumentViewControllerBackgroundColor
{
  return objc_msgSend(a1, "colorInBundleWithName:", CFSTR("extracted_document_background_color"));
}

+ (id)dc_barColor
{
  void *v2;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "colorInBundleWithName:", CFSTR("bar_color"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)dc_editBackgroundColor
{
  void *v2;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "colorInBundleWithName:", CFSTR("edit_background_color"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

+ (id)dc_labelBackgroundColor
{
  void *v2;

  if ((DCDebugInterfaceEnabled() & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(a1, "colorInBundleWithName:", CFSTR("label_background_color"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)dc_lighterColor
{
  double v2;
  uint64_t v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0;
  v4 = 0.0;
  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v5, &v4, &v3, &v2);
  objc_msgSend(MEMORY[0x24BDF6950], "colorWithHue:saturation:brightness:alpha:", v5, v4, 1.0, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)dc_colorIsLight
{
  const CGFloat *Components;

  Components = CGColorGetComponents((CGColorRef)objc_msgSend(objc_retainAutorelease(a1), "CGColor"));
  return (Components[1] * 587.0 + *Components * 299.0 + Components[2] * 114.0) / 1000.0 > 0.5;
}

@end
