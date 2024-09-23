@implementation NSDateInterval(HKCodingSupport)

+ (id)hk_dateIntervalWithCodableDateInterval:()HKCodingSupport sourceTimeZone:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_dateFromSourceTimeZone:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "endDate");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "hk_dateFromSourceTimeZone:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v12);
  return v13;
}

- (HKCodableDateInterval)hk_codableDateInterval
{
  HKCodableDateInterval *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HKCodableDateInterval);
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  -[HKCodableDateInterval setStartDate:](v2, "setStartDate:");

  objc_msgSend(a1, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[HKCodableDateInterval setEndDate:](v2, "setEndDate:");

  return v2;
}

@end
