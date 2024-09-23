@implementation HKDataMetadataSubsampleSection

- (HKDataMetadataSubsampleSection)initWithSample:(id)a3 workoutActivity:(id)a4 subSampleTypes:(id)a5 showOnlyExertion:(BOOL)a6 healthStore:(id)a7 displayTypeController:(id)a8 unitController:(id)a9 subsampleDelegate:(id)a10
{
  _BOOL4 v12;
  id v17;
  id v18;
  id v19;
  HKDataMetadataSubsampleSection *v20;
  HKDataMetadataSubsampleSection *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  NSArray *subSampleTypes;
  NSArray *v26;
  uint64_t v27;
  NSMutableDictionary *aggregationValue;
  HKDataMetadataSubsampleSection *v29;
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  HKDataMetadataSubsampleSection *v36;
  objc_super v37;

  v12 = a6;
  v34 = a3;
  v32 = a4;
  v33 = a5;
  v31 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v37.receiver = self;
  v37.super_class = (Class)HKDataMetadataSubsampleSection;
  v20 = -[HKDataMetadataSubsampleSection init](&v37, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_sample, a3);
    objc_storeStrong((id *)&v21->_workoutActivity, a4);
    objc_storeStrong((id *)&v21->_healthStore, a7);
    objc_storeStrong((id *)&v21->_displayTypeController, a8);
    objc_storeStrong((id *)&v21->_unitController, a9);
    objc_storeWeak((id *)&v21->_subsampleDelegate, v19);
    v21->_showOnlyExertion = v12;
    objc_msgSend(v34, "fixedAggregateValuesWithDisplayTypeController:unitController:", v17, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "allKeys");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSubsampleSection _mergeTypesForFixedValues:subSampleTypes:](v21, "_mergeTypesForFixedValues:subSampleTypes:", v23, v33);
    v24 = objc_claimAutoreleasedReturnValue();
    subSampleTypes = v21->_subSampleTypes;
    v21->_subSampleTypes = (NSArray *)v24;

    if (!-[NSArray count](v21->_subSampleTypes, "count"))
    {

      v29 = 0;
      goto LABEL_8;
    }
    if (v12)
    {
      v26 = v21->_subSampleTypes;
      v21->_subSampleTypes = (NSArray *)MEMORY[0x1E0C9AA60];

    }
    v27 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v22);
    aggregationValue = v21->_aggregationValue;
    v21->_aggregationValue = (NSMutableDictionary *)v27;

    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __164__HKDataMetadataSubsampleSection_initWithSample_workoutActivity_subSampleTypes_showOnlyExertion_healthStore_displayTypeController_unitController_subsampleDelegate___block_invoke;
    v35[3] = &unk_1E9C3F0D0;
    v36 = v21;
    -[HKDataMetadataSubsampleSection _submitSubSampleAggregateQueriesWithCompletion:](v36, "_submitSubSampleAggregateQueriesWithCompletion:", v35);

  }
  v29 = v21;
LABEL_8:

  return v29;
}

void __164__HKDataMetadataSubsampleSection_initWithSample_workoutActivity_subSampleTypes_showOnlyExertion_healthStore_displayTypeController_unitController_subsampleDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 64));
  objc_msgSend(WeakRetained, "finishedAggregateQuery");

}

- (void)_updateAggregateValue:(id)a3 sampleType:(id)a4 aggregateQueryFinishedBlock:(id)a5
{
  NSMutableDictionary *aggregationValue;
  void (**v8)(void);

  aggregationValue = self->_aggregationValue;
  v8 = (void (**)(void))a5;
  -[NSMutableDictionary setObject:forKey:](aggregationValue, "setObject:forKey:", a3, a4);
  v8[2]();

}

- (id)_formattedValueWithUnits:(id)a3 sampleType:(id)a4
{
  HKDisplayTypeController *displayTypeController;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  displayTypeController = self->_displayTypeController;
  v7 = a3;
  -[HKDisplayTypeController displayTypeForObjectType:](displayTypeController, "displayTypeForObjectType:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController unitForDisplayType:](self->_unitController, "unitForDisplayType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v9);
  v11 = v10;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValueForContext(v12, v8, self->_unitController, 0, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKUnitPreferenceController localizedDisplayNameForDisplayType:](self->_unitController, "localizedDisplayNameForDisplayType:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    HKFormatValueAndUnit(v13, v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v13;
  }
  v16 = v15;

  return v16;
}

