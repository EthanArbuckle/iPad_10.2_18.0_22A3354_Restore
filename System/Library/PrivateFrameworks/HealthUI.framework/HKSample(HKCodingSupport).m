@implementation HKSample(HKCodingSupport)

+ (id)createWithCodableChartData:()HKCodingSupport
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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", objc_msgSend(v3, "dataType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0C99D80];
    objc_msgSend(v3, "metadataDictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryWithCodableMetadata:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)MEMORY[0x1E0CB6378];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __56__HKSample_HKCodingSupport__createWithCodableChartData___block_invoke;
      v18[3] = &unk_1E9C47518;
      v19 = v3;
      v11 = (void *)objc_msgSend(v10, "_newSampleFromDatesWithType:startDate:endDate:device:metadata:config:", v4, v5, v6, 0, v9, v18);

    }
    else if (objc_msgSend(v4, "code") == 79 || objc_msgSend(v4, "code") == 79)
    {
      objc_msgSend(MEMORY[0x1E0CB6DD0], "_workoutWithActivityType:startDate:endDate:workoutEvents:workoutActivities:duration:statistics:goalType:goal:device:metadata:", objc_msgSend(v3, "int64Value"), v5, v6, 0, 0, 0, 1.0, 0, 0, 0, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = (void *)MEMORY[0x1E0CB6A28];
        objc_msgSend(v3, "quantity");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "createWithCodableQuantity:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0CB6A40], "quantitySampleWithType:quantity:startDate:endDate:device:metadata:", v4, v15, v5, v6, 0, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        if (objc_msgSend(v4, "code") == 287)
        {
          v16 = (void *)MEMORY[0x1E0CB6740];
          v17 = &unk_1E9CEAAA8;
        }
        else
        {
          if (objc_msgSend(v4, "code") != 288)
          {
            v11 = 0;
            goto LABEL_8;
          }
          v16 = (void *)MEMORY[0x1E0CB69C8];
          v17 = &unk_1E9CEAAC0;
        }
        objc_msgSend(v16, "assessmentWithDate:answers:metadata:", v5, v17, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_setRisk:", objc_msgSend(v3, "int64Value"));
      }
    }
LABEL_8:

    goto LABEL_9;
  }
  v11 = 0;
LABEL_9:

  return v11;
}

+ (id)createWithCodableNotificationSample:()HKCodingSupport
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6380], "dataTypeWithCode:", objc_msgSend(v3, "dataType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x1E0CB6378];
    v6 = objc_msgSend(v3, "categoryValue");
    objc_msgSend(v3, "startDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "categorySampleWithType:value:startDate:endDate:", v4, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HKCodableSampleChartData)codableSampleChartData
{
  HKCodableSampleChartData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = objc_alloc_init(HKCodableSampleChartData);
  objc_msgSend(a1, "sampleType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSampleChartData setDataType:](v2, "setDataType:", objc_msgSend(v3, "code"));

  objc_msgSend(a1, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  -[HKCodableSampleChartData setStartDate:](v2, "setStartDate:");

  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  -[HKCodableSampleChartData setEndDate:](v2, "setEndDate:");

  -[HKCodableSampleChartData setInt64Value:](v2, "setInt64Value:", objc_msgSend(a1, "hk_integerValue"));
  objc_msgSend(a1, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "codableMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableSampleChartData setMetadataDictionary:](v2, "setMetadataDictionary:", v7);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "quantity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "codableRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableSampleChartData setQuantity:](v2, "setQuantity:", v9);

  }
  return v2;
}

@end
