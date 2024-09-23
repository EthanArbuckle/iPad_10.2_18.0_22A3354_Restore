@implementation NSDate

void __42__NSDate__DKAdditions__timeSinceMidnight___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)timeSinceMidnight__calendar;
  timeSinceMidnight__calendar = v0;

}

- (id)dk_localtimeString
{
  void *v1;

  if (a1)
  {
    v1 = a1;
    if (dk_localtimeString_initialized != -1)
      dispatch_once(&dk_localtimeString_initialized, &__block_literal_global_52);
    objc_msgSend((id)dk_localtimeString_formatter, "stringFromDate:", v1);
    a1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

void __44__NSDate__DKSyncLogging__dk_localtimeString__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)dk_localtimeString_formatter;
  dk_localtimeString_formatter = (uint64_t)v0;

  objc_msgSend((id)dk_localtimeString_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss.SSS zzz"));
  v2 = (void *)dk_localtimeString_formatter;
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

void __31__NSDate__DKDeduping__dk_dedup__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dk_dedup_set_8;
  dk_dedup_set_8 = v0;

  dk_dedup_lock_9 = 0;
}

void __31__NSDate__DKDeduping__dk_dedup__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((unint64_t)objc_msgSend((id)dk_dedup_set_8, "countForObject:") <= 2)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