- (id)_subSampleAggregatePredicate:(id)a3
{
  HKDataMetadataSubsampleDelegate **p_subsampleDelegate;
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;

  p_subsampleDelegate = &self->_subsampleDelegate;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_subsampleDelegate);
  objc_msgSend(WeakRetained, "defaultPredicateForSampleType:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSample subSamplePredicate](self->_sample, "subSamplePredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIPredicateMatchingPredicates(v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_submitSumAggregateQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HKDataMetadataSubsampleSection _subSampleAggregatePredicate:](self, "_subSampleAggregatePredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB6C88]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E9C46220;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = (void *)objc_msgSend(v9, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v11, v8, 16, v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_aggregationValue, "setObject:forKey:", CFSTR(" "), v11);

}

void __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(a3, "sumQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_formattedValueWithUnits:sampleType:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v8[3] = &unk_1E9C40210;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __102__HKDataMetadataSubsampleSection__submitSumAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAggregateValue:sampleType:aggregateQueryFinishedBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_submitAverageAggregateQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HKDataMetadataSubsampleSection _subSampleAggregatePredicate:](self, "_subSampleAggregatePredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB6C88]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E9C46220;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = (void *)objc_msgSend(v9, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v11, v8, 2, v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_aggregationValue, "setObject:forKey:", CFSTR(" "), v11);

}

void __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(a3, "averageQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_formattedValueWithUnits:sampleType:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v8[3] = &unk_1E9C40210;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __106__HKDataMetadataSubsampleSection__submitAverageAggregateQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAggregateValue:sampleType:aggregateQueryFinishedBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_submitSingleValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HKDataMetadataSubsampleSection _subSampleAggregatePredicate:](self, "_subSampleAggregatePredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB6AF8]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E9C3FC08;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = (void *)objc_msgSend(v9, "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v11, v8, 1, 0, v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_aggregationValue, "setObject:forKey:", CFSTR(" "), v11);

}

void __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  objc_msgSend(a3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "quantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_formattedValueWithUnits:sampleType:", v6, *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
    v10[3] = &unk_1E9C40210;
    v8 = *(void **)(a1 + 40);
    v10[4] = *(_QWORD *)(a1 + 32);
    v11 = v7;
    v12 = v8;
    v13 = *(id *)(a1 + 48);
    v9 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v10);

  }
}

uint64_t __101__HKDataMetadataSubsampleSection__submitSingleValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAggregateValue:sampleType:aggregateQueryFinishedBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_submitMaximumValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HKDataMetadataSubsampleSection _subSampleAggregatePredicate:](self, "_subSampleAggregatePredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB6C88]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E9C46220;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = (void *)objc_msgSend(v9, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v11, v8, 8, v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_aggregationValue, "setObject:forKey:", CFSTR(" "), v11);

}

void __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;

  objc_msgSend(a3, "maximumQuantity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_formattedValueWithUnits:sampleType:", v4, *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v8[3] = &unk_1E9C40210;
  v6 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v5;
  v10 = v6;
  v11 = *(id *)(a1 + 48);
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __102__HKDataMetadataSubsampleSection__submitMaximumValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAggregateValue:sampleType:aggregateQueryFinishedBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_submitRangeValueQueryForQuantityType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[HKDataMetadataSubsampleSection _subSampleAggregatePredicate:](self, "_subSampleAggregatePredicate:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB6C88]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke;
  v13[3] = &unk_1E9C46220;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v10 = v7;
  v11 = v6;
  v12 = (void *)objc_msgSend(v9, "initWithQuantityType:quantitySamplePredicate:options:completionHandler:", v11, v8, 12, v13);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_aggregationValue, "setObject:forKey:", CFSTR(" "), v11);

}

