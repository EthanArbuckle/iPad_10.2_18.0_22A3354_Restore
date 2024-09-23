@implementation NSDateComponentsFormatter

+ (id)minuteStringForMinutes:(double)a3
{
  double v3;
  NSDateComponentsFormatter *v4;
  void *v5;

  if (a3 >= 1.0)
    v3 = a3;
  else
    v3 = 1.0;
  v4 = objc_opt_new(NSDateComponentsFormatter);
  -[NSDateComponentsFormatter setUnitsStyle:](v4, "setUnitsStyle:", 3);
  -[NSDateComponentsFormatter setAllowedUnits:](v4, "setAllowedUnits:", 64);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateComponentsFormatter stringFromTimeInterval:](v4, "stringFromTimeInterval:", v3));

  return v5;
}

@end
