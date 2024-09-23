@implementation NSDate(AppleMediaServices)

+ (id)ams_momentInUTCGregorianAtYear:()AppleMediaServices month:day:hour:minute:second:
{
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v14 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  v15 = *MEMORY[0x1E0C996C8];
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setCalendar:", v16);

  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v17);

  objc_msgSend(v14, "setYear:", a3);
  objc_msgSend(v14, "setMonth:", a4);
  objc_msgSend(v14, "setDay:", a5);
  objc_msgSend(v14, "setHour:", a6);
  objc_msgSend(v14, "setMinute:", a7);
  objc_msgSend(v14, "setSecond:", a8);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateFromComponents:", v14);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

@end
