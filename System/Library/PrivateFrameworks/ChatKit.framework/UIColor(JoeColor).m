@implementation UIColor(JoeColor)

- (BOOL)ck_isVeryDark
{
  double v2;

  v2 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", 0, 0, &v2, 0);
  return v2 <= 0.1;
}

- (BOOL)ck_isVeryLight
{
  _BOOL8 result;
  double v2;
  double v3;
  double v4;

  v4 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v4, &v3, &v2, 0);
  result = 0;
  if (v4 >= 0.95 && v3 >= 0.95)
    return v2 >= 0.95;
  return result;
}

- (BOOL)ck_isCloseToColor:()JoeColor
{
  id v4;
  double v5;
  double v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;

  v13 = 0.0;
  v11 = 0.0;
  v12 = 0.0;
  v9 = 0.0;
  v10 = 0.0;
  v8 = 0.0;
  v4 = a3;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v13, &v12, &v11, 0);
  objc_msgSend(v4, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, 0);

  if (vabdd_f64(v12, v9) > 0.0399999991 || vabdd_f64(v11, v8) > 0.0399999991)
    return 0;
  v5 = v13;
  v6 = v10;
  if (vabdd_f64(v13, v10) <= 0.0399999991)
    return 1;
  if (v13 < 0.0399999991)
    v5 = v13 + 1.0;
  if (v10 < 0.0399999991)
    v6 = v10 + 1.0;
  return vabdd_f64(v5, v6) <= 0.0399999991;
}

@end
