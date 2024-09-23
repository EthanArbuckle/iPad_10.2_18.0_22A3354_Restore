@implementation UIColor(CKUtilities)

- (id)colorByBlendingWithColor:()CKUtilities
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
  v4 = a3;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v13, &v12, &v11, &v10);
  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(v4, "getRed:green:blue:alpha:", &v9, &v8, &v7, &v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", (1.0 - v6) * (v13 * v10) + v9 * v6, (1.0 - v6) * (v10 * v12) + v8 * v6, (1.0 - v6) * (v10 * v11) + v7 * v6, v6 + v10 * (1.0 - v6));
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)colorByBlendingWithColor:()CKUtilities withFraction:
{
  id v6;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v15 = 0.0;
  v13 = 0.0;
  v14 = 0.0;
  v12 = 0.0;
  v6 = a4;
  objc_msgSend(a1, "getRed:green:blue:alpha:", &v15, &v14, &v13, &v12);
  v10 = 0.0;
  v11 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  objc_msgSend(v6, "getRed:green:blue:alpha:", &v11, &v10, &v9, &v8);

  objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v11 * a2 + (1.0 - a2) * v15, v10 * a2 + (1.0 - a2) * v14, v9 * a2 + (1.0 - a2) * v13, v8 * a2 + (1.0 - a2) * v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
