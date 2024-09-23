@implementation NSCalendar

void __97__NSCalendar_MNExtras___navigation_dateStringForDate_withStyle_useRelativeFormatting_inTimeZone___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_MergedGlobals_39;
  _MergedGlobals_39 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_39, "setTimeStyle:", 0);
  v2 = (void *)_MergedGlobals_39;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

void __81__NSCalendar_MNExtras___navigation_relativeDateStringForDate_context_inTimeZone___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED0C4068;
  qword_1ED0C4068 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0C4068, "setTimeStyle:", 0);
  objc_msgSend((id)qword_1ED0C4068, "setDateStyle:", 1);
  v2 = (void *)qword_1ED0C4068;
  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

uint64_t __102__NSCalendar_MNExtras___navigation_transitRelativeDateStringForDate_context_inTimeZone_outUsedFormat___block_invoke()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED0C4078;
  qword_1ED0C4078 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED0C4078, "setLocale:", v2);

  return objc_msgSend((id)qword_1ED0C4078, "setDateFormat:", CFSTR("EEEE"));
}

uint64_t __102__NSCalendar_MNExtras___navigation_transitRelativeDateStringForDate_context_inTimeZone_outUsedFormat___block_invoke_2()
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED0C4088;
  qword_1ED0C4088 = (uint64_t)v0;

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)qword_1ED0C4088, "setLocale:", v2);

  return objc_msgSend((id)qword_1ED0C4088, "setLocalizedDateFormatFromTemplate:", CFSTR("MMd"));
}

@end
