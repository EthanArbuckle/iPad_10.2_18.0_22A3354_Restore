@implementation NSDateInterval(HealthKit)

+ (id)hk_allTime
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v0, "initWithStartDate:endDate:", v1, v2);

  return v3;
}

+ (id)hk_dateIntervalWithStart:()HealthKit end:
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x1E0CB3588]);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a1);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a2);
  v7 = (void *)objc_msgSend(v4, "initWithStartDate:endDate:", v5, v6);

  return v7;
}

+ (id)hk_instantaneousDateIntervalWithDate:()HealthKit
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CB3588];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithStartDate:duration:", v4, 0.0);

  return v5;
}

+ (id)hk_dateIntervalWithAnchor:()HealthKit startOffset:endOffset:
{
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = (objc_class *)MEMORY[0x1E0C99D68];
  v8 = a5;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithTimeInterval:sinceDate:", v8, a1);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeInterval:sinceDate:", v8, a2);

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
  return v11;
}

+ (id)hk_dateIntervalForDayFromDate:()HealthKit calendar:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "dateByAddingUnit:value:toDate:options:", 16, 1, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startOfDayForDate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startOfDayForDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
  return v10;
}

- (uint64_t)hk_intersectsDateIntervalWithStartDate:()HealthKit endDate:
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;

  v6 = (objc_class *)MEMORY[0x1E0CB3588];
  v7 = a4;
  v8 = a3;
  v9 = (void *)objc_msgSend([v6 alloc], "initWithStartDate:endDate:", v8, v7);

  v10 = objc_msgSend(a1, "intersectsDateInterval:", v9);
  return v10;
}

- (BOOL)hk_containsTime:()HealthKit
{
  void *v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;

  objc_msgSend(a1, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v6 = v5;

  objc_msgSend(a1, "duration");
  v8 = v6 <= a2;
  if (v6 + v7 < a2)
    v8 = 0;
  if (v7 == 0.0)
    return v6 == a2;
  else
    return v8;
}

- (id)hk_prettyString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("<startDate: %@, endDate: %@>"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
