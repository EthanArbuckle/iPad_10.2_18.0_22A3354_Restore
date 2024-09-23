@implementation CUIKTimeIntervalTextProvider

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 font:(__CTFont *)a6
{
  id v10;
  id v11;
  id v12;
  _BOOL8 v13;
  _BOOL8 v14;
  void *v15;
  uint64_t v17;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = +[CUIKTextProviderUtils designatorRequiresWhitespace](CUIKTextProviderUtils, "designatorRequiresWhitespace");
  v14 = +[CUIKTextProviderUtils smallCapsAllowed](CUIKTextProviderUtils, "smallCapsAllowed");
  LOBYTE(v17) = +[CUIKTextProviderUtils dropLeftRedundantDesignator](CUIKTextProviderUtils, "dropLeftRedundantDesignator");
  objc_msgSend(a1, "timeIntervalAttributedTextWithStartDate:endDate:calendar:font:designatorRequiresWhitespace:smallCapsAllowed:dropLeftRedundantDesignator:", v12, v11, v10, a6, v13, v14, v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 font:(__CTFont *)a6 designatorRequiresWhitespace:(BOOL)a7 smallCapsAllowed:(BOOL)a8 dropLeftRedundantDesignator:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  _QWORD v36[2];

  v9 = a8;
  v10 = a7;
  v36[1] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a4;
  v17 = a3;
  -[__CTFont CUIKFontWithAlternativePunctuation](a6, "CUIKFontWithAlternativePunctuation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = *MEMORY[0x1E0DC1138];
  v36[0] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v30) = 0;
  objc_msgSend(a1, "_timeIntervalAttributedTextWithStartDate:endDate:calendar:designatorRequiresWhitespace:smallCapsAllowed:dropLeftRedundantDesignator:keepRedundantDesignator:", v17, v16, v15, v10, v9, a9, v30);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v20, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v21, "initWithString:attributes:", v22, v19);

  v24 = objc_msgSend(v20, "length");
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __168__CUIKTimeIntervalTextProvider_timeIntervalAttributedTextWithStartDate_endDate_calendar_font_designatorRequiresWhitespace_smallCapsAllowed_dropLeftRedundantDesignator___block_invoke;
  v31[3] = &unk_1E6EB7320;
  v25 = v23;
  v32 = v25;
  v33 = v18;
  v34 = v9;
  v26 = v18;
  objc_msgSend(v20, "enumerateAttributesInRange:options:usingBlock:", 0, v24, 0, v31);
  v27 = v33;
  v28 = v25;

  return v28;
}

void __168__CUIKTimeIntervalTextProvider_timeIntervalAttributedTextWithStartDate_endDate_calendar_font_designatorRequiresWhitespace_smallCapsAllowed_dropLeftRedundantDesignator___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
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

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  LOBYTE(v13) = 0;
  objc_msgSend(a1, "_timeIntervalAttributedTextWithStartDate:endDate:calendar:designatorRequiresWhitespace:smallCapsAllowed:dropLeftRedundantDesignator:keepRedundantDesignator:", v10, v9, v8, +[CUIKTextProviderUtils designatorRequiresWhitespace](CUIKTextProviderUtils, "designatorRequiresWhitespace"), +[CUIKTextProviderUtils smallCapsAllowed](CUIKTextProviderUtils, "smallCapsAllowed"), +[CUIKTextProviderUtils dropLeftRedundantDesignator](CUIKTextProviderUtils, "dropLeftRedundantDesignator"), v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 keepRedundantDesignator:(BOOL)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v15;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  LOBYTE(v15) = a6;
  objc_msgSend(a1, "_timeIntervalAttributedTextWithStartDate:endDate:calendar:designatorRequiresWhitespace:smallCapsAllowed:dropLeftRedundantDesignator:keepRedundantDesignator:", v12, v11, v10, +[CUIKTextProviderUtils designatorRequiresWhitespace](CUIKTextProviderUtils, "designatorRequiresWhitespace"), +[CUIKTextProviderUtils smallCapsAllowed](CUIKTextProviderUtils, "smallCapsAllowed"), +[CUIKTextProviderUtils dropLeftRedundantDesignator](CUIKTextProviderUtils, "dropLeftRedundantDesignator"), v15);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  if (!force24HourFormatRegistry)
  {
    v6 = objc_opt_new();
    v7 = (void *)force24HourFormatRegistry;
    force24HourFormatRegistry = v6;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)force24HourFormatRegistry;
  objc_msgSend(v5, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);
  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock);
}

