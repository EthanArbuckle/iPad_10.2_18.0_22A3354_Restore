@implementation HKCorrelation(HDCodingSupport)

- (HDCodableCorrelation)codableRepresentationForSync
{
  HDCodableCorrelation *v2;
  void *v3;
  objc_super v5;

  v2 = objc_alloc_init(HDCodableCorrelation);
  v5.receiver = a1;
  v5.super_class = (Class)&off_1EF225BF0;
  objc_msgSendSuper2(&v5, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableCorrelation setSample:](v2, "setSample:", v3);

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
    objc_msgSend(v4, "addCorrelations:", v5);

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6F38]), "_init");
    if (objc_msgSend(v4, "applyToObject:", v5))
    {
      v6 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v5, "_validateWithConfiguration:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        v9 = 0;
      else
        v9 = v5;
      v10 = v9;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end
