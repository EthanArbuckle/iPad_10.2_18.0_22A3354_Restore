@implementation HKQuantity(FIUIUtilities)

- (BOOL)fiui_isNonzero
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "_unit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "doubleValueForUnit:", v2);
  v4 = v3;

  return fabs(v4) > 2.22044605e-16;
}

- (double)fiui_doubleValueByDividingByQuantity:()FIUIUtilities
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a1, "_unit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "doubleValueForUnit:", v5);
  v7 = v6;
  objc_msgSend(v4, "doubleValueForUnit:", v5);
  v9 = v8;

  if (v9 == 0.0)
    v10 = 0.0;
  else
    v10 = v7 / v9;

  return v10;
}

@end
