@implementation ACHPerfectMonthUniqueName

void __ACHPerfectMonthUniqueName_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithUTCTimeZone");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)ACHPerfectMonthUniqueName_utcCalendar;
  ACHPerfectMonthUniqueName_utcCalendar = v0;

}

@end
