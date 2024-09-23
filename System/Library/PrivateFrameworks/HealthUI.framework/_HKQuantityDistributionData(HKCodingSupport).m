@implementation _HKQuantityDistributionData(HKCodingSupport)

+ (id)quantityDistributionDataWithCodableQuantityDistributionData:()HKCodingSupport sourceTimeZone:preferredUnit:
{
  id v7;
  id v8;
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
  id v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  void *v30;
  void *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", a5, 0.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "secondUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "quantityWithUnit:doubleValue:", v11, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "hasStartDate") & 1) != 0)
  {
    objc_msgSend(v7, "startDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "hk_dateFromSourceTimeZone:", v8);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v7, "hasEndDate") & 1) != 0)
  {
    objc_msgSend(v7, "endDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "hk_dateFromSourceTimeZone:", v8);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_msgSend(v7, "hasMinimumBucketValue") & 1) != 0)
  {
    v15 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v7, "minimumBucketValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createWithCodableQuantity:", v16);
    v37 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v37 = v9;
  }
  if ((objc_msgSend(v7, "hasMinimumValue") & 1) != 0)
  {
    v17 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v7, "minimumValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createWithCodableQuantity:", v18);
    v36 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v36 = v9;
  }
  if ((objc_msgSend(v7, "hasMaximumValue") & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v7, "maximumValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "createWithCodableQuantity:", v20);
    v35 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v35 = v9;
  }
  if ((objc_msgSend(v7, "hasAverageValue") & 1) != 0)
  {
    v21 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v7, "averageValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "createWithCodableQuantity:", v22);
    v34 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v34 = v9;
  }
  v41 = v8;
  v40 = v9;
  if ((objc_msgSend(v7, "hasDuration") & 1) != 0)
  {
    v23 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v7, "duration");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "createWithCodableQuantity:", v24);
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v25 = v12;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "histogramCountsCount"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contextIdentifiers");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "hk_map:", &__block_literal_global_246_1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "histogramCountsCount"))
  {
    v29 = 0;
    do
    {
      v30 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v7, "histogramCountsAtIndex:", v29);
      objc_msgSend(v30, "numberWithDouble:");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v31);

      ++v29;
    }
    while (v29 < objc_msgSend(v7, "histogramCountsCount"));
  }
  v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7000]), "initWithStartDate:endDate:minimumBucketValue:minimumValue:maximumValue:averageValue:duration:histogramCounts:contextIdentifiers:", v39, v38, v37, v36, v35, v34, v25, v26, v28);

  return v33;
}

- (HKCodableQuantityDistributionData)codableQuantityDistributionData
{
  HKCodableQuantityDistributionData *v2;
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
  uint64_t v18;
  HKCodableQuantityDistributionData *v19;
  void *v20;
  HKCodableQuantityDistributionData *v21;
  HKCodableQuantityDistributionData *v22;
  HKCodableQuantityDistributionData *v23;
  _QWORD v25[4];
  HKCodableQuantityDistributionData *v26;
  _QWORD v27[4];
  HKCodableQuantityDistributionData *v28;

  v2 = objc_alloc_init(HKCodableQuantityDistributionData);
  objc_msgSend(a1, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  -[HKCodableQuantityDistributionData setStartDate:](v2, "setStartDate:");

  objc_msgSend(a1, "endDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[HKCodableQuantityDistributionData setEndDate:](v2, "setEndDate:");

  objc_msgSend(a1, "minimumBucketValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "codableRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantityDistributionData setMinimumBucketValue:](v2, "setMinimumBucketValue:", v6);

  objc_msgSend(a1, "minimumValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "codableRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantityDistributionData setMinimumValue:](v2, "setMinimumValue:", v8);

  objc_msgSend(a1, "maximumValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codableRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableQuantityDistributionData setMaximumValue:](v2, "setMaximumValue:", v10);

  objc_msgSend(a1, "averageValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(a1, "averageValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "codableRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableQuantityDistributionData setAverageValue:](v2, "setAverageValue:", v13);

  }
  else
  {
    -[HKCodableQuantityDistributionData setAverageValue:](v2, "setAverageValue:", 0);
  }

  objc_msgSend(a1, "duration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(a1, "duration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "codableRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableQuantityDistributionData setDuration:](v2, "setDuration:", v16);

  }
  else
  {
    -[HKCodableQuantityDistributionData setDuration:](v2, "setDuration:", 0);
  }

  objc_msgSend(a1, "histogramCounts");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __79___HKQuantityDistributionData_HKCodingSupport__codableQuantityDistributionData__block_invoke;
  v27[3] = &unk_1E9C3F9F0;
  v19 = v2;
  v28 = v19;
  objc_msgSend(v17, "enumerateObjectsUsingBlock:", v27);

  objc_msgSend(a1, "contextIdentifiers");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v18;
  v25[1] = 3221225472;
  v25[2] = __79___HKQuantityDistributionData_HKCodingSupport__codableQuantityDistributionData__block_invoke_2;
  v25[3] = &unk_1E9C47650;
  v21 = v19;
  v26 = v21;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v25);

  v22 = v26;
  v23 = v21;

  return v23;
}

@end