void __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HKInteractiveChartNumberRangeFormatter *v13;
  void *v14;
  void *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  objc_msgSend(v4, "maximumQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumQuantity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "displayTypeForObjectType:", *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "unitForDisplayType:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "doubleValueForUnit:", v8);
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v6, "doubleValueForUnit:", v8);
  objc_msgSend(v11, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  -[HKInteractiveChartNumberRangeFormatter stringForMinimumValue:maximumValue:displayType:unitPreferenceController:](v13, "stringForMinimumValue:maximumValue:displayType:unitPreferenceController:", v12, v10, v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2;
  v17[3] = &unk_1E9C40210;
  v15 = *(void **)(a1 + 40);
  v17[4] = *(_QWORD *)(a1 + 32);
  v18 = v14;
  v19 = v15;
  v20 = *(id *)(a1 + 48);
  v16 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], v17);

}

uint64_t __100__HKDataMetadataSubsampleSection__submitRangeValueQueryForQuantityType_aggregateQueryFinishedBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAggregateValue:sampleType:aggregateQueryFinishedBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_submitCountStandHourQueryForSampleType:(id)a3 aggregateQueryFinishedBlock:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD aBlock[5];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke;
  aBlock[3] = &unk_1E9C3FC08;
  aBlock[4] = self;
  v14 = v6;
  v15 = v7;
  v8 = v7;
  v9 = v6;
  v10 = _Block_copy(aBlock);
  -[HKDataMetadataSubsampleSection _subSampleAggregatePredicate:](self, "_subSampleAggregatePredicate:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6AF8]), "initWithSampleType:predicate:limit:sortDescriptors:resultsHandler:", v9, v11, 0, 0, v10);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v12);
  -[NSMutableDictionary setObject:forKey:](self->_aggregationValue, "setObject:forKey:", CFSTR(" "), v9);

}

