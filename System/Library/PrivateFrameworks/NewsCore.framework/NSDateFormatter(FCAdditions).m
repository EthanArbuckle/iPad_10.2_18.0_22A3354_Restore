@implementation NSDateFormatter(FCAdditions)

+ (uint64_t)dateFormatterWithFormat:()FCAdditions localeIdentifier:forReuse:
{
  return objc_msgSend(a1, "dateFormatterWithFormat:localeIdentifier:timezone:forReuse:", a3, a4, 0, a5);
}

+ (id)dateFormatterWithFormat:()FCAdditions localeIdentifier:timezone:forReuse:
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "format != nil");
      *(_DWORD *)buf = 136315906;
      v25 = "+[NSDateFormatter(FCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]";
      v26 = 2080;
      v27 = "NSDateFormatter+FCAdditions.m";
      v28 = 1024;
      v29 = 30;
      v30 = 2114;
      v31 = v21;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      if (!v10)
      {
LABEL_9:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "localeIdentifier != nil");
          *(_DWORD *)buf = 136315906;
          v25 = "+[NSDateFormatter(FCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]";
          v26 = 2080;
          v27 = "NSDateFormatter+FCAdditions.m";
          v28 = 1024;
          v29 = 31;
          v30 = 2114;
          v31 = v22;
          _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

        }
      }
    }
    else if (!v10)
    {
      goto LABEL_9;
    }
    v18 = 0;
    goto LABEL_12;
  }
  if (!v10)
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "threadDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKey:", CFSTR("NSDateFormatter_FCAdditions_CachedFormatters"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "currentThread");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "threadDictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKey:", v14, CFSTR("NSDateFormatter_FCAdditions_CachedFormatters"));

  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKey:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3578]), "initWithFormat:localeIdentifier:", v9, v10);
    v18 = v20;
    if (v11)
      objc_msgSend(v20, "setTimeZone:", v11);
    if (v18)
    {
      if (a6)
        objc_msgSend(v14, "setObject:forKey:", v18, v17);
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("invalid nil value for '%s'"), "formatter");
        *(_DWORD *)buf = 136315906;
        v25 = "+[NSDateFormatter(FCAdditions) dateFormatterWithFormat:localeIdentifier:timezone:forReuse:]";
        v26 = 2080;
        v27 = "NSDateFormatter+FCAdditions.m";
        v28 = 1024;
        v29 = 57;
        v30 = 2114;
        v31 = v23;
        _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

      }
      v18 = 0;
    }
  }

LABEL_12:
  return v18;
}

- (void)initWithFormat:()FCAdditions localeIdentifier:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(a1, "init");
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "setDateFormat:", v6);
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setLocale:", v10);

  }
  return v9;
}

+ (uint64_t)dateFormatterWithFormat:()FCAdditions forReuse:
{
  return objc_msgSend(a1, "dateFormatterWithFormat:localeIdentifier:forReuse:", a3, CFSTR("en_US_POSIX"), a4);
}

+ (uint64_t)dateFormatterWithFormat:()FCAdditions timezone:forReuse:
{
  return objc_msgSend(a1, "dateFormatterWithFormat:localeIdentifier:timezone:forReuse:", a3, CFSTR("en_US_POSIX"), a4, a5);
}

@end
