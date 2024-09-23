@implementation NSDate(InternetDateTime)

+ (id)internetDateTimeFormatter
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_sync_enter(v1);
  if (!_internetDateTimeFormatter)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEA0]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    v3 = objc_alloc_init(MEMORY[0x24BDD1500]);
    v4 = (void *)_internetDateTimeFormatter;
    _internetDateTimeFormatter = (uint64_t)v3;

    objc_msgSend((id)_internetDateTimeFormatter, "setLocale:", v2);
    v5 = (void *)_internetDateTimeFormatter;
    objc_msgSend(MEMORY[0x24BDBCF38], "timeZoneForSecondsFromGMT:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTimeZone:", v6);

  }
  objc_sync_exit(v1);

  return (id)_internetDateTimeFormatter;
}

+ (id)dateFromInternetDateTimeString:()InternetDateTime formatHint:
{
  id v5;
  void *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateFromRFC3339String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateFromRFC822String:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v6 = (void *)v7;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateFromRFC822String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "dateFromRFC3339String:", v5);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)dateFromRFC822String:()InternetDateTime
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "internetDateTimeFormatter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "rangeOfString:", CFSTR(",")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "setDateFormat:", CFSTR("d MMM yyyy HH:mm:ss zzz"));
      objc_msgSend(v4, "dateFromString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v4, "setDateFormat:", CFSTR("d MMM yyyy HH:mm zzz"));
        objc_msgSend(v4, "dateFromString:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v4, "setDateFormat:", CFSTR("d MMM yyyy HH:mm:ss"));
          objc_msgSend(v4, "dateFromString:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            v8 = CFSTR("d MMM yyyy HH:mm");
            goto LABEL_12;
          }
        }
      }
    }
    else
    {
      objc_msgSend(v4, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss zzz"));
      objc_msgSend(v4, "dateFromString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7)
      {
        objc_msgSend(v4, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm zzz"));
        objc_msgSend(v4, "dateFromString:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
          objc_msgSend(v4, "setDateFormat:", CFSTR("EEE, d MMM yyyy HH:mm:ss"));
          objc_msgSend(v4, "dateFromString:", v6);
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v7)
          {
            v8 = CFSTR("EEE, d MMM yyyy HH:mm");
LABEL_12:
            objc_msgSend(v4, "setDateFormat:", v8);
            objc_msgSend(v4, "dateFromString:", v6);
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v7)
            {
              NSLog(CFSTR("Could not parse RFC822 date: \"%@\" Possible invalid format."), v3);
              v7 = 0;
            }
          }
        }
      }
    }

    objc_sync_exit(v4);
    goto LABEL_15;
  }
  v7 = 0;
LABEL_15:

  return v7;
}

+ (id)dateFromRFC3339String:()InternetDateTime
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "internetDateTimeFormatter");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uppercaseString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Z"), CFSTR("-0000"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v7, "length") >= 0x15)
    {
      objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR(":"), &stru_24F8BBA48, 0, 20, objc_msgSend(v7, "length") - 20);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (void *)v8;
    }
    objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"));
    objc_msgSend(v4, "dateFromString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss.SSSZZZ"));
      objc_msgSend(v4, "dateFromString:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(v4, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss"));
        objc_msgSend(v4, "dateFromString:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          NSLog(CFSTR("Could not parse RFC3339 date: \"%@\" Possible invalid format."), v3);
          v9 = 0;
        }
      }
    }

    objc_sync_exit(v4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