void __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "startDate");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "endDate");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99D78]);
    objc_msgSend(v7, "setHour:", 1);
    v19 = (void *)v6;
    v20 = (void *)v5;
    objc_msgSend(MEMORY[0x1E0CB7010], "calculateIncludedValuesWithSamples:startDate:endDate:intervalComponents:", v4, v5, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v8);
          objc_msgSend(v8, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v11 += objc_msgSend(v14, "containsObject:", &unk_1E9CED358);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    HKLocalizedStringForNumberWithTemplate(v15, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke_195;
    block[3] = &unk_1E9C40210;
    v17 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v22 = v16;
    v23 = v17;
    v24 = *(id *)(a1 + 48);
    v18 = v16;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

uint64_t __102__HKDataMetadataSubsampleSection__submitCountStandHourQueryForSampleType_aggregateQueryFinishedBlock___block_invoke_195(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateAggregateValue:sampleType:aggregateQueryFinishedBlock:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

- (void)_submitSubSampleAggregateQueriesWithCompletion:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  char v15;
  NSArray *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  HKDataMetadataSubsampleSection *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v24 = self;
  v4 = self->_subSampleTypes;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v25 = *(_QWORD *)v27;
    v7 = *MEMORY[0x1E0CB5DD8];
    v8 = *MEMORY[0x1E0CB5C88];
    v22 = *MEMORY[0x1E0CB4880];
    v23 = *MEMORY[0x1E0CB5C88];
    v9 = 0x1E0CB6000uLL;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v10);
        objc_msgSend(*(id *)(v9 + 2672), "quantityTypeForIdentifier:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v11, "isEqual:", v12) & 1) == 0)
        {
          objc_msgSend(*(id *)(v9 + 2672), "quantityTypeForIdentifier:", v8);
          v13 = v9;
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v11, "isEqual:", v14);

          v9 = v13;
          if ((v15 & 1) != 0)
            goto LABEL_15;
          v16 = v4;
          objc_msgSend(MEMORY[0x1E0CB6978], "categoryTypeForIdentifier:", v22);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            -[NSMutableDictionary objectForKey:](v24->_aggregationValue, "objectForKey:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v19)
            {
              switch(objc_msgSend(v11, "associatedSampleAggregationStyle"))
              {
                case 1:
                  -[HKDataMetadataSubsampleSection _submitSumAggregateQueryForQuantityType:aggregateQueryFinishedBlock:](v24, "_submitSumAggregateQueryForQuantityType:aggregateQueryFinishedBlock:", v18, v21);
                  break;
                case 2:
                  -[HKDataMetadataSubsampleSection _submitAverageAggregateQueryForQuantityType:aggregateQueryFinishedBlock:](v24, "_submitAverageAggregateQueryForQuantityType:aggregateQueryFinishedBlock:", v18, v21);
                  break;
                case 3:
                  -[HKDataMetadataSubsampleSection _submitSingleValueQueryForQuantityType:aggregateQueryFinishedBlock:](v24, "_submitSingleValueQueryForQuantityType:aggregateQueryFinishedBlock:", v18, v21);
                  break;
                case 4:
                  -[HKDataMetadataSubsampleSection _submitMaximumValueQueryForQuantityType:aggregateQueryFinishedBlock:](v24, "_submitMaximumValueQueryForQuantityType:aggregateQueryFinishedBlock:", v18, v21);
                  break;
                case 5:
                  -[HKDataMetadataSubsampleSection _submitRangeValueQueryForQuantityType:aggregateQueryFinishedBlock:](v24, "_submitRangeValueQueryForQuantityType:aggregateQueryFinishedBlock:", v18, v21);
                  break;
                default:
                  break;
              }
            }

            v9 = v13;
          }
          else if (objc_msgSend(v12, "isEqual:", v11))
          {
            -[HKDataMetadataSubsampleSection _submitCountStandHourQueryForSampleType:aggregateQueryFinishedBlock:](v24, "_submitCountStandHourQueryForSampleType:aggregateQueryFinishedBlock:", v11, v21);
          }

          v4 = v16;
          v8 = v23;
        }

LABEL_15:
        ++v10;
      }
      while (v6 != v10);
      v20 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      v6 = v20;
    }
    while (v20);
  }

  -[HKDataMetadataSubsampleSection _submitRateOfExertionFixedValuesWithDisplayTypeController:unitController:healthStore:finishedBlock:](v24, "_submitRateOfExertionFixedValuesWithDisplayTypeController:unitController:healthStore:finishedBlock:", v24->_displayTypeController, v24->_unitController, v24->_healthStore, v21);
}

- (id)_subSampleTypesWithoutWorkoutEffort
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", self->_subSampleTypes);
  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5DD8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v3);

  objc_msgSend(MEMORY[0x1E0CB6A70], "quantityTypeForIdentifier:", *MEMORY[0x1E0CB5C88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", v4);

  return v2;
}

- (void)_submitRateOfExertionFixedValuesWithDisplayTypeController:(id)a3 unitController:(id)a4 healthStore:(id)a5 finishedBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  char isKindOfClass;
  _QWORD v16[5];
  id v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HKDataMetadataSubsampleSection sample](self, "sample");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke;
    v16[3] = &unk_1E9C41CC0;
    v16[4] = self;
    v17 = v13;
    -[HKDataMetadataSubsampleSection _exertionFixedValuesDisplayTypeController:unitController:healthStore:completion:](self, "_exertionFixedValuesDisplayTypeController:unitController:healthStore:completion:", v10, v11, v12, v16);

  }
}

