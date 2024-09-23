@implementation NSDate(HealthKit)

- (uint64_t)hk_isBeforeOrEqualToDate:()HealthKit
{
  return objc_msgSend(a1, "hk_isAfterDate:") ^ 1;
}

- (BOOL)hk_isAfterDate:()HealthKit
{
  return objc_msgSend(a1, "compare:") == 1;
}

- (BOOL)hk_isBeforeDate:()HealthKit
{
  return objc_msgSend(a1, "compare:") == -1;
}

- (uint64_t)hk_isAfterOrEqualToDate:()HealthKit
{
  return objc_msgSend(a1, "hk_isBeforeDate:") ^ 1;
}

- (uint64_t)hk_rfc3339String
{
  if (hk_rfc3339String_onceToken != -1)
    dispatch_once(&hk_rfc3339String_onceToken, &__block_literal_global_43);
  return objc_msgSend((id)hk_rfc3339String_dateFormatter, "stringFromDate:", a1);
}

- (id)hk_nearestDate:()HealthKit
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__NSDate_HealthKit__hk_nearestDate___block_invoke;
  v4[3] = &unk_1E37EDB40;
  v4[4] = a1;
  objc_msgSend(a3, "hk_firstObjectWithMinimumValueUsingEvaluationBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (uint64_t)hk_mostRecentDate:()HealthKit
{
  return objc_msgSend(a3, "hk_firstObjectWithMaximumValueUsingEvaluationBlock:", &__block_literal_global_5_0);
}

- (id)hk_truncateToDay
{
  double v1;

  objc_msgSend(a1, "timeIntervalSinceReferenceDate");
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", floor(v1 / 86400.0) * 86400.0);
}

+ (uint64_t)hk_dateWithNanosecondsSince1970:()HealthKit
{
  return objc_msgSend(a1, "dateWithTimeIntervalSince1970:", (double)(a3 / 0x3B9ACA00));
}

- (uint64_t)hk_nanosecondsSince1970
{
  double v1;

  objc_msgSend(a1, "timeIntervalSince1970");
  return 1000000000 * (uint64_t)v1;
}

- (id)hk_utcDateAdjustedToCalendar:()HealthKit
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "hk_gregorianCalendarWithUTCTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "components:fromDate:", 254, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateFromComponents:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
