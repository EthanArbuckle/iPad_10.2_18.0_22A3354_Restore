@implementation HKCardioFitnessUtilities

+ (id)flattenedCardioFitnessDataForBiologicalSex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "flattenedCardioFitnessDataForBiologicalSex:", a3);
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessDataForBiologicalSex:", a3);
}

+ (id)cardioFitnessDataForBiologicalSex:(int64_t)a3 age:(int64_t)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessDataForBiologicalSex:age:", a3, a4);
}

+ (id)cardioFitnessDataForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessDataForVO2Max:biologicalSex:age:", a4, a5, a3);
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessDataForLevel:biologicalSex:age:", a3, a4, a5);
}

+ (id)cardioFitnessDataForLevel:(int64_t)a3 date:(id)a4 healthStore:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessDataForLevel:date:healthStore:", a3, a4, a5);
}

+ (int64_t)cardioFitnessLevelForVO2Max:(double)a3 biologicalSex:(int64_t)a4 age:(int64_t)a5
{
  return objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessLevelForVO2Max:biologicalSex:age:", a4, a5, a3);
}

+ (int64_t)cardioFitnessLevelForVO2MaxSample:(id)a3 inHealthStore:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessLevelForVO2MaxSample:inHealthStore:", a3, a4);
}

+ (id)cardioFitnessLevelDateIntervalsWithDateInterval:(id)a3 healthStore:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6368], "cardioFitnessLevelDateIntervalsWithDateInterval:healthStore:", a3, a4);
}

+ (id)_localizationKeyForCardioFitnessLevel:(int64_t)a3 keyVariant:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  if ((unint64_t)(a3 + 1) > 4)
  {
    v6 = 0;
  }
  else
  {
    -[__CFString stringByReplacingOccurrencesOfString:withString:](off_1E9C41D40[a3 + 1], "stringByReplacingOccurrencesOfString:withString:", CFSTR("%@"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)localizationKeyForCardioFitnessLevel:(int64_t)a3
{
  return (id)objc_msgSend(a1, "_localizationKeyForCardioFitnessLevel:keyVariant:", a3, CFSTR("LEVEL"));
}

+ (id)localizedStringForCardioFitnessLevel:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "localizationKeyForCardioFitnessLevel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)localizedStringForCardioFitnessTitle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_localizationKeyForCardioFitnessLevel:keyVariant:", a3, CFSTR("TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)classificationIdentifierForIndex:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return 0;
  else
    return off_1E9C41D68[a3 + 1];
}

+ (id)localizedStringForCardioFitnessLevelName:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_localizationKeyForCardioFitnessLevel:keyVariant:", a3, CFSTR("LEVEL_NAME"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)localizedStringForCardioFitnessDescription:(int64_t)a3 age:(int64_t)a4
{
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;

  if (a4 <= 59)
    v4 = CFSTR("DESCRIPTION");
  else
    v4 = CFSTR("DESCRIPTION_OLDER");
  objc_msgSend(a1, "_localizationKeyForCardioFitnessLevel:keyVariant:", a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", v5, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-CardioFitness"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  return +[HKCardioFitnessUtilities vo2MaxInteractiveChartViewControllerWithDisplayDate:applicationItems:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:](HKCardioFitnessUtilities, "vo2MaxInteractiveChartViewControllerWithDisplayDate:applicationItems:restorationUserActivity:trendModel:factorDisplayTypes:additionalChartOptions:", a6, a5, a8, a9, a10, a11);
}

+ (id)cardioFitnessLookupPropertiesForChartData:(id)a3
{
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v20;
    v7 = 0.0;
    v8 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v10, "value");
        v8 = v8 + v11;
        v7 = v7 + (double)objc_msgSend(v10, "age");
      }
      v5 += v4;
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v4);
    if (v5)
    {
      v12 = v8 / (double)v5;
      v13 = v7 / (double)v5;
      objc_msgSend(v3, "lastObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "unit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v14, "biologicalSex");
      v4 = (uint64_t)objc_alloc_init(MEMORY[0x1E0CB6370]);
      objc_msgSend((id)v4, "setBiologicalSex:", v16);
      objc_msgSend((id)v4, "setAge:", vcvtad_u64_f64(v13));
      objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v15, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v4, "setVo2MaxQuantity:", v17);

    }
    else
    {
      v4 = 0;
    }
  }

  return (id)v4;
}

