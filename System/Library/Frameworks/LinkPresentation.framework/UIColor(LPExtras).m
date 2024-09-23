@implementation UIColor(LPExtras)

- (uint64_t)_lp_CSSText
{
  return objc_msgSend(a1, "_lp_CSSTextHexFormatForcingUserInterfaceStyle:", 0);
}

+ (id)_lp_colorWithDynamicProvider:()LPExtras name:
{
  id v5;
  void *v6;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "_setDebugName:", v5);

  return v6;
}

+ (id)_lp_colorWithDynamicProvider:()LPExtras
{
  objc_msgSend(a1, "_lp_colorWithDynamicProvider:name:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lp_CSSTextForcingUserInterfaceStyle:()LPExtras
{
  void *v1;
  float v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  float v6;
  uint64_t v7;
  unint64_t v8;
  float v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v13;
  double v14;
  double v15;
  double v16;

  v15 = 0.0;
  v16 = 0.0;
  v13 = 0;
  v14 = 0.0;
  objc_msgSend(a1, "_lp_colorForcingUserInterfaceStyle:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);

  v2 = v16 * 255.0;
  v3 = llroundf(v2);
  v4 = v3 & ~(v3 >> 63);
  v5 = 255;
  if (v4 >= 0xFF)
    v4 = 255;
  v6 = v15 * 255.0;
  v7 = llroundf(v6);
  v8 = v7 & ~(v7 >> 63);
  if (v8 >= 0xFF)
    v8 = 255;
  v9 = v14 * 255.0;
  v10 = llroundf(v9);
  v11 = v10 & ~(v10 >> 63);
  if (v11 < 0xFF)
    v5 = v11;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("rgba(%d, %d, %d, %g)"), v4, v8, v5, v13);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lp_CSSTextHexFormatForcingUserInterfaceStyle:()LPExtras
{
  void *v1;
  double v2;
  float v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  float v7;
  uint64_t v8;
  unint64_t v9;
  float v10;
  uint64_t v11;
  unint64_t v12;
  double v14;
  double v15;
  double v16;
  double v17;

  v16 = 0.0;
  v17 = 0.0;
  v14 = 0.0;
  v15 = 0.0;
  objc_msgSend(a1, "_lp_colorForcingUserInterfaceStyle:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "getRed:green:blue:alpha:", &v17, &v16, &v15, &v14);

  v2 = -0.0;
  if (v14 != 1.0)
    v2 = 1.0 - v14;
  v3 = (v17 + v2) * 255.0;
  v4 = llroundf(v3);
  v5 = v4 & ~(v4 >> 63);
  v6 = 255;
  if (v5 >= 0xFF)
    v5 = 255;
  v7 = (v16 + v2) * 255.0;
  v8 = llroundf(v7);
  v9 = v8 & ~(v8 >> 63);
  if (v9 >= 0xFF)
    v9 = 255;
  v10 = (v15 + v2) * 255.0;
  v11 = llroundf(v10);
  v12 = v11 & ~(v11 >> 63);
  if (v12 < 0xFF)
    v6 = v12;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%02X%02X%02X"), v5, v9, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lp_colorForcingUserInterfaceStyle:()LPExtras
{
  uint64_t v4;
  void *v5;
  void *v6;

  if (a3 == 1)
    v4 = 2;
  else
    v4 = 1;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resolvedColorWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (uint64_t)_lp_quinaryLabelColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
}

+ (uint64_t)_lp_systemFillColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemFillColor");
}

+ (uint64_t)_lp_secondarySystemFillColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemFillColor");
}

- (id)_lp_colorBlendedWithColor:()LPExtras
{
  objc_msgSend(a1, "_colorBlendedWithColor:");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_lp_colorBlendedWithColor:()LPExtras withFraction:
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  objc_msgSend(a1, "colorWithAlphaComponent:", 1.0 - a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_lp_colorBlendedWithColor:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
