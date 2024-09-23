@implementation ABSqliteNormalizeDate

uint64_t __ABSqliteNormalizeDate_block_invoke()
{
  uint64_t v0;
  id v1;
  id v2;
  id v3;

  v0 = objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v1 = objc_alloc(MEMORY[0x1E0C99D48]);
  ABSqliteNormalizeDate_s_gmtGregorian = objc_msgSend(v1, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend((id)ABSqliteNormalizeDate_s_gmtGregorian, "setTimeZone:", v0);
  v2 = objc_alloc(MEMORY[0x1E0C99D48]);
  ABSqliteNormalizeDate_s_gmtJapanese = objc_msgSend(v2, "initWithCalendarIdentifier:", *MEMORY[0x1E0C99708]);
  objc_msgSend((id)ABSqliteNormalizeDate_s_gmtJapanese, "setTimeZone:", v0);
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  ABSqliteNormalizeDate_s_gmtBuddhist = objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C99698]);
  return objc_msgSend((id)ABSqliteNormalizeDate_s_gmtBuddhist, "setTimeZone:", v0);
}

@end
