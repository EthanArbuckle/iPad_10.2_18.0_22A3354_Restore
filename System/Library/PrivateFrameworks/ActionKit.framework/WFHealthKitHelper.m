@implementation WFHealthKitHelper

+ (void)sourcesForSampleType:(id)a3 completion:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  v6 = (void *)MEMORY[0x24BDD3C40];
  v7 = a3;
  objc_msgSend(v6, "wf_shortcutsAppHealthStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BDD3FC8]);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __53__WFHealthKitHelper_sourcesForSampleType_completion___block_invoke;
  v12[3] = &unk_24F8BB1F8;
  v13 = v5;
  v10 = v5;
  v11 = (void *)objc_msgSend(v9, "initWithSampleType:samplePredicate:completionHandler:", v7, 0, v12);

  objc_msgSend(v8, "executeQuery:", v11);
}

+ (void)sourcesWithName:(id)a3 ofSampleType:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __61__WFHealthKitHelper_sourcesWithName_ofSampleType_completion___block_invoke;
  v12[3] = &unk_24F8BB220;
  v13 = v8;
  v14 = v9;
  v10 = v8;
  v11 = v9;
  objc_msgSend(a1, "sourcesForSampleType:completion:", a4, v12);

}

+ (id)extractHKDataFromContentQuery:(id)a3
{
  id v3;
  void (**v4)(_QWORD, _QWORD);
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
  WFHKContentQueryData *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];
  uint64_t v31;
  id *v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v3 = a3;
  v31 = 0;
  v32 = (id *)&v31;
  v33 = 0x3042000000;
  v34 = __Block_byref_object_copy__48038;
  v35 = __Block_byref_object_dispose__48039;
  v36 = 0;
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __51__WFHealthKitHelper_extractHKDataFromContentQuery___block_invoke;
  v30[3] = &unk_24F8BB248;
  v30[4] = &v31;
  v4 = (void (**)(_QWORD, _QWORD))objc_msgSend(v30, "copy");
  objc_storeWeak(v32 + 5, v4);
  objc_msgSend(v3, "predicate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("property.propertyClass = %@ AND value != nil"), objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("property.name = 'Type' AND comparisonType = %i"), 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v9);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("property.name = 'Source' AND comparisonType = %i"), 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("comparisonType = %i OR comparisonType = %i"), 2, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "valueForKeyPath:", CFSTR("@max.value"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("comparisonType = %i OR comparisonType = %i"), 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "filteredArrayUsingPredicate:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("@min.value"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "value");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v8;
  v27 = v3;

  objc_msgSend(v28, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "value");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc_init(WFHKContentQueryData);
  -[WFHKContentQueryData setStartDate:](v21, "setStartDate:", v13);
  -[WFHKContentQueryData setEndDate:](v21, "setEndDate:", v16);
  +[WFHealthKitHelper sampleTypeIdentifierFromReadableTypeIdentifier:](WFHealthKitHelper, "sampleTypeIdentifierFromReadableTypeIdentifier:", v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(MEMORY[0x24BDD3F08], "quantityTypeForIdentifier:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  -[WFHKContentQueryData setQuantityType:](v21, "setQuantityType:", v23);
  if (v22)
  {

    objc_msgSend(MEMORY[0x24BDD3F08], "categoryTypeForIdentifier:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  -[WFHKContentQueryData setCategoryType:](v21, "setCategoryType:", v24);
  if (v22)

  -[WFHKContentQueryData setSourceName:](v21, "setSourceName:", v20);
  _Block_object_dispose(&v31, 8);
  objc_destroyWeak(&v36);

  return v21;
}

+ (void)validUnitsForQuantityType:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    WFHealthKitAllAvailableUnits();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke;
    v19[3] = &unk_24F8BB270;
    v10 = v5;
    v20 = v10;
    objc_msgSend(v8, "if_compactMap:", v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD3C40], "wf_shortcutsAppHealthStore");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke_2;
    v15[3] = &unk_24F8BB298;
    v16 = v10;
    v17 = v11;
    v18 = v7;
    v14 = v11;
    objc_msgSend(v12, "preferredUnitsForQuantityTypes:completion:", v13, v15);

  }
  else
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

+ (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4
{
  return (id)objc_msgSend(a1, "localizedDisplayNameForUnit:value:quantityTypeIdentifier:", a3, a4, 0);
}

+ (id)localizedDisplayNameForUnit:(id)a3 quantityTypeIdentifier:(id)a4
{
  return (id)objc_msgSend(a1, "localizedDisplayNameForUnit:value:quantityTypeIdentifier:", a3, 0, a4);
}

+ (id)localizedDisplayNameForUnit:(id)a3 value:(id)a4 quantityTypeIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  int v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  int v15;
  __CFString *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  id v25;
  void *v26;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD4048], "countUnit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD3680]) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD3620]))
    {
      v12 = CFSTR("count of swimming strokes, wheelchair pushes");
LABEL_5:
      WFLocalizedStringWithKey(v12, CFSTR("count"));
      v13 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v23 = (void *)v13;
      goto LABEL_19;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x24BDD3678]))
    {
      v12 = CFSTR("count of steps");
      goto LABEL_5;
    }
    v16 = CFSTR("count");
