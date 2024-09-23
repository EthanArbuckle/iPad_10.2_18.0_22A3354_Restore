@implementation HKSleepUtilities

+ (id)localizedInfographicTitleForCategoryValue:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;
  __CFString *v7;

  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("AWAKE");
      v6 = CFSTR("HealthUI-Localizable");
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_CORE");
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_DEEP");
      goto LABEL_7;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_REM");
LABEL_7:
      v6 = CFSTR("HealthUI-Localizable-Acacia");
LABEL_8:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, v6);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v7 = &stru_1E9C4C428;
      break;
  }
  return v7;
}

+ (id)localizedInfographicDescriptionForCategoryValue:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;

  switch(a3)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_AWAKE_DESCRIPTION");
      goto LABEL_7;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_CORE_DESCRIPTION");
      goto LABEL_7;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_DEEP_DESCRIPTION");
      goto LABEL_7;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("ASLEEP_REM_DESCRIPTION");
LABEL_7:
      objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v6 = &stru_1E9C4C428;
      break;
  }
  return v6;
}

+ (id)sleepDaySummaryStandardXValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v3 = a3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMid();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "hk_morningIndexWithCalendar:", v4);
  objc_msgSend(MEMORY[0x1E0C99D68], "hk_sleepDayStartForMorningIndex:calendar:", v9 + 1, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)sleepDaySummaryNoonAlignedXValue:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "calendar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKSleepUtilities sleepDaySummaryStandardXValue:](HKSleepUtilities, "sleepDaySummaryStandardXValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "hk_nearestNoonBeforeDateOrEqualToDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sleepStageContextTitleForSleepValue:(int64_t)a3 timeScope:(int64_t)a4
{
  void *v5;
  void *v6;
  const __CFString *v7;

  switch(a3)
  {
    case 0:
    case 1:
      _HKInitializeLogging();
      v5 = (void *)*MEMORY[0x1E0CB5368];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5368], OS_LOG_TYPE_ERROR))
        +[HKSleepUtilities sleepStageContextTitleForSleepValue:timeScope:].cold.1(v5);
      a4 = (int64_t)&stru_1E9C4C428;
      return (id)a4;
    case 2:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 6)
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_AWAKE");
      else
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_AVERAGE_AWAKE");
      goto LABEL_17;
    case 3:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 6)
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_CORE");
      else
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_AVERAGE_CORE");
      goto LABEL_17;
    case 4:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 6)
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_DEEP");
      else
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_AVERAGE_DEEP");
      goto LABEL_17;
    case 5:
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (a4 == 6)
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_REM");
      else
        v7 = CFSTR("STAGES_OVERLAY_CONTEXT_AVERAGE_REM");
LABEL_17:
      objc_msgSend(v6, "localizedStringForKey:value:table:", v7, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
      a4 = objc_claimAutoreleasedReturnValue();

      break;
    default:
      return (id)a4;
  }
  return (id)a4;
}

+ (id)verticalNumericalAxisWithConfigurationOverrides:(id)a3
{
  id v3;
  HKSolidFillStyle *v4;
  void *v5;
  HKAxisStyle *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HKNumericAxisConfiguration *v15;
  HKNumericAxis *v16;

  v3 = a3;
  v4 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v4, "setColor:", v5);

  v6 = objc_alloc_init(HKAxisStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v7, v8, 2, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setLabelStyle:](v6, "setLabelStyle:", v9);

  -[HKAxisStyle setTickPositions:](v6, "setTickPositions:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v10, 2.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setAxisLineStyle:](v6, "setAxisLineStyle:", v11);

  -[HKAxisStyle setFillStyle:](v6, "setFillStyle:", v4);
  -[HKAxisStyle setFillInnerPadding:](v6, "setFillInnerPadding:", 10.0);
  -[HKAxisStyle setFillOuterPadding:](v6, "setFillOuterPadding:", 15.0);
  -[HKAxisStyle setLocation:](v6, "setLocation:", 1);
  -[HKAxisStyle setShowGridLines:](v6, "setShowGridLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v13, HKUIOnePixel());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setGridLineStyle:](v6, "setGridLineStyle:", v14);

  v15 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setPreferredStyle:](v15, "setPreferredStyle:", v6);
  if (v3)
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v15, "applyOverridesFromNumericAxisConfiguration:", v3);
  v16 = -[HKNumericAxis initWithConfiguration:]([HKNumericAxis alloc], "initWithConfiguration:", v15);

  return v16;
}

