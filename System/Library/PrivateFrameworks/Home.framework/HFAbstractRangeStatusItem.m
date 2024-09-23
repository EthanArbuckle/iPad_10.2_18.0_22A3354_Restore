@implementation HFAbstractRangeStatusItem

uint64_t __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "allCharacteristics");
}

uint64_t __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "batchResponseForService:", a2);
}

id __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  objc_msgSend((id)objc_opt_class(), "characteristicTypesForServiceType:includingAssociatedTypes:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "responseForCharacteristicType:", *(_QWORD *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueWithExpectedClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "value");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "allReadResponses");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "na_any:", &__block_literal_global_11_3);

  return v3;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
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
  id v26;
  id v27;
  void *v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id location;
  _QWORD v35[5];

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "controllableServiceTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sensorServiceTypes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke;
  v35[3] = &unk_1EA726AB8;
  v35[4] = self;
  objc_msgSend(v7, "na_flatMap:", v35);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend((id)objc_opt_class(), "currentValueCharacteristicType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend((id)objc_opt_class(), "targetValueCharacteristicType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "na_safeAddObject:", v12);

  objc_msgSend((id)objc_opt_class(), "minimumTargetValueCharacteristicType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v13);

  objc_msgSend((id)objc_opt_class(), "maximumTargetValueCharacteristicType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v14);

  objc_msgSend((id)objc_opt_class(), "currentModeCharacteristicTypes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v15);

  objc_msgSend((id)objc_opt_class(), "targetModeCharacteristicTypes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unionSet:", v16);

  objc_msgSend((id)objc_opt_class(), "controllableServiceTypes");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allObjects");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:](self, "filteredServicesOfTypes:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "sensorServiceTypes");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "allObjects");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFStatusItem filteredServicesOfTypes:](self, "filteredServicesOfTypes:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setByAddingObjectsFromSet:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  -[HFStatusItem valueSource](self, "valueSource");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "readValuesForCharacteristicTypes:inServices:", v10, v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v8;
  v30[1] = 3221225472;
  v30[2] = __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_2;
  v30[3] = &unk_1EA72E088;
  objc_copyWeak(&v33, &location);
  v26 = v7;
  v31 = v26;
  v27 = v23;
  v32 = v27;
  objc_msgSend(v25, "flatMap:", v30);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v33);
  objc_destroyWeak(&location);

  return v28;
}

+ (id)descriptionStringForCharacteristicType:(id)a3 withResponses:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  HFNumberRangeFormatter *v21;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "responseForCharacteristicType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "characteristic");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "valueRangeForCharacteristicType:withResponses:", v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "midValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "integerValue");

  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a1, "shouldShowAverageForRange:", v11))
    {
      objc_msgSend(v11, "midValue");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "formatValue:forCharacteristic:", v15, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    objc_msgSend((id)objc_opt_class(), "customValueFormatter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      if ((objc_msgSend((id)objc_opt_class(), "isPercentRange") & 1) != 0)
      {
        +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "percentFormatter");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
        v21 = -[HFNumberRangeFormatter initWithNumberFormatter:]([HFNumberRangeFormatter alloc], "initWithNumberFormatter:", v20);
        -[HFNumberRangeFormatter setConsolidatesUnit:](v21, "setConsolidatesUnit:", 1);
        -[HFNumberRangeFormatter setSimplifiesEqualValues:](v21, "setSimplifiesEqualValues:", 1);
        -[HFNumberRangeFormatter stringForNumberRange:](v21, "stringForNumberRange:", v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      objc_msgSend((id)objc_opt_class(), "_defaultValueFormatter");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v20 = v18;
    goto LABEL_11;
  }
  objc_msgSend((id)objc_opt_class(), "unknownValueDescriptionString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v14;
}

id __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
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
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  const __CFString *v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "standardResultsForBatchReadResponse:serviceTypes:", v3, *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("tempreatureUnitDependency"));
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("hidden"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
    {
      v10 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "futureWithResult:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = *(void **)(a1 + 40);
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __57__HFAbstractRangeStatusItem__subclass_updateWithOptions___block_invoke_3;
      v37[3] = &unk_1EA72DFA0;
      v38 = v3;
      objc_msgSend(v16, "na_map:", v37);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "na_filter:", &__block_literal_global_59);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "statusItemCategory"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("statusItemCategory"));

      v20 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "currentValueCharacteristicType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "descriptionStringForCharacteristicType:withResponses:", v21, v18);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("description"));

      v23 = (void *)objc_opt_class();
      objc_msgSend((id)objc_opt_class(), "currentValueCharacteristicType");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueRangeForCharacteristicType:withResponses:", v24, v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, CFSTR("statusCurrentValue"));

      objc_msgSend(v18, "na_flatMap:", &__block_literal_global_14_2);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFCharacteristicBatchReadResponse aggregatedMetadataForCharacteristics:](HFCharacteristicBatchReadResponse, "aggregatedMetadataForCharacteristics:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)objc_opt_class(), "overrideValueDisplayRange");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v28, CFSTR("statusPossibleValues"));
      }
      else
      {
        v35 = v18;
        objc_msgSend(v27, "maximumValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "minimumValue");
        v36 = v17;
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("statusPossibleValues"));

        v18 = v35;
        v17 = v36;

      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("representedHomeKitObjects"));
      v32 = (void *)MEMORY[0x1E0D519C0];
      +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v7);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "futureWithResult:", v33);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = v38;
    }

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0D519C0];
    v39 = CFSTR("hidden");
    v40[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "futureWithResult:", v15);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)valueRangeForCharacteristicType:(id)a3 withResponses:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  id v34;

  v6 = a3;
  v7 = a4;
  v8 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke;
  v33[3] = &unk_1EA72E0B0;
  v9 = v6;
  v34 = v9;
  objc_msgSend(v7, "na_map:", v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v27 = 0;
    v28 = &v27;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__9;
    v31 = __Block_byref_object_dispose__9;
    objc_msgSend(v10, "anyObject");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__9;
    v25 = __Block_byref_object_dispose__9;
    objc_msgSend(v10, "anyObject");
    v26 = (id)objc_claimAutoreleasedReturnValue();
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_20;
    v20[3] = &unk_1EA72E0D8;
    v20[4] = &v27;
    v20[5] = &v21;
    objc_msgSend(v10, "na_each:", v20);
    +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v22[5], v28[5]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "shouldShowAverageForRange:", v11))
    {
      v16 = 0;
      v17 = (double *)&v16;
      v18 = 0x2020000000;
      v19 = 0;
      v15[0] = v8;
      v15[1] = 3221225472;
      v15[2] = __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_2;
      v15[3] = &unk_1EA72E100;
      v15[4] = &v16;
      objc_msgSend(v10, "na_each:", v15);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17[3] / (double)(unint64_t)objc_msgSend(v10, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HFNumberRange valueWithValue:](HFNumberRange, "valueWithValue:", v12);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      v13 = v11;
    }

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v27, 8);

  }
  else
  {
    +[HFNumberRange valueWithValue:](HFNumberRange, "valueWithValue:", &unk_1EA7CBE78);
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

+ (id)customValueFormatter
{
  return 0;
}

+ (unint64_t)statusItemCategory
{
  return 4;
}

+ (NSSet)serviceTypes
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "controllableServiceTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sensorServiceTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObjectsFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v5;
}

