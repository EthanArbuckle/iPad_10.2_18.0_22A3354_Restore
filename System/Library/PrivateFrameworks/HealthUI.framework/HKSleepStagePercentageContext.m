@implementation HKSleepStagePercentageContext

- (HKSleepStagePercentageContext)initWithSleepStage:(int64_t)a3 baseDisplayType:(id)a4 overlayDisplayType:(id)a5 overlayChartController:(id)a6 contextChangeDelegate:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HKSleepStagePercentageContext *v17;
  HKSleepStagePercentageContext *v18;
  uint64_t v19;
  HKDisplayTypeContextItem *lastUpdatedItem;
  uint64_t v21;
  NSNumberFormatter *percentageFormatter;
  objc_super v24;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)HKSleepStagePercentageContext;
  v17 = -[HKSleepStagePercentageContext init](&v24, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_sleepStage = a3;
    objc_storeStrong((id *)&v17->_baseDisplayType, a4);
    objc_storeStrong((id *)&v18->_overlayDisplayType, a5);
    objc_storeStrong((id *)&v18->_overlayChartController, a6);
    objc_storeWeak((id *)&v18->_contextChangeDelegate, v16);
    -[HKSleepStagePercentageContext _contextItemWithPercentageString:timeScope:](v18, "_contextItemWithPercentageString:timeScope:", &stru_1E9C4C428, 5);
    v19 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v18->_lastUpdatedItem;
    v18->_lastUpdatedItem = (HKDisplayTypeContextItem *)v19;

    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_percentNumberFormatter");
    v21 = objc_claimAutoreleasedReturnValue();
    percentageFormatter = v18->_percentageFormatter;
    v18->_percentageFormatter = (NSNumberFormatter *)v21;

    -[NSNumberFormatter setRoundingMode:](v18->_percentageFormatter, "setRoundingMode:", 2);
  }

  return v18;
}

- (BOOL)unselectedContextShouldUseContextBaseType
{
  return 0;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[HKSleepStagePercentageContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStagePercentageContextWillBeSelected:", v5);

}

- (void)overlayStateDidChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v6;

  v5 = a3;
  -[HKSleepStagePercentageContext contextChangeDelegate](self, "contextChangeDelegate", a3, a4, a5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStagePercentageContextSelected:", v5);

}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v10;
  id v11;
  void *v12;
  char isKindOfClass;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a7;
  -[HKSleepStagePercentageContext baseDisplayType](self, "baseDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKSleepStagePercentageContext baseDisplayType](self, "baseDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSleepStagePercentageContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __116__HKSleepStagePercentageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E9C41238;
    v19[4] = self;
    v21 = a5;
    v20 = v11;
    objc_msgSend(v15, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v16, a5, 0, v17, v18, v19);

  }
}

