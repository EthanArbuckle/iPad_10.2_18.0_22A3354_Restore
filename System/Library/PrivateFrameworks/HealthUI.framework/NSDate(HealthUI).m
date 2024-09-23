@implementation NSDate(HealthUI)

- (id)hk_dateBeforeDateForCalendar:()HealthUI rangeUnit:
{
  id v5;

  v5 = 0;
  objc_msgSend(a3, "rangeOfUnit:startDate:interval:forDate:", a4, &v5, 0, a1);
  return v5;
}

@end
