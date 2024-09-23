@implementation HKQuantity(HKCodingSupport)

+ (id)createWithCodableQuantity:()HKCodingSupport
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && objc_msgSend(v3, "hasUnitString")
    && objc_msgSend(v3, "hasValue"))
  {
    v4 = (void *)MEMORY[0x1E0CB6CD0];
    objc_msgSend(v3, "unitString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unitFromString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "value");
    objc_msgSend(v7, "quantityWithUnit:doubleValue:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (HKCodableQuantity)codableRepresentation
{
  HKCodableQuantity *v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(HKCodableQuantity);
  objc_msgSend(a1, "_unit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unitString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantity setUnitString:](v2, "setUnitString:", v4);

  objc_msgSend(a1, "doubleValueForUnit:", v3);
  -[HKCodableQuantity setValue:](v2, "setValue:");

  return v2;
}

+ (void)createWithCodableQuantity:()HKCodingSupport .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  v6 = a1;
  _os_log_error_impl(&dword_1D7813000, a4, OS_LOG_TYPE_ERROR, "Caught exception while decoding %{public}@: %{public}@", (uint8_t *)a3, 0x16u);

}

@end