void __116__HKSleepStagePercentageContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_computePercentageValueFromChartPoints:", a2);
    objc_msgSend(*(id *)(a1 + 32), "_percentageStringFromValue:");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_contextItemWithPercentageString:timeScope:", v5, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v4);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)_contextItemWithPercentageString:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  HKDisplayTypeContextItem *v7;
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

  v6 = a3;
  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  +[HKSleepUtilities sleepStageContextTitleForSleepValue:timeScope:](HKSleepUtilities, "sleepStageContextTitleForSleepValue:timeScope:", -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"), a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v7, "setTitle:", v8);

  v9 = (void *)MEMORY[0x1E0CB3940];
  -[HKDisplayTypeContextItem title](v7, "title");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_chartOverlayAccessibilityIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepColorForSleepAnalysis:", -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:imageColor:](HKDisplayTypeContextItemTitleAccessory, "titleAccessoryWithImagedNamed:imageColor:", CFSTR("circle.fill"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitleAccessory:](v7, "setTitleAccessory:", v13);

  objc_msgSend(MEMORY[0x1E0DC3658], "hk_sleepPrimaryTextColorForSleepAnalysis:", -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayTypeContextItemTitleAccessory titleAccessoryWithImagedNamed:imageColor:](HKDisplayTypeContextItemTitleAccessory, "titleAccessoryWithImagedNamed:imageColor:", CFSTR("circle"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedTitleAccessory:](v7, "setSelectedTitleAccessory:", v15);

  -[HKDisplayTypeContextItem setInfoHidden:](v7, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUseTightSpacingBetweenValueAndUnit:](v7, "setUseTightSpacingBetweenValueAndUnit:", 1);
  -[HKDisplayTypeContextItem setIsUnitIncludedInValue:](v7, "setIsUnitIncludedInValue:", 1);
  -[NSNumberFormatter percentSymbol](self->_percentageFormatter, "percentSymbol");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setUnit:](v7, "setUnit:", v16);

  -[HKDisplayTypeContextItem setValue:](v7, "setValue:", v6);
  objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v7, "setMetricColors:", v18);

  +[HKUIMetricColors sleepColorsForSleepAnalysis:](HKUIMetricColors, "sleepColorsForSleepAnalysis:", -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v7, "setSelectedMetricColors:", v19);

  return v7;
}

- (double)_computePercentageValueFromChartPoints:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t i;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _QWORD v38[4];
  _QWORD v39[4];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "hk_mapToSet:", &__block_literal_global_51);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v35;
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v35 != v7)
          objc_enumerationMutation(v4);
        v14 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v14, "awakeDuration");
        v11 = v11 + v15;
        objc_msgSend(v14, "remSleepDuration");
        v8 = v8 + v16;
        objc_msgSend(v14, "coreSleepDuration");
        v9 = v9 + v17;
        objc_msgSend(v14, "deepSleepDuration");
        v10 = v10 + v18;
        objc_msgSend(v14, "awakeDuration");
        v20 = v19;
        objc_msgSend(v14, "remSleepDuration");
        v22 = v20 + v21;
        objc_msgSend(v14, "coreSleepDuration");
        v24 = v22 + v23;
        objc_msgSend(v14, "deepSleepDuration");
        v12 = v12 + v24 + v25;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 0.0;
    v9 = 0.0;
    v10 = 0.0;
    v11 = 0.0;
    v12 = 0.0;
  }
  v38[0] = &unk_1E9CEC818;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11 / v12 * 100.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v26;
  v38[1] = &unk_1E9CEC830;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8 / v12 * 100.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v27;
  v38[2] = &unk_1E9CEC848;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 / v12 * 100.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v28;
  v38[3] = &unk_1E9CEC860;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10 / v12 * 100.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "roundedSleepStageDurationPercentageFromDurations:withCategoryValue:", v30, -[HKSleepStagePercentageContext sleepStage](self, "sleepStage"));
  if (v12 <= 2.22507386e-308)
    v32 = -1.0;
  else
    v32 = v31;

  return v32;
}

