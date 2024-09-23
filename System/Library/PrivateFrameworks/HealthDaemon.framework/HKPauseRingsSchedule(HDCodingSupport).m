@implementation HKPauseRingsSchedule(HDCodingSupport)

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

- (HDCodablePauseRingsSchedule)codableRepresentationForSync
{
  HDCodablePauseRingsSchedule *v2;
  void *v3;
  objc_super v5;

  v2 = objc_alloc_init(HDCodablePauseRingsSchedule);
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EF224EE0;
  objc_msgSendSuper2(&v5, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodablePauseRingsSchedule setSample:](v2, "setSample:", v3);
  -[HDCodablePauseRingsSchedule setStartDateIndex:](v2, "setStartDateIndex:", objc_msgSend(a1, "startDateIndex"));
  -[HDCodablePauseRingsSchedule setEndDateIndex:](v2, "setEndDateIndex:", objc_msgSend(a1, "endDateIndex"));

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
    objc_msgSend(v4, "addPauseRingsSchedules:", v5);

  return v5 != 0;
}

@end