+ (id)sleepDisplayTypesWithHealthStore:(id)a3 sleepDisplayType:(id)a4 unitController:(id)a5 displayTypeController:(id)a6 chartCacheController:(id)a7 sleepChartFormatter:(id)a8 sleepSeriesType:(int64_t)a9 sleepChartCaches:(id)a10 customSleepSeries:(id)a11 isStackedChart:(BOOL)a12
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a10;
  v24 = a11;
  v25 = v24;
  if (v24)
  {
    v30[0] = &unk_1E9CEC6F8;
    v30[1] = &unk_1E9CEC710;
    v31[0] = v24;
    v31[1] = v24;
    v30[2] = &unk_1E9CEC728;
    v30[3] = &unk_1E9CEC740;
    v31[2] = v24;
    v31[3] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v26 = 0;
  }
  LOBYTE(v29) = a12;
  +[HKSleepUtilities sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeriesMapping:isStackedChart:](HKSleepUtilities, "sleepDisplayTypesWithHealthStore:sleepDisplayType:unitController:displayTypeController:chartCacheController:sleepChartFormatter:sleepSeriesType:sleepChartCaches:customSleepSeriesMapping:isStackedChart:", v17, v18, v19, v20, v21, v22, a9, v23, v26, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)sleepDisplayTypesWithHealthStore:(id)a3 sleepDisplayType:(id)a4 unitController:(id)a5 displayTypeController:(id)a6 chartCacheController:(id)a7 sleepChartFormatter:(id)a8 sleepSeriesType:(int64_t)a9 sleepChartCaches:(id)a10 customSleepSeriesMapping:(id)a11 isStackedChart:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  HKInteractiveChartDisplayType *v31;
  void *v32;
  void *v34;
  uint64_t v36;
  void *v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  BOOL v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  id v51;
  int64_t v52;
  _QWORD v53[3];

  v53[1] = *MEMORY[0x1E0C80C00];
  v41 = a3;
  v18 = a4;
  v42 = a5;
  v40 = a6;
  v39 = a7;
  v38 = a8;
  v19 = a10;
  v20 = a11;
  if (a12)
  {
    +[HKOverlayContextUtilities stackedAxisConfiguration](HKOverlayContextUtilities, "stackedAxisConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }
  v22 = MEMORY[0x1E0C809B0];
  v37 = v21;
  if (v20)
  {
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke;
    v47[3] = &unk_1E9C42F60;
    v51 = a1;
    v52 = a9;
    v48 = v18;
    v49 = v42;
    v50 = v21;
    objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v47);
    v23 = v20;

  }
  else
  {
    objc_msgSend(a1, "buildSleepGraphSeriesMappingWithSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:", a9, v18, v42, v21);
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HKSleepChartCacheIdentifierSleepConsistency"), a2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a9 & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("HKSleepChartCacheIdentifierSleepStages"));
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }
  if (!v24)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", v36, a1, CFSTR("HKSleepUtilities.m"), 216, CFSTR("Sleep chart cache should not be nil!"));

  }
  v26 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v23, "allValues");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setWithArray:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v22;
  v43[1] = 3221225472;
  v43[2] = __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke_2;
  v43[3] = &unk_1E9C42F88;
  v46 = a12;
  v44 = v24;
  v45 = v18;
  v29 = v18;
  v30 = v24;
  objc_msgSend(v28, "enumerateObjectsUsingBlock:", v43);
  v31 = -[HKInteractiveChartDisplayType initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:]([HKInteractiveChartDisplayType alloc], "initWithBaseDisplayType:valueFormatter:dataTypeCode:seriesForTimeScopeMapping:", v29, v38, 63, v23);
  v53[0] = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

void __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v5 = (void *)a1[7];
  v6 = a1[8];
  v7 = a1[4];
  v8 = a3;
  objc_msgSend(v5, "_applyModificationsToSleepSeries:sleepSeriesType:sleepDisplayType:timeScope:unitController:numericAxisConfigurationOverrides:", v8, v6, v7, (int)objc_msgSend(a2, "intValue"), a1[5], a1[6]);

}

