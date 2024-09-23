@implementation HKSleepTestDateWithSeconds

void __HKSleepTestDateWithSeconds_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)HKSleepTestDateWithSeconds_dateFormatter;
  HKSleepTestDateWithSeconds_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)HKSleepTestDateWithSeconds_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  v2 = (void *)HKSleepTestDateWithSeconds_dateFormatter;
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithCupertinoTimeZone");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

@end
