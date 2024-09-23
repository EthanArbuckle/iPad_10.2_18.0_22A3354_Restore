@implementation UIColor(MediaControls)

- (uint64_t)secondaryColorForInterfaceStyle:()MediaControls
{
  return objc_msgSend(a1, "adjustedColorByScale:", dbl_1AAAD65F0[a3 == 2]);
}

- (uint64_t)tertiaryColorForInterfaceStyle:()MediaControls
{
  return objc_msgSend(a1, "adjustedColorByScale:", dbl_1AAAD6600[a3 == 2]);
}

- (id)adjustedColorByScale:()MediaControls
{
  id v4;
  double v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  if (objc_msgSend(a1, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", v9 + a2, v8 + a2, v7 + a2, v6);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = a1;
  }
  return v4;
}

@end
