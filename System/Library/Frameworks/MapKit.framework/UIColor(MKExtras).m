@implementation UIColor(MKExtras)

+ (id)_maps_colorFromHexString:()MKExtras
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  double v13;
  void *v14;
  int v15;
  uint64_t v17;
  double v18;
  double v19;
  double v20;

  v4 = a3;
  v5 = v4;
  if (objc_msgSend(v4, "hasPrefix:", CFSTR("#")))
  {
    objc_msgSend(v4, "substringFromIndex:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v5, "length") != 6 && objc_msgSend(v5, "length") != 8)
    goto LABEL_13;
  v19 = 0.0;
  v20 = 0.0;
  v18 = 0.0;
  objc_msgSend(v5, "substringWithRange:", 0, 2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1, "_getColorComponent:fromSubString:", &v20, v6);

  v8 = 0;
  if (v7)
  {
    objc_msgSend(v5, "substringWithRange:", 2, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1, "_getColorComponent:fromSubString:", &v19, v9);

    if (v10)
    {
      objc_msgSend(v5, "substringWithRange:", 4, 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(a1, "_getColorComponent:fromSubString:", &v18, v11);

      if (v12)
      {
        if (objc_msgSend(v5, "length") != 8)
        {
          v17 = 0x3FF0000000000000;
          v13 = 1.0;
LABEL_12:
          objc_msgSend(MEMORY[0x1E0CEA478], "colorWithRed:green:blue:alpha:", v20, v19, v18, v13, v17);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        objc_msgSend(v5, "substringWithRange:", 6, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(a1, "_getColorComponent:fromSubString:", &v17, v14);

        if (v15)
        {
          v13 = *(double *)&v17;
          goto LABEL_12;
        }
      }
    }
LABEL_13:
    v8 = 0;
  }
LABEL_14:

  return v8;
}

+ (uint64_t)_getColorComponent:()MKExtras fromSubString:
{
  void *v5;
  uint64_t v6;
  unsigned int v8;

  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB3900], "scannerWithString:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scanHexInt:", &v8);

  if (a3 && (_DWORD)v6)
    *a3 = (float)((float)v8 / 255.0);
  return v6;
}

+ (uint64_t)_maps_getRed:()MKExtras green:blue:fromHue:saturation:value:
{
  double v12;
  double v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v12 = a2 * a3;
  v13 = a1 * 360.0 / 60.0;
  v14 = v13;
  v15 = fmodf(v14, 2.0) + -1.0;
  if (v15 < 0.0)
    v15 = -v15;
  v16 = v12 * (1.0 - v15);
  if (v13 < 1.0)
  {
    v17 = v12;
    v18 = v16;
LABEL_7:
    v16 = 0.0;
    goto LABEL_8;
  }
  if (v13 < 2.0)
  {
    v17 = v16;
    v18 = v12;
    goto LABEL_7;
  }
  v17 = 0.0;
  if (v13 < 3.0)
  {
    v18 = v12;
    goto LABEL_8;
  }
  if (v13 < 4.0)
  {
    v18 = v16;
LABEL_21:
    v16 = v12;
    goto LABEL_8;
  }
  v18 = 0.0;
  if (v13 < 5.0)
  {
    v17 = v16;
    goto LABEL_21;
  }
  v17 = v12;
  if (v13 >= 6.0)
    return 0;
LABEL_8:
  v19 = a3 - v12;
  if (a6)
    *a6 = v19 + v17;
  if (a7)
    *a7 = v19 + v18;
  if (a8)
    *a8 = v19 + v16;
  return 1;
}

- (id)_maps_hexString
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  float v5;
  uint64_t v6;
  float v7;
  float v8;
  float v9;
  void *v10;
  void *v11;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;

  v19 = 0.0;
  v20 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
  if ((objc_msgSend(a1, "getRed:green:blue:alpha:", &v20, &v19, &v18, &v17) & 1) == 0)
  {
    v16 = 0.0;
    if ((objc_msgSend(a1, "getWhite:alpha:", &v16, &v17) & 1) != 0)
    {
      v18 = v16;
      v19 = v16;
      v20 = v16;
    }
    else
    {
      v14 = 0.0;
      v15 = 0.0;
      v13 = 0.0;
      if (!objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v15, &v14, &v13, &v17)
        || (objc_msgSend(MEMORY[0x1E0CEA478], "_maps_getRed:green:blue:fromHue:saturation:value:", &v20, &v19, &v18, v15, v14, v13) & 1) == 0)
      {
        return 0;
      }
    }
  }
  v5 = v20;
  v6 = vcvtas_u32_f32(v5 * 255.0);
  v7 = v19;
  LODWORD(v2) = vcvtas_u32_f32(v7 * 255.0);
  v8 = v18;
  LODWORD(v3) = vcvtas_u32_f32(v8 * 255.0);
  v9 = v17;
  LODWORD(v4) = vcvtas_u32_f32(v9 * 255.0);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("#%.2x%.2x%.2x%.2x"), v6, v2, v3, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uppercaseString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
