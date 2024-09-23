@implementation HKQuantitySample(HDCodingSupport)

- (BOOL)addCodableRepresentationToCollection:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "codableRepresentationForSync");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addQuantitySamples:", v5);

  return v5 != 0;
}

- (HDCodableQuantitySample)codableRepresentationForSync
{
  void *v2;
  HDCodableQuantitySample *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  objc_msgSend(a1, "codableQuantitySample");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(a1, "codableQuantitySample");
    return (HDCodableQuantitySample *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = objc_alloc_init(HDCodableQuantitySample);
    v12.receiver = a1;
    v12.super_class = (Class)&off_1EF219AC8;
    objc_msgSendSuper2(&v12, sel_codableRepresentationForSync);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableQuantitySample setSample:](v4, "setSample:", v5);

    objc_msgSend(a1, "quantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "quantityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "canonicalUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "_unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v6 && v8)
    {
      if (objc_msgSend(v9, "isEqual:", v8))
      {
        objc_msgSend(v6, "doubleValueForUnit:", v8);
        -[HDCodableQuantitySample setValueInCanonicalUnit:](v4, "setValueInCanonicalUnit:");
      }
      else
      {
        objc_msgSend(v10, "unitString");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HDCodableQuantitySample setOriginalUnitString:](v4, "setOriginalUnitString:", v11);

        objc_msgSend(v6, "doubleValueForUnit:", v10);
        -[HDCodableQuantitySample setValueInOriginalUnit:](v4, "setValueInOriginalUnit:");
      }
    }
    -[HDCodableQuantitySample setFrozen:](v4, "setFrozen:", objc_msgSend(a1, "_frozen"));

    return v4;
  }
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)MEMORY[0x1E0CB6978];
    objc_msgSend(v4, "sample");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dataTypeWithCode:", objc_msgSend(v6, "dataType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v7, "dataObjectClass")), "_init");
    if (objc_msgSend(v4, "applyToObject:", v8))
    {
      v9 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v8, "_validateWithConfiguration:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = 0;
      else
        v12 = v8;
      v13 = v12;

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)migrateCodableObject:()HDCodingSupport
{
  id v3;
  void *v4;
  HDCodableCategorySample *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "sample");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "dataType") == 69)
  {
    v5 = objc_alloc_init(HDCodableCategorySample);
    v6 = (void *)objc_msgSend(v4, "copy");
    -[HDCodableCategorySample setSample:](v5, "setSample:", v6);

    -[HDCodableCategorySample sample](v5, "sample");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDataType:", 70);

    objc_msgSend(v3, "valueInCanonicalUnit");
    -[HDCodableCategorySample setValue:](v5, "setValue:", v8 == 1.0);
    objc_msgSend(MEMORY[0x1E0CB6378], "createWithCodable:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
