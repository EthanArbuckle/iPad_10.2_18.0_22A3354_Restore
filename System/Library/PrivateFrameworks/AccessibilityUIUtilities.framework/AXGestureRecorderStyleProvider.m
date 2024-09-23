@implementation AXGestureRecorderStyleProvider

- (id)instructionsLabelFont
{
  return (id)objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
}

- (id)instructionsLabelTextColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
}

- (id)instructionsLabelBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
}

- (id)instructionsLabelShadowColor
{
  return 0;
}

- (CGSize)instructionsLabelShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)instructionsLabelHorizontalInset
{
  int IsPad;
  double result;

  IsPad = AXDeviceIsPad();
  result = 10.0;
  if (IsPad)
    return 30.0;
  return result;
}

- (id)gestureRecorderViewBackgroundColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (id)gestureRecorderViewBackgroundGradientTopColor
{
  void *v2;
  uint64_t v3;
  double v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    v4 = 0.90234375;
    v5 = 0.91015625;
    v6 = 0.92578125;
  }
  else
  {
    v4 = 0.800000012;
    v5 = 0.819999993;
    v6 = 0.839999974;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v4, v5, v6, 1.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)gestureRecorderViewBackgroundGradientBottomColor
{
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 == 1)
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.8515625, 0.859375, 0.875, 1.0);
  else
    -[AXGestureRecorderStyleProvider gestureRecorderViewBackgroundGradientTopColor](self, "gestureRecorderViewBackgroundGradientTopColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (double)minimumFingerLineWidth
{
  return 50.0;
}

- (double)maximumFingerLineWidth
{
  double v2;

  -[AXGestureRecorderStyleProvider minimumFingerLineWidth](self, "minimumFingerLineWidth");
  return v2 * 4.0;
}

- (id)tracingDynamicFingerColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemTealColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)finalDynamicFingerColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.196078431, 0.603921569, 1.0, 1.0);
}

- (id)staticFingerColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.721568627, 0.721568627, 0.721568627, 1.0);
}

- (id)fingerLineGradientTopColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.69921875, 0.70703125, 0.73828125, 1.0);
}

- (id)fingerLineGradientBottomColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.8125, 0.81640625, 0.8359375, 1.0);
}

- (float)fingerLineGradientTopColorLocation
{
  return 0.0;
}

- (float)fingerLineGradientBottomColorLocation
{
  return 0.8;
}

- (id)dynamicFingerLineGradientTopColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)dynamicFingerLineGradientBottomColor
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "colorWithAlphaComponent:", 0.8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)fingerLineOuterBevelColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
}

- (double)fingerLineOuterBevelWidth
{
  return 2.0;
}

- (double)dynamicFingerLineOuterBevelWidth
{
  return 1.0;
}

- (id)fingerLineDropDownShadowColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
}

- (CGSize)fingerLineDropDownShadowOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = 0.0;
  v3 = 1.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)fingerLineDropDownShadowRadius
{
  return 2.0;
}

- (double)fingerLineDropDownShadowOpacity
{
  return 0.5;
}

- (id)dynamicFingerLineDropDownShadowColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.65625, 0.65625, 0.65625, 1.0);
}

- (double)dynamicFingerLineDropDownShadowRadius
{
  return 3.0;
}

- (double)dynamicFingerLineDropDownShadowOpacity
{
  return 1.0;
}

@end
