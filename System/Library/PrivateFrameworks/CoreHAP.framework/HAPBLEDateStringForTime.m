@implementation HAPBLEDateStringForTime

uint64_t __HAPBLEDateStringForTime_block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)HAPBLEDateStringForTime_formatter;
  HAPBLEDateStringForTime_formatter = (uint64_t)v0;

  return objc_msgSend((id)HAPBLEDateStringForTime_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
}

@end
