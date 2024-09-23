@implementation HKUICalendarLocaleIsRightToLeft

void __HKUICalendarLocaleIsRightToLeft_block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  HKUICalendarLocaleIsRightToLeft___calLocaleIsRTL = objc_msgSend(v0, "_calendarDirection") != 0;

}

@end
