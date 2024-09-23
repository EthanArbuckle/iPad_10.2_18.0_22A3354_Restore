@implementation HKElectrocardiogram(HKCodingSupport)

+ (id)createWithCodableECG:()HKCodingSupport
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
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0CB3588];
  objc_msgSend(v3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = *MEMORY[0x1E0CB7288];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "privateSymptoms"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  v23[1] = *MEMORY[0x1E0CB5490];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v3, "algorithmVersionRawValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0CB6650];
  objc_msgSend(MEMORY[0x1E0CB6B00], "electrocardiogramType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "timeIntervalSinceReferenceDate");
  v14 = v13;
  objc_msgSend(v6, "endDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeIntervalSinceReferenceDate");
  v17 = v16;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __61__HKElectrocardiogram_HKCodingSupport__createWithCodableECG___block_invoke;
  v21[3] = &unk_1E9C47678;
  v22 = v3;
  v18 = v3;
  v19 = (void *)objc_msgSend(v10, "_newSampleWithType:startDate:endDate:device:metadata:config:", v11, 0, v9, v21, v14, v17);

  return v19;
}

- (HKCodableElectrocardiogramSample)codableECG
{
  HKCodableElectrocardiogramSample *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(HKCodableElectrocardiogramSample);
  v3 = objc_alloc(MEMORY[0x1E0CB3588]);
  objc_msgSend(a1, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);
  objc_msgSend(v6, "hk_codableDateInterval");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableElectrocardiogramSample setDateInterval:](v2, "setDateInterval:", v7);

  -[HKCodableElectrocardiogramSample setClassificationRawValue:](v2, "setClassificationRawValue:", objc_msgSend(a1, "privateClassification"));
  objc_msgSend(a1, "averageHeartRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "codableRepresentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableElectrocardiogramSample setAverageHeartRate:](v2, "setAverageHeartRate:", v9);

  -[HKCodableElectrocardiogramSample setSymptomsStatusRawValue:](v2, "setSymptomsStatusRawValue:", objc_msgSend(a1, "symptomsStatus"));
  -[HKCodableElectrocardiogramSample setPrivateSymptoms:](v2, "setPrivateSymptoms:", objc_msgSend(a1, "privateSymptoms"));
  objc_msgSend(a1, "_algorithmVersion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCodableElectrocardiogramSample setAlgorithmVersionRawValue:](v2, "setAlgorithmVersionRawValue:", objc_msgSend(v10, "longLongValue"));

  return v2;
}

@end