void __221__HKSleepUtilities_sleepDisplayTypesWithHealthStore_sleepDisplayType_unitController_displayTypeController_chartCacheController_sleepChartFormatter_sleepSeriesType_sleepChartCaches_customSleepSeriesMapping_isStackedChart___block_invoke_2(uint64_t a1, void *a2)
{
  HKCacheBackedChartSeriesDataSource *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = objc_alloc_init(HKCacheBackedChartSeriesDataSource);
  -[HKCacheBackedChartSeriesDataSource setChartCache:](v3, "setChartCache:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v7, "setDataSource:", v3);
  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(v7, "yAxis");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 40), "localization");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "shortenedDisplayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKOverlayContextUtilities setStackedSeriesLegend:title:](HKOverlayContextUtilities, "setStackedSeriesLegend:title:", v7, v6);

    }
  }

}

+ (id)buildSleepGraphSeriesMappingWithSleepSeriesType:(int64_t)a3 sleepDisplayType:(id)a4 unitController:(id)a5 numericAxisConfigurationOverrides:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(void *, uint64_t);
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  int64_t v29;
  _QWORD v30[4];
  _QWORD v31[5];

  v31[4] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v21 = MEMORY[0x1E0C809B0];
  v22 = 3221225472;
  v23 = __134__HKSleepUtilities_buildSleepGraphSeriesMappingWithSleepSeriesType_sleepDisplayType_unitController_numericAxisConfigurationOverrides___block_invoke;
  v24 = &unk_1E9C42FB0;
  v28 = a1;
  v29 = a3;
  v25 = v10;
  v26 = v11;
  v27 = v12;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  v16 = (void (**)(void *, uint64_t))_Block_copy(&v21);
  v16[2](v16, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2](v16, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = &unk_1E9CEC6F8;
  v30[1] = &unk_1E9CEC710;
  v31[0] = v18;
  v31[1] = v17;
  v30[2] = &unk_1E9CEC728;
  v30[3] = &unk_1E9CEC740;
  v31[2] = v17;
  v31[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 4, v21, v22, v23, v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

uint64_t __134__HKSleepUtilities_buildSleepGraphSeriesMappingWithSleepSeriesType_sleepDisplayType_unitController_numericAxisConfigurationOverrides___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 56), "buildSleepGraphSeriesForSleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:timeScope:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

+ (id)buildSleepGraphSeriesForSleepSeriesType:(int64_t)a3 sleepDisplayType:(id)a4 unitController:(id)a5 numericAxisConfigurationOverrides:(id)a6 timeScope:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  objc_msgSend(a1, "_sleepSeriesForType:timeScope:", a3, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_applyModificationsToSleepSeries:sleepSeriesType:sleepDisplayType:timeScope:unitController:numericAxisConfigurationOverrides:", v15, a3, v14, a7, v13, v12);

  return v15;
}

+ (void)_applyModificationsToSleepSeries:(id)a3 sleepSeriesType:(int64_t)a4 sleepDisplayType:(id)a5 timeScope:(int64_t)a6 unitController:(id)a7 numericAxisConfigurationOverrides:(id)a8
{
  id v14;
  void *v15;
  id v16;

  v14 = a3;
  objc_msgSend(a1, "_sleepSeriesAxisForSleepSeries:sleepSeriesType:sleepDisplayType:unitController:numericAxisConfigurationOverrides:", v14, a4, a5, a7, a8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setYAxis:", v15);

  +[HKSleepAnalysisDataSourceContext sleepAnalysisDataSourceContextWithChartType:timeScope:](HKSleepAnalysisDataSourceContext, "sleepAnalysisDataSourceContextWithChartType:timeScope:", a4, a6);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setSeriesDataSourceContext:", v16);

}

+ (id)_sleepSeriesAxisForSleepSeries:(id)a3 sleepSeriesType:(int64_t)a4 sleepDisplayType:(id)a5 unitController:(id)a6 numericAxisConfigurationOverrides:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  HKNumericAxisConfiguration *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = objc_msgSend(a1, "_axisPurposeForSleepSeriesType:", a4);
  v17 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setMaxLabels:](v17, "setMaxLabels:", 8);
  +[HKChartAxisDimensionFactory dimensionWithPurpose:displayType:unitController:](HKChartAxisDimensionFactory, "dimensionWithPurpose:displayType:unitController:", v16, v15, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKNumericAxisConfiguration setLabelDimension:](v17, "setLabelDimension:", v18);
  if (v13)
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v17, "applyOverridesFromNumericAxisConfiguration:", v13);
  if (objc_msgSend(v12, "conformsToProtocol:", &unk_1F01814D8))
    -[HKAxisConfiguration setLabelDataSource:](v17, "setLabelDataSource:", v12);
  +[HKSleepUtilities verticalNumericalAxisWithConfigurationOverrides:](HKSleepUtilities, "verticalNumericalAxisWithConfigurationOverrides:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)_findOrCreateSleepChartCacheForSleepDisplayType:(id)a3 cacheIdentifier:(id)a4 cacheController:(id)a5 dataSourceProvider:(id)a6
{
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  id v14;
  HKChartCache *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(_QWORD))a6;
  objc_msgSend(v11, "findCustomCachesForDisplayType:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __119__HKSleepUtilities__findOrCreateSleepChartCacheForSleepDisplayType_cacheIdentifier_cacheController_dataSourceProvider___block_invoke;
  v19[3] = &unk_1E9C42FD8;
  v14 = v10;
  v20 = v14;
  objc_msgSend(v13, "hk_firstObjectPassingTest:", v19);
  v15 = (HKChartCache *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    v15 = objc_alloc_init(HKChartCache);
    v12[2](v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartCache setDataSource:](v15, "setDataSource:", v16);

    +[HKOutstandingFetchOperationManager sharedOperationManager](HKOutstandingFetchOperationManager, "sharedOperationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKChartCache setOperationManager:](v15, "setOperationManager:", v17);

    objc_msgSend(v11, "addCustomChartCache:forDisplayType:", v15, v9);
  }

  return v15;
}

uint64_t __119__HKSleepUtilities__findOrCreateSleepChartCacheForSleepDisplayType_cacheIdentifier_cacheController_dataSourceProvider___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v3, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cacheIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)buildSleepChartCachesWithDisplayType:(id)a3 dataSourceProvider:(id)a4 cacheController:(id)a5 healthStore:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)MEMORY[0x1E0C99E08];
  v14 = a5;
  objc_msgSend(v13, "dictionary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke;
  v34[3] = &unk_1E9C43000;
  v17 = v11;
  v35 = v17;
  v18 = v12;
  v36 = v18;
  v19 = v10;
  v37 = v19;
  objc_msgSend(a1, "_findOrCreateSleepChartCacheForSleepDisplayType:cacheIdentifier:cacheController:dataSourceProvider:", v19, CFSTR("HKSleepChartCacheIdentifierSleepConsistency"), v14, v34);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v20, CFSTR("HKSleepChartCacheIdentifierSleepConsistency"));
  v27 = v16;
  v28 = 3221225472;
  v29 = __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke_2;
  v30 = &unk_1E9C43000;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  objc_msgSend(a1, "_findOrCreateSleepChartCacheForSleepDisplayType:cacheIdentifier:cacheController:dataSourceProvider:", v21, CFSTR("HKSleepChartCacheIdentifierSleepStages"), v14, &v27);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setObject:forKeyedSubscript:", v24, CFSTR("HKSleepChartCacheIdentifierSleepStages"), v27, v28, v29, v30);
  v25 = (void *)objc_msgSend(v15, "copy");

  return v25;
}

