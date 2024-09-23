@implementation HKQuantitySample(HKMenstrualCycles)

+ (id)hkmc_quantitySampleWithBasalBodyTemperature:()HKMenstrualCycles date:
{
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = (void *)MEMORY[0x24BDD3E68];
  v7 = (void *)MEMORY[0x24BDD3E80];
  v8 = a4;
  v9 = a3;
  objc_msgSend(v7, "_quantityTypeWithCode:", 90);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hkmc_defaultMetadata");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v10, v9, v8, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)hkmc_quantitySampleWithWristTemperature:()HKMenstrualCycles startDate:endDate:
{
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;

  v7 = (void *)MEMORY[0x24BDD3E68];
  v8 = (void *)MEMORY[0x24BDD3E80];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "_quantityTypeWithCode:", 256);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v12, v11, v10, v9, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
