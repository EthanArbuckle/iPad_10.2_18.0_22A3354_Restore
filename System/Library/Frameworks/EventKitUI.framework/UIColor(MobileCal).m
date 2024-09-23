@implementation UIColor(MobileCal)

+ (uint64_t)tableViewBackgroundColorOpaque
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
}

- (double)hueComponent
{
  double v4;
  double v5;
  double result;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;

  if (!objc_msgSend(a1, "cgColor"))
    return 0.0;
  v17 = 0.0;
  v18 = 0.0;
  v15 = 0;
  v16 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v18, &v17, &v16, &v15);
  if (v18 < v17 || v18 < v16)
  {
    if (v17 < v18 || v17 < v16)
    {
      if (v17 >= v18)
        v4 = v18;
      else
        v4 = v17;
      v5 = v16;
    }
    else
    {
      if (v18 >= v16)
        v4 = v16;
      else
        v4 = v18;
      v5 = v17;
    }
  }
  else
  {
    if (v17 >= v16)
      v4 = v16;
    else
      v4 = v17;
    v5 = v18;
  }
  result = 0.0;
  if (v5 > 0.0 && v5 != v4)
  {
    v8 = (v5 - v18) / (v5 - v4);
    v9 = 5.0 - v8;
    v10 = (v5 - v17) / (v5 - v4);
    if (v4 == v18)
      v9 = v10 + 3.0;
    v11 = (v5 - v16) / (v5 - v4);
    v12 = 3.0 - v11;
    v13 = v8 + 1.0;
    if (v4 == v16)
      v12 = v13;
    if (v5 != v17)
      v12 = v9;
    v14 = v11 + 5.0;
    if (v4 != v17)
      v14 = 1.0 - v10;
    if (v5 != v18)
      v14 = v12;
    return v14 / 6.0;
  }
  return result;
}

- (double)saturationComponent
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double result;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;

  v12 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  v9 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);
  if (v12 >= v11)
    v1 = v12;
  else
    v1 = v11;
  if (v1 < v10)
    v1 = v10;
  v2 = v12 / v1;
  v3 = v11 / v1;
  v4 = v10 / v1;
  if (v2 <= v3)
    v5 = v2;
  else
    v5 = v3;
  if (v2 < v3)
    v2 = v3;
  if (v5 <= v4)
    v6 = v5;
  else
    v6 = v4;
  if (v2 >= v4)
    v4 = v2;
  result = 0.0;
  if (v6 != v4)
  {
    v8 = v4 - v6;
    if ((v6 + v4) * 0.5 >= 0.5)
      return v8 / (2.0 - v4 - v6);
    else
      return v8 / (v6 + v4);
  }
  return result;
}

- (double)brightnessComponent
{
  double result;
  uint64_t v2;
  double v3;
  double v4;
  double v5;

  v5 = 0.0;
  v3 = 0.0;
  v4 = 0.0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  result = v5;
  if (v5 < v4)
    result = v4;
  if (result < v3)
    return v3;
  return result;
}

- (double)redComponent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;

  v5 = 0.0;
  v3 = 0;
  v4 = 0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  return v5;
}

- (double)greenComponent
{
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0;
  v4 = 0.0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  return v4;
}

- (double)blueComponent
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  uint64_t v5;

  v5 = 0;
  v3 = 0.0;
  v4 = 0;
  v2 = 0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v5, &v4, &v3, &v2);
  return v3;
}

- (double)differenceFromColor:()MobileCal
{
  id v4;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;

  v12 = 0.0;
  v13 = 0.0;
  v10 = 0;
  v11 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10);
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0;
  v7 = 0.0;
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);

  return vabdd_f64(v13, v9) + vabdd_f64(v12, v8) + vabdd_f64(v11, v7);
}

- (BOOL)isGreenOrYellow
{
  double v1;

  objc_msgSend(a1, "hueComponent");
  if (v1 >= 0.13 && v1 <= 0.18)
    return 1;
  if (v1 <= 0.35)
    return v1 >= 0.25;
  return 0;
}

- (uint64_t)soverWithColor:()MobileCal
{
  return CUIKBlendColorsSourceOver();
}

- (id)ek_blendWithColor:()MobileCal
{
  id v4;
  double v5;
  id v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v14 = 0.0;
  v15 = 0.0;
  v12 = 0.0;
  v13 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);

  v5 = (1.0 - v8) * v12;
  if (v8 + v5 <= 0.0)
  {
    v6 = a1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (v8 * v11 + v15 * v5) / (v8 + v5), (v8 * v10 + v14 * v5) / (v8 + v5), (v8 * v9 + v13 * v5) / (v8 + v5));
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)overlayWithColor:()MobileCal
{
  id v4;
  double v5;
  double v6;
  double v7;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;

  v15 = 0.0;
  v16 = 0.0;
  v13 = 0;
  v14 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v16, &v15, &v14, &v13);
  v11 = 0.0;
  v12 = 0.0;
  v9 = 0;
  v10 = 0.0;
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v12, &v11, &v10, &v9);

  if (v16 >= 0.5)
    v5 = (1.0 - v16) * (1.0 - v12) / -0.498039215 + 1.0;
  else
    v5 = v16 * v12 / 0.498039215;
  v16 = v5;
  if (v15 >= 0.5)
    v6 = (1.0 - v15) * (1.0 - v11) / -0.498039215 + 1.0;
  else
    v6 = v15 * v11 / 0.498039215;
  v15 = v6;
  if (v14 >= 0.5)
    v7 = (1.0 - v14) * (1.0 - v10) / -0.498039215 + 1.0;
  else
    v7 = v14 * v10 / 0.498039215;
  v14 = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:");
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