uint64_t __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeSleepDataSourceFromHealthStore:representativeDisplayType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __104__HKSleepUtilities_buildSleepChartCachesWithDisplayType_dataSourceProvider_cacheController_healthStore___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "makeSleepStagesDataSourceFromHealthStore:representativeDisplayType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

+ (id)_sleepSeriesForType:(int64_t)a3 timeScope:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  switch(a3)
  {
    case 0:
      objc_msgSend(a1, "_generateDurationSleepSeriesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      objc_msgSend(a1, "_generateDailyTimePeriodSeriesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend(a1, "_generateDurationSleepGoalSeriesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend(a1, "_generateDailyTimePeriodSeriesWithSchedulesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 4:
      objc_msgSend(a1, "_generateSleepStageSeriesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend(a1, "_generateSleepStageDurationSeriesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    case 6:
      objc_msgSend(a1, "_generateComparisonSleepSeriesForTimeScope:", a4, v4, v5);
      a1 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

+ (int64_t)_axisPurposeForSleepSeriesType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  else
    return qword_1D7B81C50[a3 - 1];
}

+ (id)_generateDailyTimePeriodSeriesForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __objc2_class **v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInBedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveInBedColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = &off_1E9C3D820;
  if (a3 != 6)
    v11 = &off_1E9C3D830;
  v12 = objc_alloc_init(*v11);
  objc_msgSend(a1, "_seriesStrokeStyle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStrokeStyle:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v14, 2.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTiledStrokeStyle:", v15);

  v16 = 1.0;
  v17 = 1.0;
  if (a3 == 6)
    objc_msgSend(a1, "_barCornerRadiusForCurrentDevice", 1.0, 1.0);
  objc_msgSend(v12, "setCornerRadii:", v17, v16);
  objc_msgSend(a1, "_fillStylesFromColors:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDefaultFillStyles:", v18);

  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __63__HKSleepUtilities__generateDailyTimePeriodSeriesForTimeScope___block_invoke;
  v26[3] = &__block_descriptor_40_e17__16__0__UIColor_8l;
  v26[4] = a1;
  objc_msgSend(v7, "hk_map:", v26);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_fillStylesFromColors:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHighlightedFillStyles:", v20);

  objc_msgSend(a1, "_fillStylesFromColors:", v10);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setInactiveFillStyles:", v21);

  +[HKNumericMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:axisRangeOverrides:](HKNumericMinimumRangeAxisScalingRule, "ruleWithDefaultYAxisRange:axisRangeOverrides:", 0, 14400.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEC758, &unk_1E9CEC770);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAxisBounds:", v23);

  objc_msgSend(v12, "setAxisScalingRule:", v22);
  HKCalendarDateTransformPreceding6PM();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setStartOfDayTransform:", v24);

  return v12;
}

uint64_t __63__HKSleepUtilities__generateDailyTimePeriodSeriesForTimeScope___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_lessSaturatedColorWithColor:", a2);
}

+ (id)_generateSleepStageSeriesForTimeScope:(int64_t)a3
{
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
  HKSleepStageDaySeries *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HKMultiGradientFillStyle *v25;
  HKSolidFillStyle *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v38;
  _QWORD v39[4];
  _QWORD v40[5];
  _QWORD v41[6];

  v41[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAwakeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v5;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepREMColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepCoreColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepDeepColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v41[3] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v41[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 5);
  v38 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAwakeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepREMColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepCoreColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v12;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepDeepColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v13;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 == 6)
  {
    v16 = objc_alloc_init(HKSleepStageDaySeries);
    -[HKSleepStageDaySeries setCornerRadii:](v16, "setCornerRadii:", 5.0, 5.0);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setSleepStageLabelFont:](v16, "setSleepStageLabelFont:", v17);

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLightGrayTextColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setSleepStageLabelColor:](v16, "setSleepStageLabelColor:", v18);

    +[HKSleepUtilities sleepStageFillStylesWithActiveSleepStage:](HKSleepUtilities, "sleepStageFillStylesWithActiveSleepStage:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setSleepStageFillStyles:](v16, "setSleepStageFillStyles:", v19);

    objc_msgSend(a1, "_gradientFillColorForSleepAnalysis:gradientPosition:", 2, 0.2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v20;
    objc_msgSend(a1, "_gradientFillColorForSleepAnalysis:gradientPosition:", 5, 0.35);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v21;
    objc_msgSend(a1, "_gradientFillColorForSleepAnalysis:gradientPosition:", 3, 0.66);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[2] = v22;
    objc_msgSend(a1, "_gradientFillColorForSleepAnalysis:gradientPosition:", 4, 0.85);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v39[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = -[HKMultiGradientFillStyle initWithColors:]([HKMultiGradientFillStyle alloc], "initWithColors:", v24);
    -[HKSleepStageDaySeries setSleepStageBackgroundFillStyle:](v16, "setSleepStageBackgroundFillStyle:", v25);

    v26 = objc_alloc_init(HKSolidFillStyle);
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveInBedColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSolidFillStyle setColor:](v26, "setColor:", v27);

    -[HKSleepStageDaySeries setSleepStageBackgroundInactiveFillStyle:](v16, "setSleepStageBackgroundInactiveFillStyle:", v26);
    v28 = (void *)v38;
  }
  else
  {
    v16 = objc_alloc_init(HKSleepStageSeries);
    objc_msgSend(a1, "_seriesStrokeStyle");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setStrokeStyle:](v16, "setStrokeStyle:", v29);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v30, 2.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setTiledStrokeStyle:](v16, "setTiledStrokeStyle:", v31);

    -[HKSleepStageDaySeries setCornerRadii:](v16, "setCornerRadii:", 1.0, 1.0);
    v28 = (void *)v38;
    objc_msgSend(a1, "_fillStylesFromColors:", v38);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setDefaultFillStyles:](v16, "setDefaultFillStyles:", v32);

    objc_msgSend(a1, "_fillStylesFromColors:", v38);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setHighlightedFillStyles:](v16, "setHighlightedFillStyles:", v33);

    objc_msgSend(a1, "_fillStylesFromColors:", v15);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setInactiveFillStyles:](v16, "setInactiveFillStyles:", v34);

    objc_msgSend(a1, "_fillStylesFromColors:", v38);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setSleepStageFillStyles:](v16, "setSleepStageFillStyles:", v35);

    +[HKNumericMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:axisRangeOverrides:](HKNumericMinimumRangeAxisScalingRule, "ruleWithDefaultYAxisRange:axisRangeOverrides:", 0, 14400.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEC758, &unk_1E9CEC770);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAxisBounds:", v36);

    -[HKGraphSeries setAxisScalingRule:](v16, "setAxisScalingRule:", v24);
    HKCalendarDateTransformPreceding6PM();
    v26 = (HKSolidFillStyle *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStageDaySeries setStartOfDayTransform:](v16, "setStartOfDayTransform:", v26);
  }

  return v16;
}