void __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      _HKInitializeLogging();
      v17 = *MEMORY[0x1E0CB5380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_ERROR))
        __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke_cold_1((uint64_t)v7, v17);
    }
    v18 = *(void **)(a1 + 32);
    goto LABEL_11;
  }
  _HKInitializeLogging();
  v8 = (void *)*MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = v8;
    v22 = 138543618;
    v23 = v9;
    v24 = 1024;
    v25 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_1D7813000, v10, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched %i exertion values.", (uint8_t *)&v22, 0x12u);

  }
  v11 = objc_msgSend(v5, "count");
  v12 = *(void **)(a1 + 32);
  if (!v11)
  {
    v18 = *(void **)(a1 + 32);
LABEL_11:
    objc_msgSend(v18, "_subSampleTypesWithoutWorkoutEffort");
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 32);
    *(_QWORD *)(v20 + 32) = v19;

    goto LABEL_12;
  }
  objc_msgSend(v5, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_mergeTypesForFixedValues:subSampleTypes:", v13, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(void **)(v15 + 32);
  *(_QWORD *)(v15 + 32) = v14;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "hk_addEntriesFromNonNilDictionary:", v5);
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)_exertionFixedValuesDisplayTypeController:(id)a3 unitController:(id)a4 healthStore:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t, void *, uint64_t, void *);
  void *v24;
  HKDataMetadataSubsampleSection *v25;
  id v26;
  id v27;
  id v28;

  v9 = a3;
  v10 = a4;
  v11 = a6;
  -[HKDataMetadataSubsampleSection sample](self, "sample");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB6A78];
  objc_msgSend(v12, "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateForObjectWithUUID:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_alloc(MEMORY[0x1E0CB6E48]);
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke;
  v24 = &unk_1E9C46248;
  v25 = self;
  v26 = v9;
  v27 = v10;
  v28 = v11;
  v17 = v10;
  v18 = v9;
  v19 = v11;
  v20 = (void *)objc_msgSend(v16, "initWithPredicate:anchor:options:resultsHandler:", v15, 0, 0, &v21);
  -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", v20, v21, v22, v23, v24, v25);

}

void __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  id v45;
  _QWORD block[4];
  id v47;
  id v48;
  uint8_t buf[4];
  uint64_t v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stopQuery:", a2);
  if (!v8)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_2;
    block[3] = &unk_1E9C40D80;
    v48 = *(id *)(a1 + 56);
    v47 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

    v25 = v48;
    goto LABEL_25;
  }
  if (!objc_msgSend(v8, "count"))
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_3;
    v44[3] = &unk_1E9C41C00;
    v45 = *(id *)(a1 + 56);
    dispatch_async(MEMORY[0x1E0C80D38], v44);
    v25 = v45;
    goto LABEL_25;
  }
  v34 = v9;
  v35 = v8;
  v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  if (!v11)
    goto LABEL_17;
  v12 = v11;
  v13 = *(_QWORD *)v41;
  do
  {
    for (i = 0; i != v12; ++i)
    {
      if (*(_QWORD *)v41 != v13)
        objc_enumerationMutation(v10);
      v15 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
      objc_msgSend(*(id *)(a1 + 32), "workoutActivity");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

      }
      else
      {
        objc_msgSend(v15, "samples");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          goto LABEL_14;
      }
      objc_msgSend(*(id *)(a1 + 32), "workoutActivity");
      v17 = objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        v18 = (void *)v17;
        objc_msgSend(*(id *)(a1 + 32), "workoutActivity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "activity");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "isEqual:", v20);

        if (v21)
        {
LABEL_14:
          objc_msgSend(v15, "samples");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addObjectsFromArray:", v23);

          continue;
        }
      }
    }
    v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v53, 16);
  }
  while (v12);
LABEL_17:

  _HKInitializeLogging();
  v24 = *MEMORY[0x1E0CB5380];
  v25 = v36;
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    v26 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    v50 = v26;
    v51 = 2112;
    v52 = v36;
    _os_log_impl(&dword_1D7813000, v24, OS_LOG_TYPE_DEFAULT, "[%{public}@] Fetched samples %@", buf, 0x16u);
  }
  v27 = objc_msgSend(*(id *)(a1 + 32), "showOnlyExertion");
  v28 = *(void **)(a1 + 32);
  v29 = *(_QWORD *)(a1 + 40);
  v30 = *(_QWORD *)(a1 + 48);
  if (v27)
  {
    objc_msgSend(v28, "_allFixedValuesFromSamples:displayTypeController:unitController:", v36, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setExertionSamples:", v36);
  }
  else
  {
    objc_msgSend(v28, "_mostRelevantFixedValuesFromSamples:displayTypeController:unitController:", v36, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v35;
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_203;
  v37[3] = &unk_1E9C40D80;
  v32 = *(id *)(a1 + 56);
  v38 = v31;
  v39 = v32;
  v33 = v31;
  dispatch_async(MEMORY[0x1E0C80D38], v37);

  v9 = v34;
LABEL_25:

}

uint64_t __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0, *(_QWORD *)(a1 + 32));
}

