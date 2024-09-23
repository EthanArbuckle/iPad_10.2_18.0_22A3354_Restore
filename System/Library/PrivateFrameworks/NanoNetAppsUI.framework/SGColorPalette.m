@implementation SGColorPalette

- (id)getSolarColorsForLocation:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SGSiderealData *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  SGStartOfDayForDate(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceReferenceDate");
  v9 = v8;

  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v11 = v10;

  v12 = -[SGSiderealData initWithStartOfDay:location:useXR:]([SGSiderealData alloc], "initWithStartOfDay:location:useXR:", v6, 1, v9);
  -[SGSiderealData timeToProgress:](v12, "timeToProgress:", v11);
  -[SGSiderealData gradientWithSunsetFilterForDayProgress:](v12, "gradientWithSunsetFilterForDayProgress:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