+ (id)_generateSleepStageDurationSeriesForTimeScope:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __objc2_class **v11;
  id v12;
  void *v13;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAwakeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepREMColor", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v6;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepCoreColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v7;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepDeepColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveInBedColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = off_1E9C3D858;
  if (a3 != 6)
    v11 = off_1E9C3D860;
  v12 = objc_alloc_init(*v11);
  objc_msgSend(v12, "setCornerRadii:", 1.0, 1.0);
  objc_msgSend(a1, "_fillStylesFromColors:", v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setSleepStageFillStyles:", v13);

  objc_msgSend(v12, "setGoalLineStrokeStyle:", 0);
  objc_msgSend(v12, "setGoalLineMarkerStyle:", 0);
  objc_msgSend(v12, "setTiledStrokeStyle:", 0);
  objc_msgSend(v12, "setUnselectedStrokeStyle:", 0);

  return v12;
}

+ (id)sleepStageFillStylesWithActiveSleepStage:(id)a3
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[7];

  v17[6] = *MEMORY[0x1E0C80C00];
  v3 = a3 == 0;
  v4 = objc_msgSend(a3, "integerValue");
  v5 = v4 == 2 || v3;
  v6 = v4 == 5 || v3;
  v7 = v4 == 3 || v3;
  v8 = v4 == 4 || v3;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 2, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 5, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 3, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v11;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 4, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v12;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 0, v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v13;
  +[HKSleepUtilities fillStyleForSleepCategoryValue:isActive:](HKSleepUtilities, "fillStyleForSleepCategoryValue:isActive:", 1, v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)_gradientFillColorForSleepAnalysis:(int64_t)a3 gradientPosition:(double)a4
{
  void *v6;
  _BOOL8 v7;
  void *v8;
  _BOOL8 v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  HKMultiGradientFillColor *v14;
  void *v15;
  HKMultiGradientFillColor *v16;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "accessibilityContrast") == 1;

  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceStyle") == 2;

  +[HKSleepUtilities somnogramBackgroundOpacityWithIsDarkMode:isHighContrast:isGrayScale:](HKSleepUtilities, "somnogramBackgroundOpacityWithIsDarkMode:isHighContrast:isGrayScale:", v9, v7, 0);
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "colorWithAlphaComponent:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = [HKMultiGradientFillColor alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKMultiGradientFillColor initWithColor:location:](v14, "initWithColor:location:", v13, v15);

  return v16;
}

