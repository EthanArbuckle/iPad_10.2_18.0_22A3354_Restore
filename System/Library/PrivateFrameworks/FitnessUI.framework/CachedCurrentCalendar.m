@implementation CachedCurrentCalendar

void ___CachedCurrentCalendar_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "autoupdatingCurrentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_CachedCurrentCalendar___calendar;
  _CachedCurrentCalendar___calendar = v0;

}

@end
