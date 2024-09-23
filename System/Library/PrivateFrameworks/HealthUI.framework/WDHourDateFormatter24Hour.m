@implementation WDHourDateFormatter24Hour

uint64_t ___WDHourDateFormatter24Hour_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_WDHourDateFormatter24Hour___dateFormatter;
  _WDHourDateFormatter24Hour___dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_WDHourDateFormatter24Hour___dateFormatter, "setDateFormat:", CFSTR("H"));
}

@end
