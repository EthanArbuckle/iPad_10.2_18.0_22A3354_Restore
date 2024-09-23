@implementation _HKSleepComparisonDayAxis

- (id)stringForDate:(id)a3 zoom:(int64_t)a4 labelType:(int64_t)a5
{
  void *v5;

  if (a5 == 2)
  {
    v5 = 0;
  }
  else
  {
    HKLocalizedStringForDateAndTemplate(a3, 24);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

@end
