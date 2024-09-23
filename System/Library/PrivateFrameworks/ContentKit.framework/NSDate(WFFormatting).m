@implementation NSDate(WFFormatting)

- (id)wf_formattedStringWithDateStyle:()WFFormatting timeStyle:relativeDateStyle:customDateFormat:includeTimeForISO8601:timeZone:locale:
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  id v31;
  uint64_t v32;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a8;
  v20 = a9;
  if (!v20)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (!objc_msgSend(v16, "isEqualToString:", CFSTR("Relative")))
  {
    v21 = objc_alloc_init(MEMORY[0x24BDD1500]);
    objc_msgSend(v21, "setTimeZone:", v19);
    objc_msgSend(v21, "setLocale:", v20);
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("Custom")))
    {
      objc_msgSend(v21, "setDateFormat:", v18);
      objc_msgSend(v20, "localeIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v24, "hasSuffix:", CFSTR("_POSIX")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_POSIX"), v24);
        v31 = v17;
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setLocale:", v26);

        v17 = v31;
      }

      goto LABEL_16;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("RFC 2822")))
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLocale:", v27);

      v28 = CFSTR("EEE, dd MMM yyyy HH:mm:ss Z");
LABEL_15:
      objc_msgSend(v21, "setDateFormat:", v28);
LABEL_16:
      objc_msgSend(v21, "stringFromDate:", a1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    }
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("ISO 8601")))
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setLocale:", v29);

      if (a7)
        v28 = CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ");
      else
        v28 = CFSTR("yyyy-MM-dd");
      goto LABEL_15;
    }
    v32 = 0;
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("Relative")))
    {
      objc_msgSend(v21, "setDoesRelativeDateFormatting:", 1);
      if ((WFDateFormatterStyleFromStyle(v17, &v32) & 1) == 0)
      {
LABEL_23:
        if (WFDateFormatterStyleFromStyle(v16, &v32))
          objc_msgSend(v21, "setTimeStyle:", v32);
        goto LABEL_16;
      }
    }
    else if (!WFDateFormatterStyleFromStyle(v15, &v32))
    {
      goto LABEL_23;
    }
    objc_msgSend(v21, "setDateStyle:", v32);
    goto LABEL_23;
  }
  v21 = (id)objc_opt_new();
  objc_msgSend(v21, "setLocale:", v20);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedStringForDate:relativeToDate:", a1, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v23;
}

@end