id __72__HKSleepStagePercentageContext__computePercentageValueFromChartPoints___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sleepDaySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)roundedSleepStageDurationPercentageFromDurations:(id)a3 withCategoryValue:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  int v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _QWORD v70[4];
  _QWORD v71[4];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  if (!v9)
  {
    v20 = 0.0;
    v18 = v8;
LABEL_28:

    goto LABEL_29;
  }
  v10 = v9;
  v63 = v6;
  v11 = 0;
  v12 = *(_QWORD *)v67;
  do
  {
    for (i = 0; i != v10; ++i)
    {
      if (*(_QWORD *)v67 != v12)
        objc_enumerationMutation(v8);
      v14 = *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * i);
      objc_msgSend(v8, "objectForKeyedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      if (v17 >= 1.0)
        v11 += (int)v17;
      else
        objc_msgSend(v7, "addObject:", v14);
    }
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v66, v72, 16);
  }
  while (v10);

  if (v11)
  {
    if (v11 == 100)
    {
      v6 = v63;
      objc_msgSend(v8, "objectForKeyedSubscript:", v63);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "doubleValue");
      v20 = v19;
    }
    else
    {
      if (objc_msgSend(v7, "count"))
        v21 = 99;
      else
        v21 = 100;
      v22 = v21 - v11;
      v70[0] = &unk_1E9CEC818;
      v23 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC818);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v64, "doubleValue");
      v25 = v24;
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC818);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "numberWithDouble:", v25 - (double)objc_msgSend(v61, "integerValue"));
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v71[0] = v60;
      v70[1] = &unk_1E9CEC830;
      v26 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC830);
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "doubleValue");
      v28 = v27;
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC830);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "numberWithDouble:", v28 - (double)objc_msgSend(v58, "integerValue"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v71[1] = v57;
      v70[2] = &unk_1E9CEC848;
      v29 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC848);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "doubleValue");
      v32 = v31;
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC848);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "numberWithDouble:", v32 - (double)objc_msgSend(v33, "integerValue"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v71[2] = v34;
      v70[3] = &unk_1E9CEC860;
      v35 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC860);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "doubleValue");
      v38 = v37;
      objc_msgSend(v8, "objectForKeyedSubscript:", &unk_1E9CEC860);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "numberWithDouble:", v38 - (double)objc_msgSend(v39, "integerValue"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v71[3] = v40;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 4);
      v41 = (void *)objc_claimAutoreleasedReturnValue();

      v62 = v41;
      objc_msgSend(v41, "keysSortedByValueUsingComparator:", &__block_literal_global_206);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v8);
      v43 = objc_msgSend(v42, "count");
      if (v22 >= 1 && v43 >= 1)
      {
        v44 = 0;
        v45 = v43;
        do
        {
          objc_msgSend(v42, "objectAtIndexedSubscript:", v44);
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = objc_msgSend(v7, "containsObject:", v46);

          if ((v47 & 1) != 0)
          {
            ++v22;
          }
          else
          {
            v48 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(v42, "objectAtIndexedSubscript:", v44);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "objectForKey:", v49);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v50, "doubleValue");
            objc_msgSend(v48, "numberWithDouble:", v51 + 1.0);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "objectAtIndexedSubscript:", v44);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "setObject:forKey:", v52, v53);

          }
          ++v44;
        }
        while (v44 < v22 && v44 < v45);
      }
      v6 = v63;
      objc_msgSend(v65, "objectForKeyedSubscript:", v63);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "doubleValue");
      v20 = v55;

      v18 = v62;
    }
    goto LABEL_28;
  }
  v20 = 0.0;
  v6 = v63;
LABEL_29:

  return v20;
}

uint64_t __100__HKSleepStagePercentageContext_roundedSleepStageDurationPercentageFromDurations_withCategoryValue___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

- (id)_percentageStringFromValue:(double)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v8;
  void *v9;

  if (a3 == -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"), -1.0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("NO_DATA_PERCENT");
LABEL_9:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Acacia"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a3 > 2.22507386e-308 && a3 < 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("LESS_THAN_1_PERCENT");
    goto LABEL_9;
  }
  -[HKSleepStagePercentageContext percentageFormatter](self, "percentageFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 / 100.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromNumber:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  return v9;
}

- (int64_t)sleepStage
{
  return self->_sleepStage;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (HKDisplayType)baseDisplayType
{
  return self->_baseDisplayType;
}

- (HKDisplayType)overlayDisplayType
{
  return self->_overlayDisplayType;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (HKOverlaySleepRoomContextChangeDelegate)contextChangeDelegate
{
  return (HKOverlaySleepRoomContextChangeDelegate *)objc_loadWeakRetained((id *)&self->_contextChangeDelegate);
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_destroyWeak((id *)&self->_contextChangeDelegate);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayDisplayType, 0);
  objc_storeStrong((id *)&self->_baseDisplayType, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
}

@end
