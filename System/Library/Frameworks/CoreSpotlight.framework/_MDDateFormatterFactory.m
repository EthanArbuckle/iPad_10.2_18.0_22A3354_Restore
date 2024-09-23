@implementation _MDDateFormatterFactory

+ (id)newDateTimeFormatterWithTimeZoneStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  if (a3 == 2)
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    v5 = CFSTR("uuuu'-'MM'-'dd'T'HH':'mm':'ss'Z'");
  }
  else if (a3 == 1)
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    v5 = CFSTR("uuuu'-'MM'-'dd'T'HH':'mm':'ssXXX");
  }
  else
  {
    if (a3)
      return 0;
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    v5 = CFSTR("uuuu'-'MM'-'dd'T'HH':'mm':'ss");
  }
  objc_msgSend(v3, "setDateFormat:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v3, "setTimeZone:", v6);
  objc_msgSend(v3, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v6);

  return v3;
}

+ (id)newDateTimeFormatters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);
  objc_msgSend(v2, "setDateFormat:", CFSTR("y'-'M'-'d'T'HH':'mm':'ssXXX"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v2, "setTimeZone:", v4);
  objc_msgSend(v2, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);

  objc_msgSend(v2, "setLenient:", 1);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:", v7);
  objc_msgSend(v6, "setDateFormat:", CFSTR("y'-'M'-'d'T'HH':'mm':'ss"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v6, "setTimeZone:", v8);
  objc_msgSend(v6, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v8);

  objc_msgSend(v6, "setLenient:", 1);
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v10, "setLocale:", v11);
  objc_msgSend(v10, "setDateFormat:", CFSTR("y'-'M'-'d'T'HH':'mm':'ss'.'SXXX"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v10, "setTimeZone:", v12);
  objc_msgSend(v10, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v12);

  objc_msgSend(v10, "setLenient:", 1);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v14, "setLocale:", v15);
  objc_msgSend(v14, "setDateFormat:", CFSTR("y'-'M'-'d'T'HH':'mm':'ss'.'S"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v14, "setTimeZone:", v16);
  objc_msgSend(v14, "calendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimeZone:", v16);

  objc_msgSend(v14, "setLenient:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v2, v6, v10, v14, 0);

  return v18;
}

+ (id)newDateFormatter
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);
  objc_msgSend(v2, "setDateFormat:", CFSTR("uuuu'-'MM'-'dd"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v2, "setTimeZone:", v4);
  objc_msgSend(v2, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);

  return v2;
}

+ (id)newDateFormatters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);
  objc_msgSend(v2, "setDateFormat:", CFSTR("y'-'M'-'dXXX"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v2, "setTimeZone:", v4);
  objc_msgSend(v2, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);

  objc_msgSend(v2, "setLenient:", 1);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:", v7);
  objc_msgSend(v6, "setDateFormat:", CFSTR("y'-'M'-'d"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v6, "setTimeZone:", v8);
  objc_msgSend(v6, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v8);

  objc_msgSend(v6, "setLenient:", 1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v2, v6, 0);

  return v10;
}

+ (id)newTimeFormatterWithTimeZoneStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  if (a3 == 2)
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    v5 = CFSTR("HH':'mm':'ss'Z'");
  }
  else if (a3 == 1)
  {
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    v5 = CFSTR("HH':'mm':'ssXXX");
  }
  else
  {
    if (a3)
      return 0;
    v3 = (void *)objc_opt_new();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
    objc_msgSend(v3, "setLocale:", v4);
    v5 = CFSTR("HH':'mm':'ss");
  }
  objc_msgSend(v3, "setDateFormat:", v5);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v3, "setTimeZone:", v6);
  objc_msgSend(v3, "calendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setTimeZone:", v6);

  return v3;
}

+ (id)newTimeFormatters
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v2, "setLocale:", v3);
  objc_msgSend(v2, "setDateFormat:", CFSTR("HH':'mm':'ssXXX"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v2, "setTimeZone:", v4);
  objc_msgSend(v2, "calendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTimeZone:", v4);

  objc_msgSend(v2, "setLenient:", 1);
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v6, "setLocale:", v7);
  objc_msgSend(v6, "setDateFormat:", CFSTR("HH':'mm':'ss"));
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v6, "setTimeZone:", v8);
  objc_msgSend(v6, "calendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTimeZone:", v8);

  objc_msgSend(v6, "setLenient:", 1);
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v10, "setLocale:", v11);
  objc_msgSend(v10, "setDateFormat:", CFSTR("HH':'mm':'ss'.'SXXX"));
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v10, "setTimeZone:", v12);
  objc_msgSend(v10, "calendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTimeZone:", v12);

  objc_msgSend(v10, "setLenient:", 1);
  v14 = (void *)objc_opt_new();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v14, "setLocale:", v15);
  objc_msgSend(v14, "setDateFormat:", CFSTR("HH':'mm':'ss'.'S"));
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E80]), "initWithName:", CFSTR("UTC"));
  objc_msgSend(v14, "setTimeZone:", v16);
  objc_msgSend(v14, "calendar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimeZone:", v16);

  objc_msgSend(v14, "setLenient:", 1);
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v2, v6, v10, v14, 0);

  return v18;
}

@end
