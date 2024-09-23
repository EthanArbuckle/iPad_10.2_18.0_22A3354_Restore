@implementation NSDate

uint64_t __37__NSDate_IC__ic_localDateWithSeconds__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)ic_localDateWithSeconds_localFormatter;
  ic_localDateWithSeconds_localFormatter = (uint64_t)v0;

  objc_msgSend((id)ic_localDateWithSeconds_localFormatter, "setTimeStyle:", 3);
  return objc_msgSend((id)ic_localDateWithSeconds_localFormatter, "setDateStyle:", 1);
}

void __28__NSDate_IC__ic_iso8601Date__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB36A8]);
  v1 = (void *)ic_iso8601Date_dateFormatter;
  ic_iso8601Date_dateFormatter = (uint64_t)v0;

}

uint64_t __52__NSDate_IC__ic_shortFormattedDateForAccessibility___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)ic_shortFormattedDateForAccessibility__shortRelativeformatter;
  ic_shortFormattedDateForAccessibility__shortRelativeformatter = (uint64_t)v0;

  objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortRelativeformatter, "setTimeStyle:", 1);
  objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortRelativeformatter, "setDateStyle:", 1);
  return objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortRelativeformatter, "setDoesRelativeDateFormatting:", 1);
}

uint64_t __52__NSDate_IC__ic_shortFormattedDateForAccessibility___block_invoke_2()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter;
  ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter = (uint64_t)v0;

  objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter, "setTimeStyle:", 1);
  return objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortAccessibilityStandardformatter, "setDateStyle:", 3);
}

uint64_t __52__NSDate_IC__ic_shortFormattedDateForAccessibility___block_invoke_3()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)ic_shortFormattedDateForAccessibility__shortStandardformatter;
  ic_shortFormattedDateForAccessibility__shortStandardformatter = (uint64_t)v0;

  objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortStandardformatter, "setTimeStyle:", 1);
  return objc_msgSend((id)ic_shortFormattedDateForAccessibility__shortStandardformatter, "setDateStyle:", 1);
}

uint64_t __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)ic_briefFormattedDate_locale__briefTodayFormatter;
  ic_briefFormattedDate_locale__briefTodayFormatter = (uint64_t)v2;

  objc_msgSend((id)ic_briefFormattedDate_locale__briefTodayFormatter, "setTimeStyle:", 1);
  objc_msgSend((id)ic_briefFormattedDate_locale__briefTodayFormatter, "setDateStyle:", 0);
  return objc_msgSend((id)ic_briefFormattedDate_locale__briefTodayFormatter, "setLocale:", *(_QWORD *)(a1 + 32));
}

void __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)ic_briefFormattedDate_locale__templateFormatter;
  ic_briefFormattedDate_locale__templateFormatter = (uint64_t)v2;

  objc_msgSend((id)ic_briefFormattedDate_locale__templateFormatter, "setLocale:", *(_QWORD *)(a1 + 32));
  v4 = (void *)ic_briefFormattedDate_locale__templateFormatter;
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("cccc"), 0, *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDateFormat:", v5);

}

uint64_t __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)ic_briefFormattedDate_locale__accessibilityDateFormatter;
  ic_briefFormattedDate_locale__accessibilityDateFormatter = (uint64_t)v2;

  objc_msgSend((id)ic_briefFormattedDate_locale__accessibilityDateFormatter, "setDateStyle:", 3);
  objc_msgSend((id)ic_briefFormattedDate_locale__accessibilityDateFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)ic_briefFormattedDate_locale__accessibilityDateFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)ic_briefFormattedDate_locale__accessibilityDateFormatter, "setLocale:", *(_QWORD *)(a1 + 32));
}

uint64_t __43__NSDate_IC__ic_briefFormattedDate_locale___block_invoke_4(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v3 = (void *)ic_briefFormattedDate_locale__briefRelativeFormatter;
  ic_briefFormattedDate_locale__briefRelativeFormatter = (uint64_t)v2;

  objc_msgSend((id)ic_briefFormattedDate_locale__briefRelativeFormatter, "setTimeStyle:", 0);
  objc_msgSend((id)ic_briefFormattedDate_locale__briefRelativeFormatter, "setDateStyle:", 1);
  objc_msgSend((id)ic_briefFormattedDate_locale__briefRelativeFormatter, "setDoesRelativeDateFormatting:", 1);
  return objc_msgSend((id)ic_briefFormattedDate_locale__briefRelativeFormatter, "setLocale:", *(_QWORD *)(a1 + 32));
}

@end
