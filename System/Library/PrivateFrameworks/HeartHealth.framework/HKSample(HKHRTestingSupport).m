@implementation HKSample(HKHRTestingSupport)

+ (uint64_t)hkhr_bloodPressureSampleForDate:()HKHRTestingSupport
{
  return objc_msgSend(a1, "hkhr_bloodPressureSampleForDate:timeZone:", a3, 0);
}

+ (id)hkhr_bloodPressureSampleForDate:()HKHRTestingSupport timeZone:
{
  id v5;
  __CFString *v6;
  __CFString *v7;
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
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6 || !-[__CFString length](v6, "length"))
  {

    v7 = CFSTR("America/Los_Angeles");
  }
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = *MEMORY[0x1E0CB55E0];
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", CFSTR("mmHg"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "quantityWithUnit:doubleValue:", v12, 100.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v15, v13, v5, v5, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x1E0CB6A40];
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5AA0]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "quantitySampleWithType:quantity:startDate:endDate:metadata:", v18, v13, v5, v5, v10);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (void *)MEMORY[0x1E0CB6518];
  objc_msgSend(MEMORY[0x1E0CB6978], "correlationTypeForIdentifier:", *MEMORY[0x1E0CB4AB8]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v16, v19, 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "correlationWithType:startDate:endDate:objects:metadata:", v21, v5, v5, v22, v10);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

@end
