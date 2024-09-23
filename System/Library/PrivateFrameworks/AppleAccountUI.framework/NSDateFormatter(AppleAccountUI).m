@implementation NSDateFormatter(AppleAccountUI)

+ (id)monthYearStringFromDate:()AppleAccountUI calendar:
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3578];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "calendarIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "setCalendar:", v5);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x1E0C997E0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DC8], "componentsFromLocaleIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (const __CFString *)*MEMORY[0x1E0C99790];
    v17 = objc_msgSend(v15, "containsObject:", *MEMORY[0x1E0C99790]);

    objc_msgSend(v5, "calendarIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v19 = v14;
      v20 = v18;
      v21 = v16;
    }
    else
    {
      v21 = CFSTR("calendar");
      v19 = v14;
      v20 = v18;
    }
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v21);

    objc_msgSend(MEMORY[0x1E0C99DC8], "localeIdentifierFromComponents:", v14);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", v22);

    v9 = (void *)v23;
  }
  objc_msgSend(MEMORY[0x1E0CB3578], "dateFormatFromTemplate:options:locale:", CFSTR("MMyyyy"), 0, v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDateFormat:", v24);
  objc_msgSend(v8, "stringFromDate:", v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

@end