+ (void)resetForce24HourFormatForUnitTests
{
  void *v2;

  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  v2 = (void *)force24HourFormatRegistry;
  force24HourFormatRegistry = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock);
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
  os_unfair_lock_lock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  v4 = (void *)force24HourFormatRegistry;
  objc_msgSend(v3, "localeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&force24HourFormatRegistryLock);
  if (v6)
    v7 = objc_msgSend(v6, "BOOLValue");
  else
    v7 = CUIKShow24Hours();
  v8 = v7;

  return v8;
}

+ (id)_dateFormatterWithCalendar:(id)a3 designatorRequiresWhitespace:(BOOL)a4 dateHasZeroMinutes:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  CUIKDateFormatterCacheKey *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  if (_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__onceToken != -1)
    dispatch_once(&_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__onceToken, &__block_literal_global_18);
  objc_msgSend(v8, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(a1, "_use24HourFormatForLocale:", v9);

  v11 = v5 & ~(_DWORD)v10;
  v12 = (void *)objc_msgSend(v8, "copy");
  v13 = -[CUIKDateFormatterCacheKey initWithCalendar:is24HourFormat:dropDesignator:canDropMinutes:designatorRequiresWhitespace:addDate:]([CUIKDateFormatterCacheKey alloc], "initWithCalendar:is24HourFormat:dropDesignator:canDropMinutes:designatorRequiresWhitespace:addDate:", v12, v10, 0, v11, v6, 0);
  objc_msgSend((id)_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = v14;
  }
  else
  {
    v16 = (void *)objc_opt_new();
    objc_msgSend(v16, "setCalendar:", v12);
    objc_msgSend(v12, "timeZone");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTimeZone:", v17);

    objc_msgSend(v12, "locale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLocale:", v18);

    v19 = (void *)MEMORY[0x1E0CB3578];
    if ((_DWORD)v11)
      v20 = CFSTR("j");
    else
      v20 = CFSTR("jmm");
    objc_msgSend(v12, "locale");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateFormatFromTemplate:options:locale:", v20, 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[CUIKTextProviderUtils timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorRequiresWhitespace:](CUIKTextProviderUtils, "timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:designatorRequiresWhitespace:", v22, v6);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v16, "setDateFormat:", v23);
    objc_msgSend((id)_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache, "setObject:forKey:", v16, v13);
    v15 = v16;

  }
  return v15;
}

void __107__CUIKTimeIntervalTextProvider__dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes___block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache;
  _dateFormatterWithCalendar_designatorRequiresWhitespace_dateHasZeroMinutes__cache = v0;

}

+ (id)_timeIntervalAttributedTextWithStartDate:(id)a3 endDate:(id)a4 calendar:(id)a5 designatorRequiresWhitespace:(BOOL)a6 smallCapsAllowed:(BOOL)a7 dropLeftRedundantDesignator:(BOOL)a8 keepRedundantDesignator:(BOOL)a9
{
  _BOOL8 v9;
  _BOOL8 v10;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  id v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  unint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  _BOOL4 v69;
  uint64_t v70;
  void *v71;
  void *v72;
  void *v73;
  uint64_t v74;
  const __CFString *v75;
  _QWORD v76[2];

  v69 = a8;
  v9 = a7;
  v10 = a6;
  v76[1] = *MEMORY[0x1E0C80C00];
  v14 = a5;
  v15 = a4;
  v16 = a3;
  objc_msgSend(a1, "_dateFormatterWithCalendar:designatorRequiresWhitespace:dateHasZeroMinutes:", v14, v10, objc_msgSend(v14, "component:fromDate:", 64, v16) == 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_attributedStringWithFieldsFromDate:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(a1, "_rangeOfDesignatorInAnnotatedTime:", v18);
  v73 = v18;
  v70 = v19;
  if (v20 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v74 = 0;
  }
  else
  {
    objc_msgSend(v18, "attributedSubstringFromRange:", v20, v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "string");
    v74 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_dateFormatterWithCalendar:designatorRequiresWhitespace:dateHasZeroMinutes:", v14, v10, objc_msgSend(v14, "component:fromDate:", 64, v15) == 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v71 = v22;
  objc_msgSend(v22, "_attributedStringWithFieldsFromDate:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend(a1, "_rangeOfDesignatorInAnnotatedTime:", v23);
  v26 = v24;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v27 = 0;
  }
  else
  {
    objc_msgSend(v23, "attributedSubstringFromRange:", v25, v24);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "string");
    v27 = objc_claimAutoreleasedReturnValue();

  }
  CUIKBundle();
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("INTERVAL_HYPHEN_NARROW"), CFSTR(" – "), 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v72 = (void *)v27;
  if (v74 | v27)
  {
    v67 = v14;
    v75 = CFSTR("CUIKSmallCapsAttributeName");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v76[0] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, &v75, 1);
    v45 = v26;
    v46 = v23;
    v47 = objc_claimAutoreleasedReturnValue();

    v48 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v73, "string");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)objc_msgSend(v48, "initWithString:", v49);

    objc_msgSend(v50, "addAttributes:range:", v47, v20, v70);
    v51 = objc_alloc(MEMORY[0x1E0CB3778]);
    v68 = v46;
    objc_msgSend(v46, "string");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(v51, "initWithString:", v52);

    v66 = (void *)v47;
    v54 = v47;
    v55 = v45;
    objc_msgSend(v53, "addAttributes:range:", v54, v25, v45);
    v56 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v30);
    if (a9)
    {
      v43 = v71;
      v62 = v66;
      v34 = v73;
      v59 = 0x1E0CB3000;
      v14 = v67;
    }
    else
    {
      v14 = v67;
      if (v72 && objc_msgSend((id)v74, "isEqualToString:"))
      {
        if (v69)
        {
          if (v20 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v73, "string");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_stringByRemovingDesignatorRange:fromString:", v20, v70, v57);
            v58 = (void *)objc_claimAutoreleasedReturnValue();

            v59 = 0x1E0CB3000uLL;
            v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v58);
            v61 = v50;
            v50 = (void *)v60;
LABEL_23:

            v43 = v71;
            v62 = v66;
            v34 = v73;
            goto LABEL_20;
          }
        }
        else if (v25 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v68, "string");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_stringByRemovingDesignatorRange:fromString:", v25, v55, v64);
          v58 = (void *)objc_claimAutoreleasedReturnValue();

          v59 = 0x1E0CB3000uLL;
          v65 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:", v58);
          v61 = v53;
          v53 = (void *)v65;
          goto LABEL_23;
        }
      }
      v43 = v71;
      v62 = v66;
      v34 = v73;
      v59 = 0x1E0CB3000uLL;
    }