+ (id)cardioFitnessLevelDataForChartData:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  objc_msgSend(a1, "cardioFitnessLookupPropertiesForChartData:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "vo2MaxQuantity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vo2MaxQuantity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValueForUnit:", v8);
    v10 = v9;

    objc_msgSend(a1, "cardioFitnessDataForVO2Max:biologicalSex:age:", objc_msgSend(v5, "biologicalSex"), objc_msgSend(v5, "age"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)effectiveChartPointDateWithStatisticsInterval:(id)a3 startDate:(id)a4 endDate:(id)a5
{
  id v7;
  id v8;
  double v9;
  id v10;
  void *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(a3, "hk_approximateDuration");
  if (v9 <= (double)(unint64_t)*MEMORY[0x1E0CB4788])
  {
    HKUIMidDate(v7, v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;

  return v11;
}

+ (id)cardioFitnessInteractiveChartViewControllerWithDisplayDate:(id)a3 applicationItems:(id)a4 preferredOverlay:(int64_t)a5 analyticsDelegate:(id)a6 restorationUserActivity:(id)a7 trendModel:(id)a8 factorDisplayTypes:(id)a9 additionalChartOptions:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  HKOverlayRoomCardioFitnessViewController *v22;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a4;
  v21 = a3;
  v22 = -[HKOverlayRoomCardioFitnessViewController initWithDisplayDate:applicationItems:mode:preferredOverlay:analyticsDelegate:interactiveChartOptions:trendModel:factorDisplayTypes:]([HKOverlayRoomCardioFitnessViewController alloc], "initWithDisplayDate:applicationItems:mode:preferredOverlay:analyticsDelegate:interactiveChartOptions:trendModel:factorDisplayTypes:", v21, v20, 1, a5, v19, 0, v17, v16);

  -[HKOverlayRoomViewController setRestorationUserActivity:](v22, "setRestorationUserActivity:", v18);
  -[HKOverlayRoomViewController setAdditionalChartOptions:](v22, "setAdditionalChartOptions:", a10);
  return v22;
}

+ (id)vo2MaxInteractiveChartViewControllerWithDisplayDate:(id)a3 applicationItems:(id)a4 restorationUserActivity:(id)a5 trendModel:(id)a6 factorDisplayTypes:(id)a7 additionalChartOptions:(unint64_t)a8
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  HKOverlayRoomFactorAndTrendViewController *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  id v28;
  HKInteractiveChartViewController *v29;
  void *v30;
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  objc_msgSend(v14, "displayTypeController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "displayTypeWithIdentifier:", &unk_1E9CEB288);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16 || v17 && objc_msgSend(v17, "count"))
  {
    v20 = -[HKOverlayRoomFactorAndTrendViewController initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:]([HKOverlayRoomFactorAndTrendViewController alloc], "initWithBaseChartDisplayType:trendModel:factorDisplayTypes:displayDate:applicationItems:mode:timeScopeRanges:initialTimeScope:wrappedOverlay:overrideFirstWeekday:overrideCalendar:additionalChartOptions:", v19, v16, v17, v13, v14, 1, 0, 8, 0, -1, 0, a8);
    -[HKOverlayRoomViewController setRestorationUserActivity:](v20, "setRestorationUserActivity:", v15);
  }
  else
  {
    v29 = [HKInteractiveChartViewController alloc];
    v32[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "healthStore");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unitController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "dateCache");
    v31 = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "chartDataCacheController");
    v28 = v15;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeScopeController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "sampleDateRangeController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[HKInteractiveChartViewController initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:](v29, "initWithDisplayTypes:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:", v27, v30, v21, v22, v23, v24, v25, v31, 0, objc_msgSend(v19, "hk_interactiveChartOptions"));

    v15 = v28;
    v13 = v31;

  }
  return v20;
}

+ (BOOL)cardioFitnessLevelChartShouldDisplayUpperBound:(int64_t)a3
{
  return a3 < 3;
}

+ (BOOL)cardioFitnessLevelChartShouldDisplayLowerBound:(int64_t)a3
{
  return a3 > 0;
}

@end
