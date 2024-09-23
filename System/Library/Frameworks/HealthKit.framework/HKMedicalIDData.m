@implementation HKMedicalIDData

void __41___HKMedicalIDData__gregorianUtcCalendar__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_gregorianUtcCalendar__calendar;
  _gregorianUtcCalendar__calendar = v0;

}

@end
