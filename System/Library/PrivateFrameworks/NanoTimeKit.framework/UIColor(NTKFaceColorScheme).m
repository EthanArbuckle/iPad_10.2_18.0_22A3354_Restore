@implementation UIColor(NTKFaceColorScheme)

- (uint64_t)ntk_colorWithLightness:()NTKFaceColorScheme
{
  CLKUIConvertToRGBfFromUIColor();
  CLKUIConvertRGBtoLAB();
  CLKUIConvertLABtoRGB();
  __asm { FMOV            V1.4S, #1.0 }
  return CLKUIConvertToUIColorFromRGBf();
}

- (id)ntk_colorByBoostingSaturation:()NTKFaceColorScheme lightness:
{
  void *v3;
  void *v4;
  void *v5;
  double v7;
  double v8;
  double v9;
  double v10;

  v9 = 0.0;
  v10 = 0.0;
  v7 = 0.0;
  v8 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v10, &v9, &v8, &v7);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v10, (a2 + 1.0) * v9, v8, v7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NTKInterpolateBetweenColors(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)ntk_colorWithSaturationDelta:()NTKFaceColorScheme brightnessDelta:
{
  double v6;
  double v7;
  double v8;
  double v9;

  v8 = 0.0;
  v9 = 0.0;
  v6 = 0.0;
  v7 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v9, &v8, &v7, &v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v9, fmin(fmax(v8 + a2, 0.0), 1.0), fmin(fmax(v7 + a3, 0.0), 1.0), v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)ntk_colorWithMinLightness:()NTKFaceColorScheme
{
  double v3;
  double v5;
  double v6;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  objc_msgSend(a1, "getHue:saturation:brightness:alpha:", &v8, &v7, &v6, &v5);
  if (v6 >= a2)
    v3 = v6;
  else
    v3 = a2;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v8, v7, v3, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
