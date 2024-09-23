@implementation NSCalendar(FHCalendarAdditions)

- (id)fh_dateWithStartOfDayByAddingDaysFromNow:()FHCalendarAdditions
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCE68]);
  objc_msgSend(v6, "setDay:", a3);
  objc_msgSend(a1, "dateByAddingComponents:toDate:options:", v6, v5, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "startOfDayForDate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
