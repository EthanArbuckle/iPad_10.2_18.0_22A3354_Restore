@implementation HKElectrocardiogram(HDCodingSupport)

- (HDCodableECGSample)codableRepresentationForSync
{
  HDCodableECGSample *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v2 = objc_alloc_init(HDCodableECGSample);
  v9.receiver = a1;
  v9.super_class = (Class)&off_1EF222FC0;
  objc_msgSendSuper2(&v9, sel_codableRepresentationForSync);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableECGSample setSample:](v2, "setSample:", v3);

  objc_msgSend(a1, "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableECGSample setVoltagePayload:](v2, "setVoltagePayload:", v4);

  -[HDCodableECGSample setPrivateClassification:](v2, "setPrivateClassification:", objc_msgSend(a1, "privateClassification"));
  -[HDCodableECGSample setSymptomsStatus:](v2, "setSymptomsStatus:", objc_msgSend(a1, "symptomsStatus"));
  objc_msgSend(a1, "averageHeartRate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "averageHeartRate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "_countPerMinuteUnit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v7);
    -[HDCodableECGSample setAverageHeartRateInBPM:](v2, "setAverageHeartRateInBPM:");

  }
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
    objc_msgSend(v4, "addEcgSamples:", v5);

  return v5 != 0;
}

+ (id)createWithCodable:()HDCodingSupport
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = (void *)objc_msgSend([a1 alloc], "_init");
    if (objc_msgSend(v5, "applyToObject:", v6))
    {
      v7 = HKDefaultObjectValidationConfigurationIgnoringAllOptions();
      objc_msgSend(v6, "_validateWithConfiguration:", v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
        v10 = 0;
      else
        v10 = v6;
      v11 = v10;

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end
