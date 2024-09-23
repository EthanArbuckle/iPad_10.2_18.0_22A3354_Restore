@implementation CalInvalidAlarmDate

void __CalInvalidAlarmDate_block_invoke()
{
  id v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v1 = (void *)CalInvalidAlarmDate_sInvalidDate;
  CalInvalidAlarmDate_sInvalidDate = (uint64_t)v0;

  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  v5 = (id)objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C99760]);
  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setCalendar:", v5);
  v3 = (void *)CalInvalidAlarmDate_sInvalidDate;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setYear:", 1976);
  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setMonth:", 4);
  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setDay:", 1);
  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setHour:", 0);
  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setMinute:", 55);
  objc_msgSend((id)CalInvalidAlarmDate_sInvalidDate, "setSecond:", 45);

}

@end
