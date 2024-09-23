@implementation NSDate(GEOCelestial)

+ (uint64_t)geo_dateWithJulianDay:()GEOCelestial
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", (a1 + -2440587.5) * 86400.0);
}

- (double)geo_julianDay
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return v1 / 86400.0 + 2440587.5;
}

- (double)geo_hoursAndMinutes
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_opt_class(), "_geo_calendar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "components:fromDate:", 96, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (double)objc_msgSend(v3, "hour");
  v5 = (double)objc_msgSend(v3, "minute") / 60.0 + v4;

  return v5;
}

+ (id)_geo_calendar
{
  if (qword_1ECDBB878 != -1)
    dispatch_once(&qword_1ECDBB878, &__block_literal_global_5);
  return (id)_MergedGlobals_176;
}

@end