+ (CGSize)_barCornerRadiusForCurrentDevice
{
  void *v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isiPad"))
    v3 = 3.0;
  else
    v3 = 1.0;

  v4 = v3;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

+ (id)fillStyleForSleepCategoryValue:(int64_t)a3 isActive:(BOOL)a4
{
  HKSolidFillStyle *v6;
  void *v7;

  v6 = objc_alloc_init(HKSolidFillStyle);
  if (a4)
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", a3);
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveColorForSleepAnalysis:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v6, "setColor:", v7);

  return v6;
}

+ (id)_fillStylesFromColors:(id)a3
{
  return (id)objc_msgSend(a3, "hk_map:", &__block_literal_global_45);
}

HKSolidFillStyle *__42__HKSleepUtilities__fillStylesFromColors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  HKSolidFillStyle *v3;

  v2 = a2;
  v3 = objc_alloc_init(HKSolidFillStyle);
  -[HKSolidFillStyle setColor:](v3, "setColor:", v2);

  return v3;
}

+ (double)somnogramBackgroundOpacityWithIsDarkMode:(BOOL)a3 isHighContrast:(BOOL)a4 isGrayScale:(BOOL)a5
{
  double result;

  if (a5)
  {
    result = 0.35;
    goto LABEL_8;
  }
  if (!a3)
  {
    result = 0.45;
LABEL_8:
    if (!a4)
      return 0.25;
    return result;
  }
  result = 0.5;
  if (a4)
    return 0.75;
  return result;
}

