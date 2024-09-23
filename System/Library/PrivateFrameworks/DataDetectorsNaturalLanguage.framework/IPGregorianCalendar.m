@implementation IPGregorianCalendar

void __IPGregorianCalendar_block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v2 = (void *)IPGregorianCalendar_calendar;
  IPGregorianCalendar_calendar = v1;

}

void __IPGregorianCalendar_block_invoke_0()
{
  id v0;
  uint64_t v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDBCE48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x24BDBCA18]);
  v2 = (void *)IPGregorianCalendar_calendar_0;
  IPGregorianCalendar_calendar_0 = v1;

}

@end
