@implementation NSDate

void __37__NSDate_GEOCelestial___geo_calendar__block_invoke()
{
  id v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D48]);
  v1 = objc_msgSend(v0, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  v2 = (void *)_MergedGlobals_176;
  _MergedGlobals_176 = v1;

  v3 = (void *)_MergedGlobals_176;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithAbbreviation:", CFSTR("GMT"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTimeZone:", v4);

}

@end