+ (id)_generateDailyTimePeriodSeriesWithSchedulesForTimeScope:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "_generateDailyTimePeriodSeriesForTimeScope:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v5, "setDefaultFillStyles:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v5, "setHighlightedFillStyles:", v6);
  objc_msgSend(v5, "setInactiveFillStyles:", v6);
  objc_msgSend(v5, "setStrokeStyle:", 0);
  objc_msgSend(v5, "setTiledStrokeStyle:", 0);
  objc_msgSend(a1, "_goalLineStrokeStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGoalLineStrokeStyle:", v7);

  if (a3 == 6)
  {
    objc_msgSend(v5, "setUpperGoalLineMarkerStyle:", 0);
    objc_msgSend(v5, "setLowerGoalLineMarkerStyle:", 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_scheduleMarkerStyleWithColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLowerGoalLineMarkerStyle:", v9);

    objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_scheduleMarkerStyleWithColor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setUpperGoalLineMarkerStyle:", v11);

  }
  return v5;
}

+ (id)_generateComparisonSleepSeriesForTimeScope:(int64_t)a3
{
  HKSleepComparisonDaySeries *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (a3 == 6)
  {
    v4 = objc_alloc_init(HKSleepComparisonDaySeries);
    objc_msgSend(a1, "_barCornerRadiusForCurrentDevice");
    -[HKSleepComparisonDaySeries setCornerRadii:](v4, "setCornerRadii:");
    objc_msgSend(a1, "fillStyleForSleepCategoryValue:isActive:", 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    objc_msgSend(a1, "fillStyleForSleepCategoryValue:isActive:", _HKCategoryValueSleepAnalysisDefaultAsleepValue(), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepComparisonDaySeries setDefaultFillStyles:](v4, "setDefaultFillStyles:", v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 43200.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:axisBoundsOverrides:](HKNumericFixedAxisScalingRule, "ruleWithDefaultAxisBounds:axisBoundsOverrides:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_generateDailyTimePeriodSeriesForTimeScope:");
    v4 = (HKSleepComparisonDaySeries *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CEC758, &unk_1E9CED4F8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKNumericMinimumRangeAxisScalingRule ruleWithDefaultYAxisRange:axisRangeOverrides:](HKNumericMinimumRangeAxisScalingRule, "ruleWithDefaultYAxisRange:axisRangeOverrides:", 0, 3600.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  objc_msgSend(v11, "setNoDataAxisBounds:", v10);
  -[HKGraphSeries setAxisScalingRule:](v4, "setAxisScalingRule:", v12);

  return v4;
}

+ (id)sleepDurationNoDataRange
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "quantityWithUnit:doubleValue:", v3, 0.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB6A28];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quantityWithUnit:doubleValue:", v6, 12.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_generateDurationSleepSeriesForTimeScope:(int64_t)a3
{
  __objc2_class **v3;
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKStrokeStyle *v11;
  void *v12;
  HKSolidFillStyle *v13;
  void *v14;
  HKSolidFillStyle *v15;
  void *v16;
  void *v17;
  HKSolidFillStyle *v18;
  void *v19;
  HKSolidFillStyle *v20;
  void *v21;
  void *v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = &off_1E9C3D800;
  if (a3 == 6)
    v3 = off_1E9C3D7F8;
  v4 = objc_alloc_init(*v3);
  objc_msgSend(v4, "axisScalingRule");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "conformsToProtocol:", &unk_1F0205B90);

  if (v6)
  {
    +[HKSleepUtilities sleepDurationNoDataRange](HKSleepUtilities, "sleepDurationNoDataRange");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "axisScalingRule");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNoDataAxisBounds:", v7);

  }
  objc_msgSend(v4, "setGoalLineStrokeStyle:", 0);
  objc_msgSend(v4, "setGoalLineMarkerStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v9, 3.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTiledStrokeStyle:", v10);

  v11 = objc_alloc_init(HKStrokeStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStrokeStyle setStrokeColor:](v11, "setStrokeColor:", v12);

  -[HKStrokeStyle setLineWidth:](v11, "setLineWidth:", 3.0);
  -[HKStrokeStyle setBlendMode:](v11, "setBlendMode:", 22);
  objc_msgSend(v4, "setUnselectedStrokeStyle:", v11);
  objc_msgSend(v4, "setCornerRadii:", 1.0, 1.0);
  v13 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v13, "setColor:", v14);

  v15 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInBedColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v15, "setColor:", v16);

  v25[0] = v13;
  v25[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDefaultFillStyles:", v17);

  v18 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveAsleepColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v18, "setColor:", v19);

  v20 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepInactiveInBedColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v20, "setColor:", v21);

  v24[0] = v18;
  v24[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInactiveFillStyles:", v22);

  return v4;
}

