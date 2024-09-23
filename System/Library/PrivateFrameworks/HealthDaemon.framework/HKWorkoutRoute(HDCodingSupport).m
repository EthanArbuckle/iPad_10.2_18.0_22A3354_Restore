@implementation HKWorkoutRoute(HDCodingSupport)

- (HDCodableLocationSeries)codableRepresentationForSync
{
  HDCodableLocationSeries *v2;
  void *v3;
  HDCodableLocationSeries *v4;
  objc_super v6;

  objc_msgSend(a1, "_codableWorkoutRoute");
  v2 = (HDCodableLocationSeries *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    v2 = objc_alloc_init(HDCodableLocationSeries);
    v6.receiver = a1;
    v6.super_class = (Class)&off_1EF225D48;
    objc_msgSendSuper2(&v6, sel_codableRepresentationForSync);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableLocationSeries setSample:](v2, "setSample:", v3);

    -[HDCodableLocationSeries setFrozen:](v2, "setFrozen:", objc_msgSend(a1, "_isFrozen"));
  }
  v4 = v2;

  return v4;
}

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addLocationSeries:", v5);

  return v5 != 0;
}

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

@end
