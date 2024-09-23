@implementation HKCalendarDateTransformPreceding6PM

id __HKCalendarDateTransformPreceding6PM_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "startOfDayForDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 18, 0, 0, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "hk_isBeforeDate:", v7);

  if (v8)
  {
    objc_msgSend(v4, "dateByAddingUnit:value:toDate:options:", 16, -1, v6, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "dateBySettingHour:minute:second:ofDate:options:", 18, 0, 0, v9, 0);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
    v7 = (void *)v10;
  }

  return v7;
}

@end
