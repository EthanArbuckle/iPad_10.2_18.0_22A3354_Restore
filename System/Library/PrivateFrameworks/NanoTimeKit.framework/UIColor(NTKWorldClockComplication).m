@implementation UIColor(NTKWorldClockComplication)

+ (id)ntk_wc_defaultSolarGradientColors
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[4];

  v5[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.192156863, 0.415686275, 0.831372549, 1.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.215686275, 0.623529412, 0.878431373, 1.0, v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.31372549, 0.678431373, 0.823529412, 1.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (uint64_t)ntk_wc_sunYellowColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 1.0, 0.917647059, 0.2, 1.0);
}

@end