LABEL_20:
    v42 = (void *)objc_msgSend(objc_alloc(*(Class *)(v59 + 1912)), "initWithAttributedString:", v50);
    objc_msgSend(v42, "appendAttributedString:", v56);
    objc_msgSend(v42, "appendAttributedString:", v53);

    v23 = v68;
    goto LABEL_21;
  }
  objc_msgSend(v14, "locale");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "languageCode");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = objc_msgSend(MEMORY[0x1E0C99DC8], "characterDirectionForLanguage:", v32);
  v34 = v73;
  objc_msgSend(v73, "string");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "directionalityIsolatedString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "string");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "directionalityIsolatedString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@"), v36, v30, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = v39;
  if (v33 == 2)
  {
    objc_msgSend(v39, "RTLString");
    v41 = objc_claimAutoreleasedReturnValue();

    v40 = (void *)v41;
  }
  v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", v40);

  v43 = v71;
LABEL_21:

  return v42;
}

+ (_NSRange)_rangeOfDesignatorInAnnotatedTime:(id)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = objc_msgSend(a1, "_rangeOfAnnontatedTime:matchingPattern:", a3, &__block_literal_global_22);
  result.length = v4;
  result.location = v3;
  return result;
}

uint64_t __66__CUIKTimeIntervalTextProvider__rangeOfDesignatorInAnnotatedTime___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", CFSTR("a"));
}

+ (_NSRange)_rangeOfAnnontatedTime:(id)a3 matchingPattern:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  _NSRange result;

  v5 = a3;
  v6 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3010000000;
  v19 = &unk_1B8BDE616;
  v20 = xmmword_1B8BA48C0;
  v7 = objc_msgSend(v5, "length");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__CUIKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke;
  v13[3] = &unk_1E6EB7368;
  v8 = v6;
  v14 = v8;
  v15 = &v16;
  objc_msgSend(v5, "enumerateAttributesInRange:options:usingBlock:", 0, v7, 0, v13);
  v9 = v17[4];
  v10 = v17[5];

  _Block_object_dispose(&v16, 8);
  v11 = v9;
  v12 = v10;
  result.length = v12;
  result.location = v11;
  return result;
}

void __71__CUIKTimeIntervalTextProvider__rangeOfAnnontatedTime_matchingPattern___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v9;
  id v10;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0C99728]);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(void))(*(_QWORD *)(a1 + 32) + 16))())
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(_QWORD *)(v9 + 32) = a3;
    *(_QWORD *)(v9 + 40) = a4;
    *a5 = 1;
  }

}

+ (id)_stringByRemovingDesignatorRange:(_NSRange)a3 fromString:(id)a4
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a4, "stringByReplacingCharactersInRange:withString:", a3.location, a3.length, &stru_1E6EBAE30);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
