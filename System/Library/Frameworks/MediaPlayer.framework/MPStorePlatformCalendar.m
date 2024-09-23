@implementation MPStorePlatformCalendar

void ___MPStorePlatformCalendar_block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)_MPStorePlatformCalendar_sGMTCalendar;
  _MPStorePlatformCalendar_sGMTCalendar = v1;

  v3 = (void *)_MPStorePlatformCalendar_sGMTCalendar;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

@end
