@implementation HKMobilityUtilities

+ (int64_t)classificationForAppleWalkingSteadinessValue:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v5 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(a1, "classificationForAppleWalkingSteadinessQuantity:", v7);
  return v8;
}

+ (int64_t)classificationForAppleWalkingSteadinessQuantity:(id)a3
{
  HKQuantity *v5;
  BOOL v6;
  NSError *v7;
  void *v8;
  void *v9;
  HKAppleWalkingSteadinessClassification v10;
  void *v12;
  NSError *v13;
  HKAppleWalkingSteadinessClassification classificationOut;

  v5 = (HKQuantity *)a3;
  v13 = 0;
  classificationOut = 0;
  v6 = HKAppleWalkingSteadinessClassificationForQuantity(v5, &classificationOut, &v13);
  v7 = v13;
  if (!v6)
  {
    _HKInitializeLogging();
    v8 = (void *)*MEMORY[0x1E0CB5328];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
      +[HKMobilityUtilities classificationForAppleWalkingSteadinessQuantity:].cold.1(v8, v5, v7);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMobilityUtilities.m"), 46, CFSTR("Unable to classify provided quantity or value"));

  }
  v10 = classificationOut;
  if (!classificationOut)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKMobilityUtilities.m"), 47, CFSTR("Invalid walking steadiness classification value"));

    v10 = classificationOut;
  }

  return v10;
}

+ (id)localizedTitleForClassification:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_localizedStringForClassification:narrow:", a3, 0);
}

+ (id)localizedDescriptionForClassification:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_DESCRIPTION_VERY_LOW");
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_DESCRIPTION_LOW");
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_DESCRIPTION_OK");
      break;
    default:
      v6 = 0;
      return v6;
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedAxisLabelStringForClassification:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_localizedStringForClassification:narrow:", a3, 1);
}

+ (id)_localizedStringForClassification:(int64_t)a3 narrow:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v4 = a4;
  switch(a3)
  {
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_VERY_LOW");
      v8 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_NARROW_VERY_LOW");
      break;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_LOW");
      v8 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_NARROW_LOW");
      break;
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      v7 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_OK");
      v8 = CFSTR("APPLE_WALKING_STEADINESS_CLASSIFICATION_NARROW_OK");
      break;
    default:
      v10 = 0;
      return v10;
  }
  if (v4)
    v9 = v8;
  else
    v9 = v7;
  objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)localizedTitleForWalkingSteadinessEventCategoryValue:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  NSObject *v7;
  __CFString *v8;

  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("WALKING_STEADINESS_EVENT_VALUE_INITIAL_LOW");
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("WALKING_STEADINESS_EVENT_VALUE_INITIAL_VERY_LOW");
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("WALKING_STEADINESS_EVENT_VALUE_REPEAT_LOW");
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("WALKING_STEADINESS_EVENT_VALUE_REPEAT_VERY_LOW");
LABEL_9:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-WalkingSteadiness"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      _HKInitializeLogging();
      v7 = *MEMORY[0x1E0CB5328];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5328], OS_LOG_TYPE_FAULT))
        +[HKMobilityUtilities localizedTitleForWalkingSteadinessEventCategoryValue:].cold.1(a3, v7);
      v8 = &stru_1E9C4C428;
      break;
  }
  return v8;
}

+ (id)generateAppleWalkingSteadinessSeriesForTimeScope:(int64_t)a3 displayType:(id)a4 color:(id)a5
{
  id v7;
  id v8;
  void *v9;
  HKJulianIndexedSevenDayQuantitySeries *v10;
  void *v11;
  void *v12;

  v7 = a4;
  v8 = a5;
  +[HKAppleWalkingSteadinessAxis standardAxisWithDisplayType:](HKAppleWalkingSteadinessAxis, "standardAxisWithDisplayType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 == 3)
  {
    objc_msgSend(v7, "generateScatterPlotSeriesWithColor:", v8);
    v10 = (HKJulianIndexedSevenDayQuantitySeries *)objc_claimAutoreleasedReturnValue();
LABEL_6:
    v12 = v10;
    goto LABEL_7;
  }
  if (a3 > 2)
  {
    v10 = -[HKJulianIndexedSevenDayQuantitySeries initWithColor:lineWidth:hollowLineRatio:]([HKJulianIndexedSevenDayQuantitySeries alloc], "initWithColor:lineWidth:hollowLineRatio:", v8, 8.0, 0.5);
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0CB37F0], "hk_wholeNumberFormatter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "generateDistributionSeriesWithColor:numberFormatter:lineWidth:hasMinMaxOverlay:", v8, v11, 0, 10.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setHollowLineRatio:", 0.6);
LABEL_7:
  objc_msgSend(v12, "setYAxis:", v9);

  return v12;
}

