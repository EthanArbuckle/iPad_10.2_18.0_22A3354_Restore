@implementation NSCalendar(WFAdjustDate)

- (uint64_t)wf_startOfYearForDate:()WFAdjustDate
{
  return objc_msgSend(a1, "transformDate:unitFlags:", a3, 4);
}

- (uint64_t)wf_startOfMonthForDate:()WFAdjustDate
{
  return objc_msgSend(a1, "transformDate:unitFlags:", a3, 12);
}

- (id)wf_startOfWeekForDate:()WFAdjustDate
{
  id v4;

  v4 = 0;
  objc_msgSend(a1, "rangeOfUnit:startDate:interval:forDate:", 0x2000, &v4, 0, a3);
  return v4;
}

- (uint64_t)wf_startOfHourForDate:()WFAdjustDate
{
  return objc_msgSend(a1, "transformDate:unitFlags:", a3, 60);
}

- (uint64_t)wf_startOfMinuteForDate:()WFAdjustDate
{
  return objc_msgSend(a1, "transformDate:unitFlags:", a3, 124);
}

- (id)transformDate:()WFAdjustDate unitFlags:
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "components:fromDate:", a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "dateFromComponents:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
