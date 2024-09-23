@implementation NSDateFormatter

void __143__NSDateFormatter_MNExtras___navigation_localizedTimestampStringForDepartureArrivalDate_inTimeZone_canIncludeDate_showTimeZone_useShortFormat___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99D38]);
  v1 = (void *)_MergedGlobals_20;
  _MergedGlobals_20 = (uint64_t)v0;

}

void __65__NSDateFormatter_MNExtras___navigation_debugDescriptionForDate___block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)qword_1ED0C3E60;
  qword_1ED0C3E60 = (uint64_t)v0;

  objc_msgSend((id)qword_1ED0C3E60, "setFormatterBehavior:", 1040);
  objc_msgSend((id)qword_1ED0C3E60, "setDateStyle:", 1);
  objc_msgSend((id)qword_1ED0C3E60, "setTimeStyle:", 3);
  v2 = (void *)qword_1ED0C3E60;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

}

@end
