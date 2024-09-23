@implementation HKCategorySample(HKMenstrualCycles)

+ (id)hkmc_categorySampleWithMenstrualFlow:()HKMenstrualCycles date:startOfCycle:
{
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = HKMCCategoryValueVaginalBleedingFromBleedingFlow(a3);
  if (v9 == HKMCCategoryValueNotSet)
  {
    v10 = 0;
  }
  else
  {
    v11 = v9;
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = *MEMORY[0x24BDD31E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_dictionaryByAddingEntriesFromDictionary:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3990], "menstrualFlowType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v16, v11, v8, v8, v15);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v10;
}

+ (id)hkmc_categorySampleWithBleedingFlow:()HKMenstrualCycles forBleedingType:date:startOfCycle:
{
  id v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  switch(a4)
  {
    case 2:
      v12 = (void *)MEMORY[0x24BDD3990];
      v13 = (_QWORD *)MEMORY[0x24BDD2870];
LABEL_7:
      objc_msgSend(v12, "categoryTypeForIdentifier:", *v13);
      v11 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      v12 = (void *)MEMORY[0x24BDD3990];
      v13 = (_QWORD *)MEMORY[0x24BDD2878];
      goto LABEL_7;
    case 0:
      objc_msgSend(MEMORY[0x24BDD3990], "menstrualFlowType");
      v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = (void *)v11;
      goto LABEL_10;
  }
  v14 = 0;
LABEL_10:
  v15 = HKMCCategoryValueVaginalBleedingFromBleedingFlow(a3);
  if (v15 == HKMCCategoryValueNotSet)
  {
    v16 = 0;
  }
  else
  {
    v17 = v15;
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = *MEMORY[0x24BDD31E0];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_dictionaryByAddingEntriesFromDictionary:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v14, v17, v10, v10, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v16;
}

+ (id)hkmc_categorySampleWithCervicalMucusQuality:()HKMenstrualCycles date:
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = HKMCCategoryValueCervicalMucusQualityFromCervicalMucusQuality(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 91);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v10, v9, v6, v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)hkmc_categorySampleWithOvulationTestResult:()HKMenstrualCycles date:
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = HKMCCategoryValueOvulationTestResultFromOvulationTestResult(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 92);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v10, v9, v6, v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)hkmc_categorySampleWithPregnancyTestResult:()HKMenstrualCycles date:
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = HKMCCategoryValuePregnancyTestResultFromPregnancyTestResult(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 243);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v10, v9, v6, v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)hkmc_categorySampleWithProgesteroneTestResult:()HKMenstrualCycles date:
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = HKMCCategoryValueProgesteroneTestResultFromProgesteroneTestResult(a3);
  if (v7 == HKMCCategoryValueNotSet)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 244);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v10, v9, v6, v6, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)hkmc_categorySampleWithSexualActivity:()HKMenstrualCycles date:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t *v9;
  uint64_t *v10;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 0;
  v6 = a4;
  objc_msgSend(a1, "hkmc_defaultMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
  {
    v16 = *MEMORY[0x24BDD31F8];
    v17 = MEMORY[0x24BDBD1C0];
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = &v17;
    v10 = &v16;
    goto LABEL_7;
  }
  if (a3 == 1)
  {
    v18 = *MEMORY[0x24BDD31F8];
    v19[0] = MEMORY[0x24BDBD1C8];
    v8 = (void *)MEMORY[0x24BDBCE70];
    v9 = v19;
    v10 = &v18;
LABEL_7:
    objc_msgSend(v8, "dictionaryWithObjects:forKeys:count:", v9, v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "hk_dictionaryByAddingEntriesFromDictionary:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
  }
  objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", 97);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v14, 0, v6, v6, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)hkmc_categorySampleWithMenstrualSymptom:()HKMenstrualCycles date:
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = HKMCDataTypeCodeFromMenstrualSymptom(a3);
  if (v7 == HKMCDataTypeCodeNotSet)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD3990], "_categoryTypeWithCode:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "hkmc_defaultMetadata");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v9, 0, v6, v6, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

+ (id)hkmc_intermenstrualBleedingCategorySampleWithDate:()HKMenstrualCycles
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x24BDD3990];
  v5 = a3;
  objc_msgSend(v4, "_categoryTypeWithCode:", 96);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hkmc_defaultMetadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v6, 0, v5, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)hkmc_categorySampleWithCycleFactor:()HKMenstrualCycles startDate:endDate:
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = HKMCDataTypeCodeFromCycleFactors(a3);
  if (v10 == 193)
    v11 = HKMCCategoryValueContraceptiveFromCycleFactor(a3);
  else
    v11 = 0;
  objc_msgSend(MEMORY[0x24BDD3990], "dataTypeWithCode:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hkmc_defaultMetadata");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v12, v11, v9, v8, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