LABEL_17:
    WFLocalizedString(v16);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDD4048], "meterUnitWithMetricPrefix:", 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isEqual:", v14);

  if (v15)
  {
    v16 = CFSTR("mm");
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD4048], "jouleUnit");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v7, "isEqual:", v17);

  if (v18)
  {
    v16 = CFSTR("J");
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD4048], "ounceUnit");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v7, "isEqual:", v19);

  if (v20)
  {
    v16 = CFSTR("oz");
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD4048], "_countPerMinuteUnit");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v7, "isEqual:", v21);

  if (v22)
  {
    v16 = CFSTR("count/min");
    goto LABEL_17;
  }
  v25 = objc_alloc_init(getHKUnitPreferenceControllerClass());
  objc_msgSend(v25, "localizedDisplayNameForUnit:value:", v7, v8);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v26, "length"))
    objc_msgSend(v25, "localizedDisplayNameForUnit:value:", v7, v8);
  else
    objc_msgSend(v7, "unitString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v23;
}

+ (id)sampleTypeIdentifierFromReadableTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableSampleTypeIdentifierFromSampleTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  WFHealthKitReadableSampleTypeToSampleTypeIdentifierDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)readableBiologicalSexFromEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  WFLocalizedParameterValueMarker(off_24F8BB2D8[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)readableBloodTypeFromEnum:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return 0;
  WFLocalizedParameterValueMarker(off_24F8BB2F8[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)characteristicTypeIdentifierFromReadableTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableTypeIdentifierFromCharacteristicTypeIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  WFHealthKitReadableCharacteristicTypeToCharacteristicTypeIdentifierDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)readableWorkoutActivityTypeIsValid:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 != 0;
}

+ (unint64_t)workoutActivityTypeFromReadableWorkoutActivityType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unint64_t v6;

  v3 = a3;
  WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

