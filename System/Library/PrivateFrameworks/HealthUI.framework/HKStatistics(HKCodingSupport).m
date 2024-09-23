@implementation HKStatistics(HKCodingSupport)

+ (id)statisticsWithCodableStatistics:()HKCodingSupport
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "hasDataType"))
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", objc_msgSend(v3, "dataType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "hasStartDate"))
    {
      objc_msgSend(v3, "startDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
    if (objc_msgSend(v3, "hasEndDate"))
    {
      objc_msgSend(v3, "endDate");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6C68]), "initWithDataType:startDate:endDate:", v4, v5, v7);
    if (objc_msgSend(v3, "hasAverageQuantity"))
    {
      v8 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v3, "averageQuantity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "createWithCodableQuantity:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAverageQuantity:", v10);

    }
    if (objc_msgSend(v3, "hasMinQuantity"))
    {
      v11 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v3, "minQuantity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "createWithCodableQuantity:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMinimumQuantity:", v13);

    }
    if (objc_msgSend(v3, "hasMaxQuantity"))
    {
      v14 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v3, "maxQuantity");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "createWithCodableQuantity:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMaximumQuantity:", v16);

    }
    if (objc_msgSend(v3, "hasMostRecentQuantity"))
    {
      v17 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v3, "mostRecentQuantity");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "createWithCodableQuantity:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setMostRecentQuantity:", v19);

    }
    if (objc_msgSend(v3, "hasSumQuantity"))
    {
      v20 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v3, "sumQuantity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "createWithCodableQuantity:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSumQuantity:", v22);

    }
    if (objc_msgSend(v3, "hasDurationQuantity"))
    {
      v23 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(v3, "durationQuantity");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "createWithCodableQuantity:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setDuration:", v25);

    }
    if (objc_msgSend(v3, "hasDataCount"))
      objc_msgSend(v6, "setDataCount:", objc_msgSend(v3, "dataCount"));

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (HKCodableStatistics)codableStatistics
{
  HKCodableStatistics *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v2 = objc_alloc_init(HKCodableStatistics);
  objc_msgSend(a1, "quantityType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setDataType:](v2, "setDataType:", objc_msgSend(v3, "code"));

  objc_msgSend(a1, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[HKCodableStatistics setStartDate:](v2, "setStartDate:");

  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[HKCodableStatistics setEndDate:](v2, "setEndDate:");

  objc_msgSend(a1, "averageQuantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "codableRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setAverageQuantity:](v2, "setAverageQuantity:", v7);

  objc_msgSend(a1, "minimumQuantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setMinQuantity:](v2, "setMinQuantity:", v9);

  objc_msgSend(a1, "maximumQuantity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "codableRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setMaxQuantity:](v2, "setMaxQuantity:", v11);

  objc_msgSend(a1, "mostRecentQuantity");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "codableRepresentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setMostRecentQuantity:](v2, "setMostRecentQuantity:", v13);

  objc_msgSend(a1, "sumQuantity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "codableRepresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setSumQuantity:](v2, "setSumQuantity:", v15);

  objc_msgSend(a1, "duration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "codableRepresentation");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableStatistics setDurationQuantity:](v2, "setDurationQuantity:", v17);

  -[HKCodableStatistics setDataCount:](v2, "setDataCount:", objc_msgSend(a1, "dataCount"));
  objc_msgSend(a1, "baselineRelativeValueState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    -[HKCodableStatistics setBaselineRelativeValueState:](v2, "setBaselineRelativeValueState:", objc_msgSend(v18, "integerValue"));

  return v2;
}

@end