+ (id)hkmc_pregnancyCategorySampleWithStartDate:()HKMenstrualCycles startTimeZoneID:endDate:startDateSource:embryoAgeInDays:detailsRecordedOnDate:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  v14 = a7;
  v15 = a8;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  objc_msgSend(a1, "hkmc_defaultMetadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v19, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a6);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKey:", v21, *MEMORY[0x24BDD43F0]);

  objc_msgSend(v20, "setValue:forKey:", v17, *MEMORY[0x24BDD3220]);
  if (v14)
    objc_msgSend(v20, "setObject:forKey:", v14, *MEMORY[0x24BDD43E8]);
  if (v15)
    objc_msgSend(v20, "setObject:forKey:", v15, *MEMORY[0x24BDD43E0]);
  objc_msgSend(MEMORY[0x24BDD3990], "dataTypeWithCode:", 191);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "categorySampleWithType:value:startDate:endDate:metadata:", v22, 0, v18, v16, v20);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (uint64_t)hkmc_daySummaryMenstrualFlow
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 95)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 202, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCBleedingFlowFromCategoryValueVaginalBleeding(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummaryBleedingInPregnancyFlow
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 313)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 207, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCBleedingFlowFromCategoryValueVaginalBleeding(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummaryBleedingAfterPregnancyFlow
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 314)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 212, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCBleedingFlowFromCategoryValueVaginalBleeding(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummaryCervicalMucusQuality
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 91)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 223, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCCervicalMucusQualityFromCategoryValueCervicalMucusQuality(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummaryOvulationTestResult
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 92)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 228, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCOvulationTestResultFromCategoryValueOvulationTestResult(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummaryPregnancyTestResult
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 243)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 233, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCPregnancyTestResultFromCategoryValuePregnancyTestResult(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummaryProgesteroneTestResult
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 244)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 238, CFSTR("%@: Invalid data type: %@"), v8, v10);

  }
  return HKMCProgesteroneTestResultFromCategoryValueProgesteroneTestResult(objc_msgSend(a1, "value"));
}

- (uint64_t)hkmc_daySummarySexualActivity
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if (v5 != 97)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    objc_msgSend(a1, "categoryType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 243, CFSTR("%@: Invalid data type: %@"), v11, v13);

  }
  objc_msgSend(a1, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD31F8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (objc_msgSend(v7, "BOOLValue"))
      v8 = 1;
    else
      v8 = 3;
  }
  else
  {
    v8 = 2;
  }

  return v8;
}

- (uint64_t)hkmc_daySummarySymptom
{
  void *v3;
  uint64_t v4;

  if ((objc_msgSend(a1, "hkmc_isNotPresentSymptom") & 1) != 0)
    return 0;
  objc_msgSend(a1, "categoryType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HKMCMenstrualSymptomFromDataTypeCode(objc_msgSend(v3, "code"));

  return v4;
}

- (uint64_t)hkmc_cycleFactor
{
  void *v4;
  uint64_t v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  switch(v5)
  {
    case 193:
      v7 = objc_msgSend(a1, "value");
      if ((unint64_t)(v7 - 1) < 7)
        return v7 + 2;
      break;
    case 192:
      return 1;
    case 191:
      return 2;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_opt_class();
  objc_msgSend(a1, "categoryType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 285, CFSTR("%@: Invalid data type: %@"), v9, v11);

  return 0;
}

- (uint64_t)hkmc_deviationType
{
  void *v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "categoryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "code");

  if ((unint64_t)(v5 - 262) < 4)
    return qword_218AC7DA0[v5 - 262];
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  objc_msgSend(a1, "categoryType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKCategorySample+HKMenstrualCycles.m"), 301, CFSTR("%@: Invalid data type: %@"), v8, v10);

  return 0;
}

@end
