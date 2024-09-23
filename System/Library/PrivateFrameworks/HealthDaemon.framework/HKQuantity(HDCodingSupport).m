@implementation HKQuantity(HDCodingSupport)

- (HDCodableQuantity)codableRepresentationForSync
{
  HDCodableQuantity *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HDCodableQuantity);
  objc_msgSend(a1, "_unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableQuantity setUnitString:](v2, "setUnitString:", v4);

  objc_msgSend(a1, "doubleValueForUnit:", v3);
  -[HDCodableQuantity setValue:](v2, "setValue:");

  return v2;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    if (objc_msgSend(v4, "hasUnitString") && objc_msgSend(v4, "hasValue"))
    {
      v5 = (void *)MEMORY[0x1E0CB6CD0];
      objc_msgSend(v4, "unitString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "unitFromString:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v4, "value");
      objc_msgSend(v8, "quantityWithUnit:doubleValue:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

@end