- (id)iconDescriptorForRepresentedHomeKitObjects:(id)a3
{
  return 0;
}

+ (id)controllableServiceTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 55, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem controllableServiceTypes]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)sensorServiceTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 62, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem sensorServiceTypes]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)currentValueCharacteristicType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 69, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem currentValueCharacteristicType]", objc_opt_class());

  return 0;
}

+ (id)targetValueCharacteristicType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 76, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem targetValueCharacteristicType]", objc_opt_class());

  return 0;
}

+ (id)minimumTargetValueCharacteristicType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 83, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem minimumTargetValueCharacteristicType]", objc_opt_class());

  return 0;
}

+ (id)maximumTargetValueCharacteristicType
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 90, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem maximumTargetValueCharacteristicType]", objc_opt_class());

  return 0;
}

+ (id)currentModeCharacteristicTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 97, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem currentModeCharacteristicTypes]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)targetModeCharacteristicTypes
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 104, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem targetModeCharacteristicTypes]", objc_opt_class());

  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

+ (id)unknownValueDescriptionString
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 111, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem unknownValueDescriptionString]", objc_opt_class());

  return 0;
}

+ (id)overrideValueDisplayRange
{
  return 0;
}

+ (id)displayValueComparator
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 124, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem displayValueComparator]", objc_opt_class());

  return 0;
}

+ (unint64_t)abstractTargetModeInResponse:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 136, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem abstractTargetModeInResponse:]", objc_opt_class());

  return 0;
}

+ (unint64_t)abstractCurrentModeInResponse:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 142, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem abstractCurrentModeInResponse:]", objc_opt_class());

  return 0;
}

+ (BOOL)isPercentRange
{
  return 0;
}

+ (BOOL)shouldShowAverageForRange:(id)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HFAbstractRangeStatusItem.m"), 155, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "+[HFAbstractRangeStatusItem shouldShowAverageForRange:]", objc_opt_class());

  return 0;
}

void __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_20(uint64_t a1, void *a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "doubleValue");
  v5 = v4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "doubleValue");
  if (v5 < v6)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  objc_msgSend(v10, "doubleValue");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "doubleValue");
  if (v8 > v9)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

}

double __75__HFAbstractRangeStatusItem_valueRangeForCharacteristicType_withResponses___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v4;
  double result;

  objc_msgSend(a2, "doubleValue");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v4 + *(double *)(v3 + 24);
  *(double *)(v3 + 24) = result;
  return result;
}

+ (id)formatValue:(id)a3 forCharacteristic:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  HFRelativePercentValue *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "customValueFormatter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {

  }
  else if (objc_msgSend((id)objc_opt_class(), "isPercentRange"))
  {
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "percentFormatter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = -[HFRelativePercentValue initWithValue:forCharacteristic:]([HFRelativePercentValue alloc], "initWithValue:forCharacteristic:", v5, v6);
    objc_msgSend(v9, "stringForRelativePercentValue:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_9;
  }
  objc_msgSend((id)objc_opt_class(), "customValueFormatter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_defaultValueFormatter");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v14;

  objc_msgSend(v9, "stringForObjectValue:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v11;
}

+ (id)_defaultValueFormatter
{
  void *v2;
  id v3;

  if (objc_msgSend((id)objc_opt_class(), "isPercentRange"))
  {
    +[HFFormatterManager sharedInstance](HFFormatterManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "percentFormatter");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  }
  return v3;
}

@end
