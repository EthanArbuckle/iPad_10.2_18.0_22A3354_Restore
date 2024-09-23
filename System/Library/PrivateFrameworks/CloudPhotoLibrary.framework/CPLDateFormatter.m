@implementation CPLDateFormatter

+ (id)_formatter
{
  if (_formatter_onceToken != -1)
    dispatch_once(&_formatter_onceToken, &__block_literal_global_21003);
  return (id)_formatter_formatter;
}

+ (id)stringFromDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_formatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)stringFromDateAgo:(id)a3 now:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(a1, "stringForTimeIntervalAgo:now:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (%@)"), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)stringForTimeIntervalAgo:(id)a3 now:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "timeIntervalSinceDate:", v6);
  if (v8 >= 0.0)
    v9 = v8;
  else
    v9 = -v8;
  if (v9 >= 1.0)
  {
    v11 = (void *)MEMORY[0x1E0CB3940];
    if (v8 > 0.0)
    {
      objc_msgSend(a1, "stringForTimeInterval:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("%@ ago"), v12);
    }
    else
    {
      objc_msgSend(a1, "stringForTimeInterval:", -v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFormat:", CFSTR("in %@"), v12);
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = CFSTR("just now");
  }

  return v10;
}

+ (id)stringForTimeInterval:(double)a3
{
  double v3;
  double v4;
  __CFString *v5;
  const char *v6;
  double v7;
  double v8;
  double v9;
  const __CFString *v10;
  const __CFString *v11;
  double v12;
  uint64_t v14;
  uint64_t v15;

  v3 = -a3;
  if (a3 >= 0.0)
    v4 = a3;
  else
    v4 = -a3;
  if (v4 >= 1.0)
  {
    if (a3 > 0.0)
      v3 = a3;
    v6 = "-";
    if (a3 > 0.0)
      v6 = "";
    if (v3 <= 86400.0)
    {
      if (v3 <= 3600.0)
      {
        if (v3 <= 60.0)
        {
          v11 = CFSTR("s");
          v7 = v3;
        }
        else
        {
          v7 = floor(v3 / 60.0);
          v9 = v3 - v7 * 60.0;
          v11 = CFSTR(" min");
          if (v9 >= 1.0)
          {
            v10 = CFSTR("s");
            goto LABEL_21;
          }
        }
      }
      else
      {
        v7 = floor(v3 / 3600.0);
        v12 = v3 - v7 * 3600.0;
        if (v12 > 60.0)
        {
          v9 = floor(v12 / 60.0);
          v10 = CFSTR(" min");
          v11 = CFSTR(" hours");
          goto LABEL_21;
        }
        v11 = CFSTR(" hours");
      }
    }
    else
    {
      v7 = floor(v3 / 86400.0);
      v8 = v3 - v7 * 86400.0;
      if (v8 > 3600.0)
      {
        v9 = floor(v8 / 3600.0);
        v10 = CFSTR(" hours");
        v11 = CFSTR(" days");
LABEL_21:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%.0f%@ %.0f%@"), v6, *(_QWORD *)&v7, v11, *(_QWORD *)&v9, v10);
LABEL_25:
        v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
        return v5;
      }
      v11 = CFSTR(" days");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s%.0f%@"), v6, *(_QWORD *)&v7, v11, v14, v15);
    goto LABEL_25;
  }
  v5 = CFSTR("now");
  return v5;
}

+ (id)dateFromString:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "_formatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __30__CPLDateFormatter__formatter__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  id v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_formatter_formatter;
  _formatter_formatter = (uint64_t)v0;

  objc_msgSend((id)_formatter_formatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH.mm.ss.SSS"));
  v2 = (void *)_formatter_formatter;
  objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLocale:", v3);

}

@end