+ (id)_generateDurationSleepGoalSeriesForTimeScope:(int64_t)a3
{
  HKSleepDurationDaySeries *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a3 == 6)
  {
    v4 = objc_alloc_init(HKSleepDurationDaySeries);
    objc_msgSend(a1, "_goalLineStrokeStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepDurationSeries setGoalLineStrokeStyle:](v4, "setGoalLineStrokeStyle:", v5);

    -[HKBarSeries setTiledStrokeStyle:](v4, "setTiledStrokeStyle:", 0);
    -[HKSleepDurationSeries setDefaultFillStyles:](v4, "setDefaultFillStyles:", 0);
    -[HKSleepDurationSeries setGoalLineMarkerStyle:](v4, "setGoalLineMarkerStyle:", 0);
  }
  else
  {
    v4 = objc_alloc_init(HKSleepDurationSeries);
    objc_msgSend(a1, "_goalLineStrokeStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepDurationSeries setGoalLineStrokeStyle:](v4, "setGoalLineStrokeStyle:", v6);

    -[HKBarSeries setTiledStrokeStyle:](v4, "setTiledStrokeStyle:", 0);
    -[HKSleepDurationSeries setDefaultFillStyles:](v4, "setDefaultFillStyles:", 0);
    objc_msgSend(a1, "_goalLineMarkerStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepDurationSeries setGoalLineMarkerStyle:](v4, "setGoalLineMarkerStyle:", v7);

  }
  return v4;
}

+ (id)_goalLineStrokeStyle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v2, 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setDashStyle:", 0);
  return v3;
}

+ (id)_scheduleMarkerStyleWithColor:(id)a3
{
  id v3;
  HKLineSeriesPointMarkerStyle *v4;

  v3 = a3;
  v4 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v3, 1, 4.0);

  return v4;
}

+ (id)_goalLineMarkerStyle
{
  HKLineSeriesPointMarkerStyle *v2;
  void *v3;
  HKLineSeriesPointMarkerStyle *v4;

  v2 = [HKLineSeriesPointMarkerStyle alloc];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepAsleepColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:](v2, "initWithColor:radius:style:", v3, 1, 4.0);

  return v4;
}

+ (id)_lessSaturatedColorWithColor:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v4 = 0.0;
  objc_msgSend(a3, "getHue:saturation:brightness:alpha:", &v7, &v6, &v5, &v4);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v7, v6 * 0.5, v5, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_seriesStrokeStyle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v2, 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBlendMode:", 22);

  return v3;
}

+ (void)sleepStageContextTitleForSleepValue:(void *)a1 timeScope:.cold.1(void *a1)
{
  NSObject *v1;
  objc_class *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1D7813000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Can't create stage context title for unsupported sleep category value", (uint8_t *)&v4, 0xCu);

}

@end
