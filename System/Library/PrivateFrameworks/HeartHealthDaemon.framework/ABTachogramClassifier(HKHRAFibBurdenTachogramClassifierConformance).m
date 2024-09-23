@implementation ABTachogramClassifier(HKHRAFibBurdenTachogramClassifierConformance)

- (HKHRAFibBurdenTachogramClassificationProvider)classifyHeartbeatSeries:()HKHRAFibBurdenTachogramClassifierConformance
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  HKHRAFibBurdenTachogramClassificationProvider *v15;

  v4 = a3;
  objc_msgSend(a1, "classifyTachogram:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "aFibDetected");
  v7 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(v4, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:", v8, v9);

  v11 = objc_alloc(MEMORY[0x1E0D2FC08]);
  objc_msgSend(v4, "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_timeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(v11, "initWithSampleUUID:classification:sampleDateInterval:sampleTimeZone:", v12, v6, v10, v13);
  v15 = -[HKHRAFibBurdenTachogramClassificationProvider initWithSampleClassification:tachogramClassification:]([HKHRAFibBurdenTachogramClassificationProvider alloc], "initWithSampleClassification:tachogramClassification:", v14, v5);

  return v15;
}

@end
