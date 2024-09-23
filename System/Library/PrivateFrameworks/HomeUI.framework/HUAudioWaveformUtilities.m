@implementation HUAudioWaveformUtilities

+ (id)waveformImageforPowerLevels:(const double *)a3 powerLevelsCount:(unint64_t)a4 color:(id)a5
{
  id v8;
  CGContext *CurrentContext;
  unint64_t v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CGSize v17;

  v8 = a5;
  v17.width = (double)a4 * 4.0;
  v17.height = 45.0;
  UIGraphicsBeginImageContextWithOptions(v17, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  objc_msgSend(v8, "set");
  if (a4)
  {
    v10 = 0;
    do
    {
      objc_msgSend(a1, "floatToScreenScale:", a3[v10] * 45.0);
      if (v11 <= 1.0)
        v12 = 22.0;
      else
        v12 = (45.0 - v11) * 0.5;
      objc_msgSend(a1, "floatToScreenScale:", v12);
      objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", (double)v10 * 4.0, v13, 2.0, 45.0 - v13 * 2.0, 5.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v8), "CGColor"));
      objc_msgSend(v14, "fill");

      ++v10;
    }
    while (a4 != v10);
  }
  UIGraphicsGetImageFromCurrentImageContext();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();

  return v15;
}

+ (float)progressForTime:(double)a3 duration:(double)a4
{
  float v4;
  double v5;

  v4 = 0.0;
  if (a3 != 0.0)
  {
    v4 = 1.0;
    if (a3 != a4)
    {
      if (a4 >= 0.05)
        a3 = a3 + 0.05;
      v4 = a3 / a4;
    }
  }
  v5 = v4;
  if (v4 > 1.0)
    v5 = 1.0;
  return fmax(v5, 0.0);
}

+ (double)disabledWaveformWidth:(double)a3 forProgress:(float)a4
{
  long double v5;
  double v6;
  long double v7;
  double result;

  v5 = a3 * 0.25 * (1.0 - a4);
  v6 = (double)(unint64_t)v5;
  v7 = fmod(v5, 1.0);
  objc_msgSend(a1, "floatToScreenScale:", (double)(v7 + v7 + v6 * 4.0 + 2.0));
  return result;
}

+ (double)floatToScreenScale:(double)a3
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = v5;

  return ceil(v6 * a3) / v6;
}

@end