uint64_t __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __114__HKDataMetadataSubsampleSection__exertionFixedValuesDisplayTypeController_unitController_healthStore_completion___block_invoke_203(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

- (id)_allFixedValuesFromSamples:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject **v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v22;
  uint8_t buf[4];
  HKDataMetadataSubsampleSection *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 304);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 298);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKExertionUtilities filterSamplesOfExertionTypeCode:fromExertionSamples:](HKExertionUtilities, "filterSamplesOfExertionTypeCode:fromExertionSamples:", 304, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)v11;
  -[HKDataMetadataSubsampleSection _fixedValuesfromSamples:ofExertionType:displayTypeController:unitController:](self, "_fixedValuesfromSamples:ofExertionType:displayTypeController:unitController:", v13, v11, v9, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v15 = (NSObject **)MEMORY[0x1E0CB5380];
  v16 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2112;
    v26 = v14;
    _os_log_impl(&dword_1D7813000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received effort %@", buf, 0x16u);
  }
  +[HKExertionUtilities filterSamplesOfExertionTypeCode:fromExertionSamples:](HKExertionUtilities, "filterSamplesOfExertionTypeCode:fromExertionSamples:", 298, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSubsampleSection _fixedValuesfromSamples:ofExertionType:displayTypeController:unitController:](self, "_fixedValuesfromSamples:ofExertionType:displayTypeController:unitController:", v17, v12, v9, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  v19 = *v15;
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v24 = self;
    v25 = 2112;
    v26 = v18;
    _os_log_impl(&dword_1D7813000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received estimated %@", buf, 0x16u);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  objc_msgSend(v20, "hk_addEntriesFromNonNilDictionary:", v14);
  objc_msgSend(v20, "hk_addEntriesFromNonNilDictionary:", v18);

  return v20;
}

- (id)_fixedValuesfromSamples:(id)a3 ofExertionType:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v10;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(obj);
        v18 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "quantity");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "_value");
        objc_msgSend(v18, "numberWithDouble:");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[HKDataMetadataSubsampleSection _formattedDisplayValueFromValue:exertionType:displayTypeController:unitController:](self, "_formattedDisplayValueFromValue:exertionType:displayTypeController:unitController:", v20, v11, v12, v13);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
          objc_msgSend(v24, "setObject:forKey:", v21, v11);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  return v24;
}

- (id)_mostRelevantFixedValuesFromSamples:(id)a3 displayTypeController:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  uint8_t buf[4];
  HKDataMetadataSubsampleSection *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v26 = self;
    _os_log_impl(&dword_1D7813000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] Finding most relevant sample", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 304);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", 298);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKExertionUtilities filterSamplesOfExertionTypeCode:fromExertionSamples:](HKExertionUtilities, "filterSamplesOfExertionTypeCode:fromExertionSamples:", 304, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKExertionUtilities mostRelevantValueFromExertionSamples:](HKExertionUtilities, "mostRelevantValueFromExertionSamples:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKExertionUtilities filterSamplesOfExertionTypeCode:fromExertionSamples:](HKExertionUtilities, "filterSamplesOfExertionTypeCode:fromExertionSamples:", 298, v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKExertionUtilities mostRelevantValueFromExertionSamples:](HKExertionUtilities, "mostRelevantValueFromExertionSamples:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSubsampleSection _formattedDisplayValueFromValue:exertionType:displayTypeController:unitController:](self, "_formattedDisplayValueFromValue:exertionType:displayTypeController:unitController:", v14, v12, v9, v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataMetadataSubsampleSection _formattedDisplayValueFromValue:exertionType:displayTypeController:unitController:](self, "_formattedDisplayValueFromValue:exertionType:displayTypeController:unitController:", v16, v13, v9, v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  _HKInitializeLogging();
  v19 = *MEMORY[0x1E0CB5380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5380], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v26 = self;
    v27 = 2112;
    v28 = v17;
    v29 = 2112;
    v30 = v18;
    _os_log_impl(&dword_1D7813000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Most relevant workout effort %@ and estimated value %@", buf, 0x20u);
  }
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", 2);
  if (v17)
  {
    -[HKDataMetadataSubsampleSection _localizedWorkoutEffortRatingFromValue:stringValue:](self, "_localizedWorkoutEffortRatingFromValue:stringValue:", v14, v17);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, v12);

  }
  if (v18)
  {
    -[HKDataMetadataSubsampleSection _localizedWorkoutEffortRatingFromValue:stringValue:](self, "_localizedWorkoutEffortRatingFromValue:stringValue:", v16, v18);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v22, v13);

  }
  return v20;
}

