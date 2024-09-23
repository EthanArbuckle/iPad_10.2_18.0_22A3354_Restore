@implementation NTKComplicationDateFormatter

+ (void)initialize
{
  void *v3;
  id v4;

  if ((id)objc_opt_class() == a1)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", a1, sel__handleSignificantTimeChange_, *MEMORY[0x1E0DC4838], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", a1, sel__handleLocaleChange_, *MEMORY[0x1E0C99720], 0);

  }
}

+ (void)_handleSignificantTimeChange:(id)a3
{
  void *v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0C99E80], "resetSystemTimeZone", a3);
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKAllDateFormatters();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __61__NTKComplicationDateFormatter__handleSignificantTimeChange___block_invoke;
  v6[3] = &unk_1E6BCE190;
  v7 = v3;
  v4 = v3;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v6);

}

uint64_t __61__NTKComplicationDateFormatter__handleSignificantTimeChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setTimeZone:", *(_QWORD *)(a1 + 32));
}

+ (void)_handleLocaleChange:(id)a3
{
  id v3;

  _NTKAllDateFormatters();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

}

+ (id)stringForDate:(id)a3 withStyle:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  uint64_t v12;

  if (!a3)
    return &stru_1E6BDC918;
  v6 = a3;
  objc_msgSend(a1, "dateFormatterForStyle:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  _NTKRemovePunctationIfNecessaryFromTextForDateStyle(v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((uint64_t)a4 <= 255)
  {
    if (a4 != 1 && a4 != 8)
      goto LABEL_13;
LABEL_11:
    if (!NTKUseAllUppercaseShortWeekdays())
      goto LABEL_13;
    goto LABEL_12;
  }
  if (a4 == 4096 || a4 == 2048)
    goto LABEL_11;
  if (a4 != 256 || (NTKCanUseAllUppercaseLongDateStrings() & 1) == 0)
    goto LABEL_13;
LABEL_12:
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uppercaseStringWithLocale:", v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v12;
LABEL_13:

  return v9;
}

+ (id)dateFormatterForStyle:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  _NTKAllDateFormatters();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = 0;
    if ((uint64_t)a3 <= 127)
    {
      if ((uint64_t)a3 <= 15)
      {
        v8 = CFSTR("E d");
        v9 = CFSTR("E");
        switch(a3)
        {
          case 1uLL:
            goto LABEL_33;
          case 2uLL:
            v9 = CFSTR("EEEE");
            goto LABEL_33;
          case 4uLL:
            v6 = (void *)objc_opt_new();
            v7 = CFSTR("d");
            goto LABEL_27;
          case 8uLL:
            goto LABEL_11;
          default:
            goto LABEL_21;
        }
      }
      if (a3 != 16)
      {
        if (a3 == 32)
        {
          v9 = CFSTR("EMMMd");
          goto LABEL_33;
        }
        if (a3 == 64)
        {
          v9 = CFSTR("MMMd");
LABEL_33:
          v6 = (void *)objc_opt_new();
          v7 = v9;
          goto LABEL_34;
        }
        goto LABEL_21;
      }
LABEL_20:
      v7 = CFSTR("EEEEMMMd");
      goto LABEL_21;
    }
    if ((uint64_t)a3 > 1023)
    {
      switch(a3)
      {
        case 0x400uLL:
          v9 = CFSTR("M/d");
          goto LABEL_33;
        case 0x800uLL:
          v9 = CFSTR("EEEEE d");
          goto LABEL_33;
        case 0x1000uLL:
          v9 = CFSTR("EEEEEE d");
          goto LABEL_33;
      }
    }
    else
    {
      switch(a3)
      {
        case 0x80uLL:
          v9 = CFSTR("MMM");
          goto LABEL_33;
        case 0x100uLL:
          goto LABEL_20;
        case 0x200uLL:
          v8 = CFSTR("EEEE d");
LABEL_11:
          v6 = (void *)objc_opt_new();
          v7 = v8;
          goto LABEL_24;
      }
    }
LABEL_21:
    v6 = (void *)objc_opt_new();
    if (a3 != 8)
    {
      if (a3 != 4)
        goto LABEL_34;
LABEL_27:
      if ((CLKIsCurrentLocaleCJK() & 1) == 0)
      {
LABEL_34:
        objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", v7);
        goto LABEL_35;
      }
LABEL_28:
      objc_msgSend(v6, "setDateFormat:", v7);
LABEL_35:
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, v12);

      goto LABEL_36;
    }
LABEL_24:
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", *MEMORY[0x1E0C997E8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v10) = objc_msgSend(v11, "isEqualToString:", CFSTR("en"));
    if (!(_DWORD)v10)
      goto LABEL_34;
    goto LABEL_28;
  }
LABEL_36:

  return v6;
}

+ (id)_localizedDayDateFormatter
{
  void *v2;
  void *v3;
  void *v4;

  _NTKAllDateFormatters();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("localized"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setLocalizedDateFormatFromTemplate:", CFSTR("d"));
    _NTKAllDateFormatters();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v3, CFSTR("localized"));

  }
  return v3;
}

@end
