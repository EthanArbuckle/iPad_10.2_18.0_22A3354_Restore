@implementation CUIKTimeTextProvider

+ (id)timeAttributedTextWithDate:(id)a3 calendar:(id)a4
{
  return (id)objc_msgSend(a1, "timeAttributedTextWithDate:calendar:font:options:", a3, a4, 0, 0);
}

+ (id)timeAttributedTextWithDate:(id)a3 calendar:(id)a4 font:(id)a5 options:(int64_t)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((a6 & 2) != 0)
  {
    v13 = 1;
    if ((a6 & 4) != 0)
    {
LABEL_6:
      v14 = (a6 & 8) == 0;
      goto LABEL_8;
    }
  }
  else
  {
    v13 = +[CUIKTextProviderUtils designatorRequiresWhitespace](CUIKTextProviderUtils, "designatorRequiresWhitespace");
    if ((a6 & 4) != 0)
      goto LABEL_6;
  }
  if (+[CUIKTextProviderUtils smallCapsAllowed](CUIKTextProviderUtils, "smallCapsAllowed"))
    goto LABEL_6;
  v14 = 0;
LABEL_8:
  LOBYTE(v20) = (a6 & 0x20) != 0;
  objc_msgSend(a1, "_timeAttributedTextWithDate:calendar:droppingDesignator:designatorRequiresWhitespace:smallCapsAllowed:retainZeroMinutes:addDate:", v10, v11, a6 & 1, v13, v14, ((unint64_t)a6 >> 4) & 1, v20);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v12)
  {
    objc_msgSend(a1, "_applyFont:toString:allowSmallCaps:", v12, v15, v14);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v15;
  }
  v18 = v17;

  return v18;
}

+ (id)_applyFont:(id)a3 toString:(id)a4 allowSmallCaps:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *, uint64_t, uint64_t);
  void *v22;
  id v23;
  id v24;
  BOOL v25;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v26 = *MEMORY[0x1E0DC1138];
  v27[0] = v7;
  v8 = (void *)MEMORY[0x1E0C99D80];
  v9 = a4;
  objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v9, "string");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithString:attributes:", v12, v10);

  v14 = objc_msgSend(v9, "length");
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __59__CUIKTimeTextProvider__applyFont_toString_allowSmallCaps___block_invoke;
  v22 = &unk_1E6EB7320;
  v23 = v13;
  v24 = v7;
  v25 = a5;
  v15 = v7;
  v16 = v13;
  objc_msgSend(v9, "enumerateAttributesInRange:options:usingBlock:", 0, v14, 0, &v19);

  v17 = (void *)objc_msgSend(v16, "copy", v19, v20, v21, v22);
  return v17;
}

void __59__CUIKTimeTextProvider__applyFont_toString_allowSmallCaps___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CUIKSmallCapsAttributeName"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "BOOLValue"))
  {
    v7 = *MEMORY[0x1E0DC1138];
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "CUIKFontWithLocalizedSmallCaps:", *(unsigned __int8 *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addAttribute:value:range:", v7, v9, a3, a4);

  }
}

+ (id)_timeAttributedTextWithDate:(id)a3 calendar:(id)a4 droppingDesignator:(BOOL)a5 designatorRequiresWhitespace:(BOOL)a6 smallCapsAllowed:(BOOL)a7 retainZeroMinutes:(BOOL)a8 addDate:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v11;
  _BOOL8 v12;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  _QWORD v25[4];
  id v26;
  BOOL v27;

  v9 = a8;
  v11 = a6;
  v12 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(a1, "_dateFormatterWithCalendar:dropDesignator:designatorRequiresWhitespace:retainZeroMinutes:dateHasZeroMinutes:addDate:", v15, v12, v11, v9, objc_msgSend(v15, "component:fromDate:", 64, v16) == 0, a9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "_attributedStringWithFieldsFromDate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v18, "string");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithString:", v20);

  v22 = objc_msgSend(v18, "length");
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __152__CUIKTimeTextProvider__timeAttributedTextWithDate_calendar_droppingDesignator_designatorRequiresWhitespace_smallCapsAllowed_retainZeroMinutes_addDate___block_invoke;
  v25[3] = &unk_1E6EB7478;
  v23 = v21;
  v26 = v23;
  v27 = a7;
  objc_msgSend(v18, "enumerateAttributesInRange:options:usingBlock:", 0, v22, 0, v25);

  return v23;
}

