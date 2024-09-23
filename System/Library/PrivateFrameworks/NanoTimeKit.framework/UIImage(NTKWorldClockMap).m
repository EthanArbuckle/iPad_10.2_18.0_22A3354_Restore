@implementation UIImage(NTKWorldClockMap)

+ (uint64_t)ntk_solarTerminatorStrokeColor
{
  return objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

+ (id)ntk_gossamer_nightMaskForDate:()NTKWorldClockMap size:
{
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  CGContext *CurrentContext;
  void *v17;
  void *v18;
  CGSize v20;
  CGRect v21;

  if (a1 == *MEMORY[0x1E0C9D820] && a2 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v18 = 0;
  }
  else
  {
    v8 = NTKWorldClock_DayOfYearForDate(a5);
    NTKWorldClock_NightMaskPathForDayOfYear(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (sin((v8 + 284.0) * 0.98630137 * 0.0174532925) * 23.45 >= 0.0)
      v14 = 0.0;
    else
      v14 = a2;
    objc_msgSend(v13, "moveToPoint:");
    objc_msgSend(v13, "appendPath:", v12);
    objc_msgSend(v13, "addLineToPoint:", a1, v14);
    objc_msgSend(v13, "addLineToPoint:", 0.0, v14);
    v20.width = a1;
    v20.height = a2;
    UIGraphicsBeginImageContextWithOptions(v20, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.45);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFill");

    CurrentContext = UIGraphicsGetCurrentContext();
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = a1;
    v21.size.height = a2;
    CGContextFillRect(CurrentContext, v21);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFill");

    objc_msgSend(v13, "fill");
    UIGraphicsGetImageFromCurrentImageContext();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v18;
}

+ (id)ntk_pregossamer_nightMaskForDate:()NTKWorldClockMap size:
{
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  CGSize v19;

  if (a1 == *MEMORY[0x1E0C9D820] && a2 == *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v17 = 0;
  }
  else
  {
    v8 = NTKWorldClock_DayOfYearForDate(a5);
    NTKWorldClock_NightMaskPathForDayOfYear(v9, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3508], "bezierPath");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (sin((v8 + 284.0) * 0.98630137 * 0.0174532925) * 23.45 <= 0.0)
      v14 = 0.0;
    else
      v14 = a2;
    objc_msgSend(v13, "moveToPoint:");
    objc_msgSend(v13, "appendPath:", v12);
    objc_msgSend(v13, "addLineToPoint:", a1, v14);
    objc_msgSend(v13, "addLineToPoint:", 0.0, v14);
    v19.width = a1;
    v19.height = a2;
    UIGraphicsBeginImageContextWithOptions(v19, 0, 0.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.65);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFill");

    objc_msgSend(v13, "fillWithBlendMode:alpha:", 17, 1.0);
    objc_msgSend(MEMORY[0x1E0DC3870], "ntk_solarTerminatorStrokeColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setStroke");
    objc_msgSend(v12, "stroke");
    UIGraphicsGetImageFromCurrentImageContext();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    UIGraphicsEndImageContext();

  }
  return v17;
}

@end