+ (id)readableWorkoutActivityTypeFromWorkoutActivityType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableWorkoutActivityTypeToWorkoutActivityTypeDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableAppleStandingHourValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableAppleStandingHourFromEnum:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "readableAppleStandingHourFromEnum:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableCervicalMucusQualityValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableCervicalMucusQualityFromEnum:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readableCervicalMucusQualityFromEnum:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(a1, "readableCervicalMucusQualityFromEnum:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(a1, "readableCervicalMucusQualityFromEnum:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(a1, "readableCervicalMucusQualityFromEnum:", 5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[4] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)readableMenstrualFlowValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableMenstrualFlowFromEnum:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(a1, "readableMenstrualFlowFromEnum:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(a1, "readableMenstrualFlowFromEnum:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(a1, "readableMenstrualFlowFromEnum:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableMenstrualFlowIsStartOfCycleValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableMenstrualFlowIsStartOfCycleFromBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "readableMenstrualFlowIsStartOfCycleFromBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableOvulationTestResultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableOvulationTestResultFromEnum:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v3;
  objc_msgSend(a1, "readableOvulationTestResultFromEnum:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(a1, "readableOvulationTestResultFromEnum:", 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v5;
  objc_msgSend(a1, "readableOvulationTestResultFromEnum:", 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableSleepAnalysisValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableSleepAnalysisFromEnum:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readableSleepAnalysisFromEnum:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "readableSleepAnalysisFromEnum:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)readableSexualActivityValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableSexualActivityFromBool:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "readableSexualActivityFromBool:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableAppleStandingHourFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableAppleStandingHourToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableCervicalMucusQualityFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableCervicalMucusQualityToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableMenstrualFlowFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableMenstrualFlowToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableMenstrualFlowIsStartOfCycleFromBool:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  WFHealthKitReadableMenstrualFlowIsStartOfCycleToBoolDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableOvulationTestResultFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableOvulationTestResultToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableSleepAnalysisFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableSleepAnalysisToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableSexualActivityFromBool:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  WFHealthKitReadableSexualActivityToBoolDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableAppetiteChangesValueFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableAppetiteChangesToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readablePresenceValueFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadablePresenceToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableSeverityValueFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableSeverityToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)enumFromReadableAppleStandingHour:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableAppleStandingHourToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (int64_t)enumFromReadableCervicalMucusQuality:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableCervicalMucusQualityToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (int64_t)enumFromReadableMenstrualFlow:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableMenstrualFlowToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (id)BOOLFromReadableMenstrualFlowIsStartOfCycle:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFHealthKitReadableMenstrualFlowIsStartOfCycleToBoolDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (int64_t)enumFromReadableOvulationTestResult:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableOvulationTestResultToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (int64_t)enumFromReadableSleepAnalysis:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableSleepAnalysisToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (id)BOOLFromReadableSexualActivity:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  WFHealthKitReadableSexualActivityToBoolDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableInsulinDeliveryReasonValues
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableInsulinDeliveryReasonFromEnum:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(a1, "readableInsulinDeliveryReasonFromEnum:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)readableBloodGlucoseMealTimeValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  WFLocalizedParameterValueMarker(CFSTR("Unspecified"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readableBloodGlucoseMealTimeFromEnum:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "readableBloodGlucoseMealTimeFromEnum:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)readableVO2MaxTestTypeValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "readableVO2MaxTestTypeFromEnum:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readableVO2MaxTestTypeFromEnum:", 2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(a1, "readableVO2MaxTestTypeFromEnum:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)readableInsulinDeliveryReasonFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableInsulinDeliveryReasonToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableBloodGlucoseMealTimeFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableBloodGlucoseMealTimeToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)readableVO2MaxTestTypeFromEnum:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WFHealthKitReadableVO2MaxTestTypeToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeysForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (int64_t)enumFromReadableInsulinDeliveryReason:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableInsulinDeliveryReasonToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (int64_t)enumFromReadableBloodGlucoseMealTime:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableBloodGlucoseMealTimeToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

+ (int64_t)enumFromReadableVO2MaxTestType:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;

  v3 = a3;
  WFHealthKitReadableVO2MaxTestTypeToEnumDictionary();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "integerValue");
  return v6;
}

id __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  if (objc_msgSend(v2, "isCompatibleWithUnit:", v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

void __58__WFHealthKitHelper_validUnitsForQuantityType_completion___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "mutableCopy");
  if (v7)
  {
    v4 = objc_msgSend(v3, "indexOfObject:", v7);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v3, "insertObject:atIndex:", v7, 0);
    else
      objc_msgSend(v3, "exchangeObjectAtIndex:withObjectAtIndex:", 0, v4);
  }
  v5 = *(_QWORD *)(a1 + 48);
  v6 = (void *)objc_msgSend(v3, "copy");
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);

}

id __51__WFHealthKitHelper_extractHKDataFromContentQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (**WeakRetained)(id, _QWORD);
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    v5 = (void *)objc_opt_new();
    if (objc_msgSend(v4, "compoundPredicateType") == 1)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      objc_msgSend(v4, "subpredicates", 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v16;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v16 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
            WeakRetained = (void (**)(id, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                        + 40));
            WeakRetained[2](WeakRetained, v11);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "addObjectsFromArray:", v13);

            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v8);
      }

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = v3;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = (void *)MEMORY[0x24BDBD1A8];
    }
  }

  return v5;
}

void __61__WFHealthKitHelper_sourcesWithName_ofSampleType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  id obj;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(_QWORD *)(a1 + 40);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
  }
  else
  {
    v19 = v5;
    v20 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = v5;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v8)
    {
      v9 = v8;
      v22 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v22)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v11, "name");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = a1;
          objc_msgSend(*(id *)(a1 + 32), "stringByReplacingOccurrencesOfString:withString:", CFSTR(" "), CFSTR(" "));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v13, "isEqualToString:", v15);

          if (v16)
            objc_msgSend(v20, "addObject:", v11);
          a1 = v14;
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v9);
    }

    v17 = *(_QWORD *)(a1 + 40);
    if (v17)
    {
      v18 = (void *)objc_msgSend(v20, "copy");
      (*(void (**)(uint64_t, void *, _QWORD))(v17 + 16))(v17, v18, 0);

    }
    v6 = 0;
    v5 = v19;
  }

}

uint64_t __53__WFHealthKitHelper_sourcesForSampleType_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a3, a4);
  return result;
}

@end