void __152__CUIKTimeTextProvider__timeAttributedTextWithDate_calendar_droppingDesignator_designatorRequiresWhitespace_smallCapsAllowed_retainZeroMinutes_addDate___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0C99728]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasPrefix:", CFSTR("a")))
  {
    v7 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addAttribute:value:range:", CFSTR("CUIKSmallCapsAttributeName"), v8, a3, a4);

  }
}

+ (void)force24HourFormatForUnitTests:(BOOL)a3 withLocale:(id)a4
{
  _BOOL8 v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  if (!force24HourFormatRegistry_0)
  {
    v6 = objc_opt_new();
    v7 = (void *)force24HourFormatRegistry_0;
    force24HourFormatRegistry_0 = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)force24HourFormatRegistry_0;
  objc_msgSend(v5, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
}

+ (void)resetForce24HourFormatForUnitTests
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  v2 = (void *)force24HourFormatRegistry_0;
  force24HourFormatRegistry_0 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
}

+ (BOOL)_use24HourFormatForLocale:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  BOOL v8;

  v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  v4 = (void *)force24HourFormatRegistry_0;
  objc_msgSend(v3, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock_0);
  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = CUIKShow24Hours();
  v8 = v7;

  return v8;
}

+ (id)_dateFormatterWithCalendar:(id)a3 dropDesignator:(BOOL)a4 designatorRequiresWhitespace:(BOOL)a5 retainZeroMinutes:(BOOL)a6 dateHasZeroMinutes:(BOOL)a7 addDate:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL4 v9;
  int v10;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  CUIKDateFormatterCacheKey *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  __CFString *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;

  v8 = a8;
  v9 = a7;
  v10 = a6;
  v11 = a5;
  v12 = a4;
  v14 = a3;
  if (_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__onceToken != -1)
    dispatch_once(&_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__onceToken, &__block_literal_global_22);
  objc_msgSend(v14, "locale");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(a1, "_use24HourFormatForLocale:", v15);

  if ((v16 & 1) != 0)
    v17 = 0;
  else
    v17 = v9 & ~v10;
  v18 = (void *)objc_msgSend(v14, "copy");
  v19 = -[CUIKDateFormatterCacheKey initWithCalendar:is24HourFormat:dropDesignator:canDropMinutes:designatorRequiresWhitespace:addDate:]([CUIKDateFormatterCacheKey alloc], "initWithCalendar:is24HourFormat:dropDesignator:canDropMinutes:designatorRequiresWhitespace:addDate:", v18, v16, v12, v17, v11, v8);
  objc_msgSend((id)_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache, "objectForKey:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    v20 = (void *)objc_opt_new();
    objc_msgSend(v20, "setCalendar:", v18);
    objc_msgSend(v18, "timeZone");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setTimeZone:", v21);

    objc_msgSend(v18, "locale");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLocale:", v22);

    if (v8)
    {
      objc_msgSend(v20, "setDateStyle:", 1);
      objc_msgSend(v20, "setTimeStyle:", 1);
    }
    else
    {
      v23 = CFSTR("j");
      if (v12)
        v23 = CFSTR("J");
      v24 = v23;
      v25 = v24;
      if ((_DWORD)v17)
      {
        v26 = v24;
      }
      else
      {
        -[__CFString stringByAppendingString:](v24, "stringByAppendingString:", CFSTR("mm"));
        v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      v27 = v26;
      v28 = (void *)MEMORY[0x1E0CB3578];
      objc_msgSend(v18, "locale");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "dateFormatFromTemplate:options:locale:", v27, 0, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      +[CUIKTextProviderUtils timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorRequiresWhitespace:](CUIKTextProviderUtils, "timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorRequiresWhitespace:", v30, v11);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v20, "setDateFormat:", v31);
    }
    objc_msgSend((id)_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache, "setObject:forKey:", v20, v19);
  }
  v32 = v20;

  return v32;
}

void __140__CUIKTimeTextProvider__dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache;
  _dateFormatterWithCalendar_dropDesignator_designatorRequiresWhitespace_retainZeroMinutes_dateHasZeroMinutes_addDate__cache = v0;

}

@end
