@implementation MapsSuggestionsDateIntervalFormatter

void __MapsSuggestionsDateIntervalFormatter_block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3590]);
  v1 = (void *)_MergedGlobals_45;
  _MergedGlobals_45 = (uint64_t)v0;

  objc_msgSend((id)_MergedGlobals_45, "setDateTemplate:", CFSTR("dd MMMM"));
  objc_msgSend(MEMORY[0x1E0C99D48], "autoupdatingCurrentCalendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_45, "setCalendar:", v2);

  objc_msgSend(MEMORY[0x1E0C99DC8], "autoupdatingCurrentLocale");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_MergedGlobals_45, "setLocale:", v3);

}

@end
