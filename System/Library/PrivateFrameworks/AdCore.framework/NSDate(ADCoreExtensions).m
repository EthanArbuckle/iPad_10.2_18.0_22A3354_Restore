@implementation NSDate(ADCoreExtensions)

- (uint64_t)AD_toServerTime
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return (int)v1;
}

+ (uint64_t)AD_maxServerTime
{
  return 0x7FFFFFFFLL;
}

+ (id)AD_dateFromServerTime:()ADCoreExtensions
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSince1970:", (double)a3);
}

+ (uint64_t)AD_minServerTime
{
  return 0x80000000;
}

- (uint64_t)AD_toSinceReferenceTime
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return (int)v1;
}

- (id)AD_localDateTimeAsString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ssZ"));
  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)AD_universalDateTimeAsString
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss"));
  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)AD_doubleDateTimeAsString
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(MEMORY[0x1E0C99E80], "defaultTimeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v3);

  objc_msgSend(v2, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ssZ"));
  objc_msgSend(v2, "stringFromDate:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", CFSTR("UTC"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTimeZone:", v5);

  objc_msgSend(v2, "setDateFormat:", CFSTR("YYYY-MM-dd HH:mm:ss"));
  objc_msgSend(v2, "stringFromDate:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@ (%@ Z)"), v4, v6);

  return v7;
}

@end
