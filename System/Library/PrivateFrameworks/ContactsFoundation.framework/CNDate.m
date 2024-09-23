@implementation CNDate

+ (NSCalendar)gmtGregorianCalendar
{
  if (gmtGregorianCalendar_onceToken != -1)
    dispatch_once(&gmtGregorianCalendar_onceToken, &__block_literal_global_89);
  return (NSCalendar *)(id)gmtGregorianCalendar_s_gmtGregorian;
}

void __30__CNDate_gmtGregorianCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)gmtGregorianCalendar_s_gmtGregorian;
  gmtGregorianCalendar_s_gmtGregorian = v1;

  v3 = (void *)gmtGregorianCalendar_s_gmtGregorian;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

+ (NSCalendar)gmtJapaneseCalendar
{
  if (gmtJapaneseCalendar_onceToken != -1)
    dispatch_once(&gmtJapaneseCalendar_onceToken, &__block_literal_global_2_4);
  return (NSCalendar *)(id)gmtJapaneseCalendar_s_gmtJapanese;
}

void __29__CNDate_gmtJapaneseCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C99708]);
  v2 = (void *)gmtJapaneseCalendar_s_gmtJapanese;
  gmtJapaneseCalendar_s_gmtJapanese = v1;

  v3 = (void *)gmtJapaneseCalendar_s_gmtJapanese;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

+ (NSCalendar)gmtBuddhistCalendar
{
  if (gmtBuddhistCalendar_onceToken != -1)
    dispatch_once(&gmtBuddhistCalendar_onceToken, &__block_literal_global_3_6);
  return (NSCalendar *)(id)gmtBuddhistCalendar_s_gmtBuddhist;
}

void __29__CNDate_gmtBuddhistCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C99698]);
  v2 = (void *)gmtBuddhistCalendar_s_gmtBuddhist;
  gmtBuddhistCalendar_s_gmtBuddhist = v1;

  v3 = (void *)gmtBuddhistCalendar_s_gmtBuddhist;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

+ (NSCalendar)gmtIslamicCalendar
{
  if (gmtIslamicCalendar_onceToken != -1)
    dispatch_once(&gmtIslamicCalendar_onceToken, &__block_literal_global_4_5);
  return (NSCalendar *)(id)gmtIslamicCalendar_s_gmtIslamic;
}

void __28__CNDate_gmtIslamicCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996E8]);
  v2 = (void *)gmtIslamicCalendar_s_gmtIslamic;
  gmtIslamicCalendar_s_gmtIslamic = v1;

  v3 = (void *)gmtIslamicCalendar_s_gmtIslamic;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

+ (NSCalendar)gmtChineseCalendar
{
  if (gmtChineseCalendar_onceToken != -1)
    dispatch_once(&gmtChineseCalendar_onceToken, &__block_literal_global_5_5);
  return (NSCalendar *)(id)gmtChineseCalendar_s_gmtChinese;
}

void __28__CNDate_gmtChineseCalendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996A0]);
  v2 = (void *)gmtChineseCalendar_s_gmtChinese;
  gmtChineseCalendar_s_gmtChinese = v1;

  v3 = (void *)gmtChineseCalendar_s_gmtChinese;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

+ (id)dateFromDayComponents:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "gmtGregorianCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v4, "copy");

    objc_msgSend(v6, "setHour:", 12);
    objc_msgSend(v6, "setMinute:", 0);
    objc_msgSend(v6, "setSecond:", 0);
    objc_msgSend(v5, "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTimeZone:", v7);

    if (objc_msgSend(v6, "year") == 0x7FFFFFFFFFFFFFFFLL)
      -[objc_class setYearlessYear:forCalendar:](getIntlUtilityClass_0(), "setYearlessYear:forCalendar:", v6, v5);
    objc_msgSend(v5, "dateFromComponents:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

+ (id)dayComponentsFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(a1, "gmtGregorianCalendar");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "components:fromDate:", 30, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[objc_class isYearlessDate:forCalendar:](getIntlUtilityClass_0(), "isYearlessDate:forCalendar:", v6, v5))objc_msgSend(v6, "setYear:", 0x7FFFFFFFFFFFFFFFLL);
    if (objc_msgSend(v6, "era") == 1)
      objc_msgSend(v6, "setEra:", 0x7FFFFFFFFFFFFFFFLL);
    objc_msgSend(v6, "setCalendar:", v5);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

@end