- (id)_localizedWorkoutEffortRatingFromValue:(id)a3 stringValue:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  int v11;
  void *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if ((int)objc_msgSend(v5, "intValue") > 3)
  {
    if ((int)objc_msgSend(v5, "intValue") > 6)
    {
      v11 = objc_msgSend(v5, "intValue");
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v11 > 8)
        v10 = CFSTR("%@_WORKOUT_LOAD_ALLOUT");
      else
        v10 = CFSTR("%@_WORKOUT_LOAD_HARD");
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = CFSTR("%@_WORKOUT_LOAD_MODERATE");
    }
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("%@_WORKOUT_LOAD_EASY");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_formattedDisplayValueFromValue:(id)a3 exertionType:(id)a4 displayTypeController:(id)a5 unitController:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  if (a3)
  {
    v9 = a6;
    v10 = a3;
    objc_msgSend(a5, "displayTypeForObjectType:", a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitForDisplayType:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_numberFormatterForUnit:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:displayType:unitController:", v10, v11, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (id)sectionTitle
{
  return -[HKSample subSampleSectionTitle](self->_sample, "subSampleSectionTitle");
}

- (unint64_t)numberOfRowsInSection
{
  return -[NSArray count](self->_subSampleTypes, "count");
}

- (id)cellForIndex:(unint64_t)a3 tableView:(id)a4
{
  NSArray *subSampleTypes;
  id v7;
  void *v8;
  void *v9;
  HKDataMetadataSimpleTableViewCell *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  subSampleTypes = self->_subSampleTypes;
  v7 = a4;
  -[NSArray objectAtIndex:](subSampleTypes, "objectAtIndex:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_aggregationValue, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("sub_samples"));
  v10 = (HKDataMetadataSimpleTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v10 = -[HKDataMetadataSimpleTableViewCell initWithReuseIdentifier:]([HKDataMetadataSimpleTableViewCell alloc], "initWithReuseIdentifier:", CFSTR("sub_samples"));
    -[HKDataMetadataSimpleTableViewCell setAccessoryType:](v10, "setAccessoryType:", 1);
  }
  objc_msgSend((id)objc_opt_class(), "displayNameForSampleType:displayTypeController:", v8, self->_displayTypeController);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  switch(objc_msgSend(v8, "associatedSampleAggregationStyle"))
  {
    case 0:
    case 3:
      v12 = v11;
      break;
    case 1:
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("SUBSAMPLE_TYPE_TOTAL %@");
      goto LABEL_10;
    case 2:
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("SUBSAMPLE_TYPE_AVERAGE %@");
      goto LABEL_10;
    case 4:
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("SUBSAMPLE_TYPE_MAXIMUM %@");
      goto LABEL_10;
    case 5:
      v13 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("%@ SUBSAMPLE_TYPE_RANGE");
LABEL_10:
      objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", v17, v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v12 = 0;
      break;
  }
  -[HKDataMetadataSimpleTableViewCell titleTextLabel](v10, "titleTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9)
  {
    objc_msgSend(v18, "setText:", v9);

    -[HKDataMetadataSimpleTableViewCell subtitleTextLabel](v10, "subtitleTextLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    v20 = v12;
  }
  else
  {
    v20 = v11;
  }
  objc_msgSend(v18, "setText:", v20);

  return v10;
}

- (void)selectCellForIndex:(unint64_t)a3 navigationController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  void *v9;
  void *WeakRetained;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a5;
  v14 = a4;
  if (-[HKDataMetadataSubsampleSection showOnlyExertion](self, "showOnlyExertion"))
  {
    -[HKDataMetadataSubsampleSection exertionSamples](self, "exertionSamples");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
    objc_msgSend(WeakRetained, "viewControllerForSampleSelected:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[NSArray objectAtIndex:](self->_subSampleTypes, "objectAtIndex:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKDataMetadataSubsampleSection _subSamplePredicateOnSelectCellForSampleType:](self, "_subSamplePredicateOnSelectCellForSampleType:", v9);
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "displayNameForSampleType:displayTypeController:", v9, self->_displayTypeController);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)&self->_subsampleDelegate);
    objc_msgSend(v13, "viewControllerForSampleType:subSamplePredicate:title:", v9, WeakRetained, v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (v11)
    objc_msgSend(v14, "pushViewController:animated:", v11, v5);

}

- (id)_mergeTypesForFixedValues:(id)a3 subSampleTypes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v7, "containsObject:", v13, (_QWORD)v16) & 1) == 0)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  -[HKDataMetadataSubsampleSection _trimAndSortSampleTypes:](self, "_trimAndSortSampleTypes:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_trimAndSortSampleTypes:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];

  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke;
  v13[3] = &unk_1E9C46270;
  v13[4] = self;
  v6 = a3;
  objc_msgSend(v5, "predicateWithBlock:", v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "filteredArrayUsingPredicate:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v4;
  v12[1] = 3221225472;
  v12[2] = __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke_2;
  v12[3] = &unk_1E9C46298;
  v12[4] = self;
  v9 = _Block_copy(v12);
  objc_msgSend(v8, "sortedArrayUsingComparator:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "displayTypeForObjectType:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __58__HKDataMetadataSubsampleSection__trimAndSortSampleTypes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a3;
  v6 = a2;
  objc_msgSend((id)objc_opt_class(), "displayNameForSampleType:displayTypeController:", v6, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "displayNameForSampleType:displayTypeController:", v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (id)_subSamplePredicateOnSelectCellForSampleType:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "code") == 298 || objc_msgSend(v4, "code") == 304)
  {
    -[HKSample subExertionSamplePredicate](self->_sample, "subExertionSamplePredicate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKSample subSamplePredicate](self->_sample, "subSamplePredicate");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

+ (id)displayNameForSampleType:(id)a3 displayTypeController:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a4, "displayTypeForObjectType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "localization");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HKSample)sample
{
  return self->_sample;
}

- (HKWorkoutActivity)workoutActivity
{
  return self->_workoutActivity;
}

- (NSArray)subSampleTypes
{
  return self->_subSampleTypes;
}

- (BOOL)showOnlyExertion
{
  return self->_showOnlyExertion;
}

- (void)setShowOnlyExertion:(BOOL)a3
{
  self->_showOnlyExertion = a3;
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (HKDataMetadataSubsampleDelegate)subsampleDelegate
{
  return (HKDataMetadataSubsampleDelegate *)objc_loadWeakRetained((id *)&self->_subsampleDelegate);
}

- (NSMutableDictionary)aggregationValue
{
  return self->_aggregationValue;
}

- (void)setAggregationValue:(id)a3
{
  objc_storeStrong((id *)&self->_aggregationValue, a3);
}

- (NSArray)exertionSamples
{
  return self->_exertionSamples;
}

- (void)setExertionSamples:(id)a3
{
  objc_storeStrong((id *)&self->_exertionSamples, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exertionSamples, 0);
  objc_storeStrong((id *)&self->_aggregationValue, 0);
  objc_destroyWeak((id *)&self->_subsampleDelegate);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_subSampleTypes, 0);
  objc_storeStrong((id *)&self->_workoutActivity, 0);
  objc_storeStrong((id *)&self->_sample, 0);
}

void __133__HKDataMetadataSubsampleSection__submitRateOfExertionFixedValuesWithDisplayTypeController_unitController_healthStore_finishedBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D7813000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch rating of exertion samples: %@", (uint8_t *)&v2, 0xCu);
}

@end
