@implementation _HKActivityStatisticsQuantityInfo(HDCodingSupport)

+ (id)createWithCodable:()HDCodingSupport
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "startDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6EF0]), "initWithStartDate:endDate:", v5, v6);
    v8 = (void *)MEMORY[0x1E0CB6CD0];
    objc_msgSend(v4, "unit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitFromString:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v4, "value");
    v13 = v12;

    objc_msgSend(v11, "quantityWithUnit:doubleValue:", v10, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setQuantityValue:", v14);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HDCodableActivityStatisticsQuantityInfo)codableRepresentationForSync
{
  HDCodableActivityStatisticsQuantityInfo *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(HDCodableActivityStatisticsQuantityInfo);
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  -[HDCodableActivityStatisticsQuantityInfo setStartDate:](v2, "setStartDate:");

  objc_msgSend(a1, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[HDCodableActivityStatisticsQuantityInfo setEndDate:](v2, "setEndDate:");

  objc_msgSend(a1, "quantityValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_unit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableActivityStatisticsQuantityInfo setUnit:](v2, "setUnit:", v7);

  objc_msgSend(a1, "quantityValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "quantityValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_unit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v10);
  -[HDCodableActivityStatisticsQuantityInfo setValue:](v2, "setValue:");

  return v2;
}

@end
