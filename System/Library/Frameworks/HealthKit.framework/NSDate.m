@implementation NSDate

void __37__NSDate_HealthKit__hk_rfc3339String__block_invoke()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)hk_rfc3339String_dateFormatter;
  hk_rfc3339String_dateFormatter = (uint64_t)v0;

  objc_msgSend((id)hk_rfc3339String_dateFormatter, "setDateFormat:", CFSTR("yyyy'-'MM'-'dd'T'HH':'mm':'ss'Z'"));
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)hk_rfc3339String_dateFormatter, "setTimeZone:", v2);

}

double __36__NSDate_HealthKit__hk_nearestDate___block_invoke(uint64_t a1, void *a2)
{
  double v2;

  objc_msgSend(a2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
  return fabs(v2);
}

uint64_t __39__NSDate_HealthKit__hk_mostRecentDate___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timeIntervalSinceReferenceDate");
}

@end
