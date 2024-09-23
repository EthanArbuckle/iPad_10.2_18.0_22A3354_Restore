@implementation HKSleepSchedule(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (HDCodableSleepSchedule)codableRepresentationForSync
{
  HDCodableSleepSchedule *v2;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v2 = objc_alloc_init(HDCodableSleepSchedule);
  v14.receiver = a1;
  v14.super_class = (Class)&off_1EF226D30;
  objc_msgSendSuper2(&v14, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableSleepSchedule setSample:](v2, "setSample:", v3);

  v4 = objc_msgSend(a1, "weekdays");
  -[HDCodableSleepSchedule setMonday:](v2, "setMonday:", v4 & 1);
  -[HDCodableSleepSchedule setTuesday:](v2, "setTuesday:", (v4 >> 1) & 1);
  -[HDCodableSleepSchedule setWednesday:](v2, "setWednesday:", (v4 >> 2) & 1);
  -[HDCodableSleepSchedule setThursday:](v2, "setThursday:", (v4 >> 3) & 1);
  -[HDCodableSleepSchedule setFriday:](v2, "setFriday:", (v4 >> 4) & 1);
  -[HDCodableSleepSchedule setSaturday:](v2, "setSaturday:", (v4 >> 5) & 1);
  -[HDCodableSleepSchedule setSunday:](v2, "setSunday:", (v4 >> 6) & 1);
  objc_msgSend(a1, "wakeTimeComponents");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "wakeTimeComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSleepSchedule setWakeHour:](v2, "setWakeHour:", objc_msgSend(v6, "hour"));

    objc_msgSend(a1, "wakeTimeComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSleepSchedule setWakeMinute:](v2, "setWakeMinute:", objc_msgSend(v7, "minute"));

  }
  objc_msgSend(a1, "bedTimeComponents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1, "bedTimeComponents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSleepSchedule setBedHour:](v2, "setBedHour:", objc_msgSend(v9, "hour"));

    objc_msgSend(a1, "bedTimeComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSleepSchedule setBedMinute:](v2, "setBedMinute:", objc_msgSend(v10, "minute"));

  }
  objc_msgSend(a1, "overrideDayIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(a1, "overrideDayIndex");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableSleepSchedule setOverrideDayIndex:](v2, "setOverrideDayIndex:", objc_msgSend(v12, "integerValue"));

  }
  return v2;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addSleepSchedules:", v5);

  return v5 != 0;
}

@end
