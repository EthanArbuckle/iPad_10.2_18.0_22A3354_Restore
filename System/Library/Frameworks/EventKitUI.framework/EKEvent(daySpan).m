@implementation EKEvent(daySpan)

- (uint64_t)daySpan
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "startCalendarDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "calendarDateForDay");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "endCalendarDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "calendarDateForDay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "differenceInDays:", v3) + 1;
  return v6;
}

@end
