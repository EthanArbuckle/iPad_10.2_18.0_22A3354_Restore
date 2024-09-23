@implementation MTUICollectionCellAnalogClockView

+ (int64_t)style
{
  return 1;
}

+ (double)faceRadius
{
  return 62.5;
}

+ (double)hourHandLength
{
  return 33.0;
}

+ (double)minuteHandLength
{
  return 57.0;
}

+ (double)secondHandMainLength
{
  return 56.0;
}

+ (double)secondHandOverhangLength
{
  return MTUIRoundToPixel(7.5);
}

+ (double)minuteHandWidth
{
  return MTUIRoundToPixel(2.5);
}

+ (double)hourHandWidth
{
  return MTUIRoundToPixel(2.5);
}

+ (double)secondHandWidth
{
  return 1.0;
}

+ (double)overHourHandDotSize
{
  return 6.0;
}

+ (double)overSecondHandDotSize
{
  return 3.0;
}

+ (CGPoint)handRotationalCenterForHand:(int64_t)a3
{
  double v3;
  double v4;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGPoint result;

  v3 = 1.0;
  v4 = 0.5;
  if ((unint64_t)a3 >= 2)
  {
    if (a3 == 2)
    {
      objc_msgSend(a1, "secondHandOverhangLength");
      v7 = v6;
      objc_msgSend(a1, "secondHandOverhangLength");
      v9 = v8;
      objc_msgSend(a1, "secondHandMainLength");
      v3 = 1.0 - v7 / (v9 + v10);
    }
    else
    {
      v4 = *MEMORY[0x24BDBEFB0];
      v3 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    }
  }
  v11 = v4;
  result.y = v3;
  result.x = v11;
  return result;
}

+ (BOOL)shouldCacheImageOnDiskForType:(int)a3 dayTime:(BOOL)a4
{
  return 0;
}

+ (id)makeClockFaceForDaytime:(BOOL)a3
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;

  if (a3)
    v4 = CFSTR("White");
  else
    v4 = CFSTR("Black");
  objc_msgSend(CFSTR("MTAnalogClockCollectionCell"), "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BE5C368];
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberingSystemForLocaleID:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("arab")) & 1) != 0)
  {
    v10 = CFSTR("Arabic");
LABEL_8:
    objc_msgSend(v5, "stringByAppendingString:", v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("deva")))
  {
    v10 = CFSTR("Devanagari");
    goto LABEL_8;
  }
LABEL_9:
  objc_msgSend(a1, "imageInBundleForName:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (double)updateInterval
{
  return 0.075;
}

- (double)coarseUpdateInterval
{
  return 2.5;
}

@end
