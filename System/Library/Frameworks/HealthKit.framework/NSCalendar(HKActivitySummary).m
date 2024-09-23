@implementation NSCalendar(HKActivitySummary)

- (id)hk_activitySummaryDateComponentsFromDate:()HKActivitySummary
{
  void *v4;

  objc_msgSend(a1, "components:fromDate:", 30, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCalendar:", a1);
  return v4;
}

@end