+ (id)generateAppleWalkingSteadinessDataSourceForTimeScope:(int64_t)a3 displayType:(id)a4 healthStore:(id)a5 quantityType:(id)a6 unitController:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HKQuantityTypeDataSource *v17;
  void *v18;
  void *v19;
  _QWORD aBlock[4];
  id v22;
  _QWORD v23[4];
  id v24;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  objc_msgSend(v14, "unitForDisplayType:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (a3 == 3)
  {
    v17 = -[HKQuantityTypeDataSource initWithUnitController:options:displayType:healthStore:]([HKQuantityTypeDataSource alloc], "initWithUnitController:options:displayType:healthStore:", v14, 2, v11, v12);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke;
    v23[3] = &unk_1E9C43820;
    v24 = v16;
    -[HKQuantityTypeDataSource setUserInfoCreationBlock:](v17, "setUserInfoCreationBlock:", v23);
    v18 = v24;
LABEL_6:

    goto LABEL_7;
  }
  if (a3 > 2)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke_3;
    aBlock[3] = &unk_1E9C43888;
    v22 = v15;
    v19 = _Block_copy(aBlock);
    v17 = -[HKJulianIndexedSevenDayQuantityDataSource initWithDisplayType:healthStore:quantityType:unitController:intervalUserInfoCreationBlock:]([HKJulianIndexedSevenDayQuantityDataSource alloc], "initWithDisplayType:healthStore:quantityType:unitController:intervalUserInfoCreationBlock:", v11, v12, v13, v14, v19);

    v18 = v22;
    goto LABEL_6;
  }
  v17 = -[HKQuantityDistributionDataSource initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:]([HKQuantityDistributionDataSource alloc], "initWithQuantityType:unitController:healthStore:contextStyle:predicate:options:baseDisplayType:specificStartDate:specificEndDate:userInfoCreationBlock:", v13, v14, v12, 0, 0, 1, v11, 0, 0, &__block_literal_global_55);
LABEL_7:

  return v17;
}

HKInteractiveChartAppleWalkingSteadinessData *__128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKInteractiveChartAppleWalkingSteadinessData *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartAppleWalkingSteadinessData);
  objc_msgSend(v3, "averageQuantity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:");

  v6 = objc_msgSend(v3, "recordCount");
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", v6);
  return v4;
}

HKInteractiveChartAppleWalkingSteadinessData *__128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  HKInteractiveChartAppleWalkingSteadinessData *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = a2;
  v6 = objc_alloc_init(HKInteractiveChartAppleWalkingSteadinessData);
  objc_msgSend(v5, "averageValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v4);
  -[HKInteractiveChartSinglePointData setValue:](v6, "setValue:");

  objc_msgSend(v5, "minimumValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v4);
  -[HKInteractiveChartSinglePointData setMinValue:](v6, "setMinValue:");

  objc_msgSend(v5, "maximumValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValueForUnit:", v4);
  -[HKInteractiveChartSinglePointData setMaxValue:](v6, "setMaxValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v6, "setUnit:", v4);
  -[HKInteractiveChartSinglePointData setRepresentsRange:](v6, "setRepresentsRange:", 1);
  -[HKInteractiveChartSinglePointData setRecordCount:](v6, "setRecordCount:", 1);
  return v6;
}

HKInteractiveChartAppleWalkingSteadinessData *__128__HKMobilityUtilities_generateAppleWalkingSteadinessDataSourceForTimeScope_displayType_healthStore_quantityType_unitController___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  HKInteractiveChartAppleWalkingSteadinessData *v4;
  double v5;
  double v6;

  v3 = a2;
  v4 = objc_alloc_init(HKInteractiveChartAppleWalkingSteadinessData);
  objc_msgSend(v3, "doubleValueForUnit:", *(_QWORD *)(a1 + 32));
  v6 = v5;

  -[HKInteractiveChartSinglePointData setValue:](v4, "setValue:", v6);
  -[HKInteractiveChartSinglePointData setRecordCount:](v4, "setRecordCount:", 1);
  return v4;
}

+ (BOOL)chartDataSpansMultipleClassifications:(id)a3
{
  int v4;
  uint64_t v5;
  double v7;
  double v8;

  v7 = 0.0;
  v8 = 0.0;
  v4 = objc_msgSend(a1, "_valueRangeMin:max:forChartData:", &v8, &v7, a3);
  if (v4)
  {
    v5 = objc_msgSend(a1, "classificationForAppleWalkingSteadinessValue:", v8);
    LOBYTE(v4) = v5 != objc_msgSend(a1, "classificationForAppleWalkingSteadinessValue:", v7);
  }
  return v4;
}

+ (BOOL)_valueRangeMin:(double *)a3 max:(double *)a4 forChartData:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = objc_msgSend(v7, "count");
  if (v8)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      v13 = -1.79769313e308;
      v14 = 1.79769313e308;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v16 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(v16, "representsRange", (_QWORD)v21))
            objc_msgSend(v16, "minValue");
          else
            objc_msgSend(v16, "value");
          v18 = v17;
          if (objc_msgSend(v16, "representsRange"))
            objc_msgSend(v16, "maxValue");
          else
            objc_msgSend(v16, "value");
          if (v14 > v18)
            v14 = v18;
          if (v13 < v19)
            v13 = v19;
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }
    else
    {
      v13 = -1.79769313e308;
      v14 = 1.79769313e308;
    }

    if (a3)
      *a3 = v14;
    if (a4)
      *a4 = v13;
  }

  return v8 != 0;
}

+ (void)classificationForAppleWalkingSteadinessQuantity:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "debugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "localizedDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138740227;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_fault_impl(&dword_1D7813000, v5, OS_LOG_TYPE_FAULT, "Unable to classify provided quantity or value: (%{sensitive}@) %@", (uint8_t *)&v8, 0x16u);

}

+ (void)localizedTitleForWalkingSteadinessEventCategoryValue:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D7813000, a2, OS_LOG_TYPE_FAULT, "Unable to localize walking steadiness event category value: %llu", (uint8_t *)&v2, 0xCu);
}

@end
