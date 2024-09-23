@implementation HKInteractiveChartActivityController

+ (id)_codableActivitySummaryFromSummary:(id)a3
{
  id v5;
  HKCodableActivitySummaryEntry *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;

  v5 = a3;
  v6 = objc_alloc_init(HKCodableActivitySummaryEntry);
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateComponentsForCalendar:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hour");

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(v5, "_gregorianDateComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      v12 = (void *)objc_msgSend(v10, "copy");

      objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithUTCTimeZone");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setCalendar:", v13);

      v10 = v12;
    }
    objc_msgSend(v10, "hkui_codableDateComponents");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKCodableActivitySummaryEntry setGregorianDateComponents:](v6, "setGregorianDateComponents:", v14);

    -[HKCodableActivitySummaryEntry setActivityMoveMode:](v6, "setActivityMoveMode:", objc_msgSend(v5, "activityMoveMode"));
    objc_msgSend(v5, "activeEnergyBurned");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v5, "activeEnergyBurned");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "codableRepresentation");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setActiveEnergyBurned:](v6, "setActiveEnergyBurned:", v17);

    }
    objc_msgSend(v5, "appleMoveTime");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v5, "appleMoveTime");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "codableRepresentation");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setAppleMoveTime:](v6, "setAppleMoveTime:", v20);

    }
    objc_msgSend(v5, "appleExerciseTime");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      objc_msgSend(v5, "appleExerciseTime");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "codableRepresentation");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setAppleExerciseTime:](v6, "setAppleExerciseTime:", v23);

    }
    objc_msgSend(v5, "appleStandHours");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v5, "appleStandHours");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "codableRepresentation");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setAppleStandHours:](v6, "setAppleStandHours:", v26);

    }
    objc_msgSend(v5, "activeEnergyBurnedGoal");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      objc_msgSend(v5, "activeEnergyBurnedGoal");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "codableRepresentation");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setActiveEnergyBurnedGoal:](v6, "setActiveEnergyBurnedGoal:", v29);

    }
    objc_msgSend(v5, "appleMoveTimeGoal");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (v30)
    {
      objc_msgSend(v5, "appleMoveTimeGoal");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "codableRepresentation");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setAppleMoveTimeGoal:](v6, "setAppleMoveTimeGoal:", v32);

    }
    objc_msgSend(v5, "exerciseTimeGoal");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    if (v33)
    {
      objc_msgSend(v5, "exerciseTimeGoal");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "codableRepresentation");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setAppleExerciseTimeGoal:](v6, "setAppleExerciseTimeGoal:", v35);

    }
    objc_msgSend(v5, "standHoursGoal");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      objc_msgSend(v5, "standHoursGoal");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "codableRepresentation");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKCodableActivitySummaryEntry setAppleStandHoursGoal:](v6, "setAppleStandHoursGoal:", v38);

    }
    -[HKCodableActivitySummaryEntry setPaused:](v6, "setPaused:", objc_msgSend(v5, "isPaused"));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKInteractiveChartActivityController.m"), 1298, CFSTR("There is no support for encoding hourly activity summaries"));
  }

  return v6;
}

+ (id)_codableActivitySummaryDataFromSummaries:(id)a3
{
  id v4;
  HKCodableActivitySummaryCollection *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(HKCodableActivitySummaryCollection);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_codableActivitySummaryFromSummary:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKCodableActivitySummaryCollection addActivitySummaryEntry:](v5, "addActivitySummaryEntry:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (void)encodeChartDataWithHealthStore:(id)a3 dateCache:(id)a4 displayTypeController:(id)a5 unitController:(id)a6 activityMoveMode:(int64_t)a7 monthDateInterval:(id)a8 sixMonthDateInterval:(id)a9 completion:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  HKActivitySummaryDataProvider *v23;

  v16 = a10;
  v17 = a9;
  v18 = a8;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = -[HKActivitySummaryDataProvider initWithHealthStore:dateCache:displayTypeController:unitController:activityMoveMode:]([HKActivitySummaryDataProvider alloc], "initWithHealthStore:dateCache:displayTypeController:unitController:activityMoveMode:", v22, v21, v20, v19, a7);

  +[_ActivityRemoteDataGathererManager gatherDataWithActivitySummaryDataProvider:monthDateInterval:sixMonthDateInterval:completion:](_ActivityRemoteDataGathererManager, "gatherDataWithActivitySummaryDataProvider:monthDateInterval:sixMonthDateInterval:completion:", v23, v18, v17, v16);
}

- (HKInteractiveChartActivityController)initWithHealthStore:(id)a3 unitPreferenceController:(id)a4 dateCache:(id)a5 chartDataCacheController:(id)a6 selectedTimeScopeController:(id)a7 sampleTypeDateRangeController:(id)a8 wheelchairUseCharacteristicCache:(id)a9 initialXValue:(id)a10 activityMoveMode:(int64_t)a11 activityOptions:(unint64_t)a12 chartSharableModel:(id)a13
{
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  int64_t v26;
  id v27;
  HKActivitySummaryDataProvider *v28;
  id v29;
  unint64_t v30;
  int64_t v31;
  uint64_t v32;
  void *v33;
  _BOOL8 v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  uint64_t v51;
  void *v52;
  HKInteractiveChartActivityController *v53;
  void *v54;
  HKActivitySummaryDataProvider *v55;
  HKActivitySummaryAnnotationViewDataSource *v56;
  void *v57;
  HKActivitySummaryAnnotationViewDataSource *v58;
  uint64_t v59;
  HKActivitySummaryAnnotationViewDataSource *activityAnnotationDataSource;
  uint64_t v61;
  NSMapTable *yAxisAccessoryViewsByGraphSeries;
  void *v64;
  uint64_t v65;
  int64_t v67;
  void *v68;
  uint64_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  void *v74;
  id v75;
  id v76;
  id obj;
  id v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  objc_super v85;
  _QWORD v86[2];
  _QWORD v87[2];
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v19 = a3;
  v84 = a4;
  v20 = a5;
  v80 = a9;
  v21 = a13;
  v73 = a10;
  v72 = a8;
  v71 = a7;
  v70 = a6;
  v83 = v19;
  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v19);
  v22 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    -[HKInteractiveChartActivityController _buildSummariesTableFromSharableModel:](self, "_buildSummariesTableFromSharableModel:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _timeScopeRangesFromSharableModel:](self, "_timeScopeRangesFromSharableModel:", v21);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = v23;
    objc_msgSend(v23, "objectForKeyedSubscript:", &unk_1E9CECF98);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "firstObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = a11;
    if (v25)
      v26 = objc_msgSend(v25, "activityMoveMode");
    v67 = -[HKInteractiveChartActivityController _findFirstWeekdayFromModel:](self, "_findFirstWeekdayFromModel:", v21);

    v27 = v20;
  }
  else
  {
    v79 = 0;
    v82 = 0;
    v67 = -1;
    v27 = v20;
    v26 = a11;
  }
  v28 = -[HKActivitySummaryDataProvider initWithHealthStore:dateCache:displayTypeController:unitController:activityMoveMode:]([HKActivitySummaryDataProvider alloc], "initWithHealthStore:dateCache:displayTypeController:unitController:activityMoveMode:", v83, v27, v22, v84, v26);
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v30 = a12;
  v31 = -[HKInteractiveChartActivityController _countOfStackedChartsFromActivityOptions:](self, "_countOfStackedChartsFromActivityOptions:", a12);
  v78 = v21;
  v74 = v27;
  v81 = v29;
  v69 = v31;
  if ((a12 & 1) != 0)
  {
    v36 = 0;
    v76 = 0;
    v35 = v80;
  }
  else
  {
    if (v26 == 2)
      v32 = 5;
    else
      v32 = 4;
    -[HKInteractiveChartActivityController _activityYAxisForActivityValue:zeroOnly:stackOffset:bottomLabelPadding:displayTypeController:unitPreferenceController:](self, "_activityYAxisForActivityValue:zeroOnly:stackOffset:bottomLabelPadding:displayTypeController:unitPreferenceController:", v26 == 2, v31 > 1, 0, v22, v84, 0.0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v26 == 2;
    v35 = v80;
    -[HKInteractiveChartActivityController _displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:](self, "_displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:", v34, v33, v28, v22, v84, v80, v82, a12);
    v36 = objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:](self, "_displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:", v32, v33, v28, v22, v84, v80, v82, a12);
    v88 = v36;
    v89 = objc_claimAutoreleasedReturnValue();
    v76 = (id)v89;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v88, 2);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addObject:", v37);

    v30 = a12;
  }
  v38 = (void *)v22;
  obj = (id)v36;
  if ((v30 & 2) != 0)
  {
    v40 = 0;
    v41 = 0;
  }
  else
  {
    -[HKInteractiveChartActivityController _activityYAxisForActivityValue:zeroOnly:stackOffset:bottomLabelPadding:displayTypeController:unitPreferenceController:](self, "_activityYAxisForActivityValue:zeroOnly:stackOffset:bottomLabelPadding:displayTypeController:unitPreferenceController:", 2, v69 > 1, 1, v22, v84, 0.0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:](self, "_displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:", 2, v39, v28, v22, v84, v35, v82, v30);
    v40 = objc_claimAutoreleasedReturnValue();
    v38 = (void *)v22;
    -[HKInteractiveChartActivityController _displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:](self, "_displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:", 6, v39, v28, v22, v84, v35, v82, v30);
    v41 = objc_claimAutoreleasedReturnValue();
    v87[0] = v40;
    v87[1] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 2);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "addObject:", v42);

    v30 = a12;
  }
  v75 = (id)v40;
  v68 = (void *)v41;
  if ((v30 & 4) != 0)
  {
    v44 = 0;
    v45 = 0;
    v48 = v78;
    v47 = v81;
  }
  else
  {
    -[HKInteractiveChartActivityController _activityYAxisForActivityValue:zeroOnly:stackOffset:bottomLabelPadding:displayTypeController:unitPreferenceController:](self, "_activityYAxisForActivityValue:zeroOnly:stackOffset:bottomLabelPadding:displayTypeController:unitPreferenceController:", 3, v69 > 1, 2, v38, v84, 5.0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:](self, "_displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:", 3, v43, v28, v38, v84, v35, v82, v30);
    v44 = objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:](self, "_displayTypeForActivityValue:yAxis:dataProvider:displayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:timescopeToSummariesTable:activityOptions:", 7, v43, v28, v38, v84, v35, v82, v30);
    v45 = objc_claimAutoreleasedReturnValue();
    v86[0] = v44;
    v86[1] = v45;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v81;
    objc_msgSend(v81, "addObject:", v46);

    v48 = v78;
  }
  v49 = (void *)v45;
  if ((unint64_t)objc_msgSend(v47, "count") >= 4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartActivityController.m"), 469, CFSTR("Unexpected stacked charts count for activity summary"));

  }
  v50 = objc_msgSend(v47, "count");
  v51 = 12288;
  if (v50 > 1)
    v51 = 77824;
  if (v48)
    v51 |= 0x20000uLL;
  v85.receiver = self;
  v85.super_class = (Class)HKInteractiveChartActivityController;
  v52 = v84;
  v53 = -[HKInteractiveChartOverlayViewController initWithStackedDisplayTypes:primaryDisplayTypeStackIndex:stackedDisplayTypeHeights:healthStore:unitPreferenceController:dateCache:chartDataCacheController:selectedTimeScopeController:sampleTypeDateRangeController:initialXValue:currentCalendarOverride:options:timeScopeRanges:](&v85, sel_initWithStackedDisplayTypes_primaryDisplayTypeStackIndex_stackedDisplayTypeHeights_healthStore_unitPreferenceController_dateCache_chartDataCacheController_selectedTimeScopeController_sampleTypeDateRangeController_initialXValue_currentCalendarOverride_options_timeScopeRanges_, v47, 0, 0, v83, v84, v74, v70, v71, v72, v73, 0, v51, v79);

  v54 = (void *)v44;
  v55 = v28;
  if (v53)
  {
    objc_storeStrong((id *)&v53->_moveValueDisplayType, obj);
    objc_storeStrong((id *)&v53->_moveGoalDisplayType, v76);
    objc_storeStrong((id *)&v53->_exerciseValueDisplayType, v75);
    objc_storeStrong((id *)&v53->_exerciseGoalDisplayType, v68);
    objc_storeStrong((id *)&v53->_standValueDisplayType, v54);
    objc_storeStrong((id *)&v53->_standGoalDisplayType, v49);
    objc_storeStrong((id *)&v53->_activityDataProvider, v28);
    v53->_isChartSharingContext = v48 != 0;
    v56 = [HKActivitySummaryAnnotationViewDataSource alloc];
    -[HKInteractiveChartViewController displayTypeController](v53, "displayTypeController");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v65) = v53->_isChartSharingContext;
    v58 = v56;
    v52 = v84;
    v59 = -[HKActivitySummaryAnnotationViewDataSource initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:dateCache:currentValueViewContext:activityOptions:firstWeekday:isChartSharingContext:](v58, "initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:dateCache:currentValueViewContext:activityOptions:firstWeekday:isChartSharingContext:", v57, v84, v80, v74, 0, a12, v67, v65);
    activityAnnotationDataSource = v53->_activityAnnotationDataSource;
    v53->_activityAnnotationDataSource = (HKActivitySummaryAnnotationViewDataSource *)v59;

    v48 = v78;
    v55 = v28;
    -[HKActivitySummaryAnnotationViewDataSource setActivitySummary:](v53->_activityAnnotationDataSource, "setActivitySummary:", 0);
    v53->_currentTimeScope = 2;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v61 = objc_claimAutoreleasedReturnValue();
    yAxisAccessoryViewsByGraphSeries = v53->_yAxisAccessoryViewsByGraphSeries;
    v53->_yAxisAccessoryViewsByGraphSeries = (NSMapTable *)v61;

    objc_storeStrong((id *)&v53->_wheelchairUseCharacteristicCache, a9);
    v53->_activityOptions = a12;
    -[HKInteractiveChartViewController addChartViewObserver:](v53, "addChartViewObserver:", v53);
  }

  return v53;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)HKInteractiveChartActivityController;
  v4 = a3;
  -[HKInteractiveChartViewController traitCollectionDidChange:](&v10, sel_traitCollectionDidChange_, v4);
  -[HKInteractiveChartActivityController traitCollection](self, "traitCollection", v10.receiver, v10.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = objc_msgSend(v4, "userInterfaceStyle");

  if (v6 != v7)
  {
    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "graphView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "resetAndRedraw");

  }
}

- (id)buildFactorContextForDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _ActivityFactorContext *v19;
  void *v20;
  _ActivityFactorContext *v21;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  v19 = [_ActivityFactorContext alloc];
  -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[_ActivityFactorContext initWithPrimaryDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:activityCurrentValueView:](v19, "initWithPrimaryDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:activityCurrentValueView:", v18, v17, v16, v15, v14, a8, v20);

  return v21;
}

- (id)_buildSummariesTableFromSharableModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v4, "hasSixMonthData"))
  {
    objc_msgSend(v4, "sixMonthData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _decodeActivitySummariesFromQueryData:](self, "_decodeActivitySummariesFromQueryData:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, &unk_1E9CECFB0);

  }
  if (objc_msgSend(v4, "hasMonthData"))
  {
    objc_msgSend(v4, "monthData");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _decodeActivitySummariesFromQueryData:](self, "_decodeActivitySummariesFromQueryData:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, &unk_1E9CECF98);

  }
  return v5;
}

- (id)_decodeActivitySummariesFromQueryData:(id)a3
{
  id v3;
  HKCodableActivitySummaryCollection *v4;
  void *v5;
  HKCodableActivitySummaryCollection *v6;
  void *v7;

  v3 = a3;
  v4 = [HKCodableActivitySummaryCollection alloc];
  objc_msgSend(v3, "queryDataObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[HKCodableActivitySummaryCollection initWithData:](v4, "initWithData:", v5);
  +[HKInteractiveChartActivityController _activitySummariesFromCodableCollection:](HKInteractiveChartActivityController, "_activitySummariesFromCodableCollection:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_timeScopeRangesFromSharableModel:(id)a3
{
  void *v3;
  id v4;
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
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3588];
  v4 = a3;
  objc_msgSend(v4, "monthDateInterval");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3588];
  objc_msgSend(v4, "sixMonthDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_dateIntervalWithCodableDateInterval:sourceTimeZone:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "startDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "startDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = &unk_1E9CECF98;
  v18[1] = &unk_1E9CECFB0;
  v19[0] = v12;
  v19[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)_findFirstWeekdayFromModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int64_t v11;

  v3 = a3;
  v4 = v3;
  if (!v3)
    goto LABEL_9;
  if (!objc_msgSend(v3, "hasMonthData")
    || (objc_msgSend(v4, "monthData"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "hasFirstWeekday"),
        v5,
        !v6))
  {
    if (objc_msgSend(v4, "hasSixMonthData"))
    {
      objc_msgSend(v4, "sixMonthData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "hasFirstWeekday");

      if (v9)
      {
        objc_msgSend(v4, "sixMonthData");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
LABEL_9:
    v11 = -1;
    goto LABEL_10;
  }
  objc_msgSend(v4, "monthData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v10 = v7;
  v11 = objc_msgSend(v7, "firstWeekday");

LABEL_10:
  return v11;
}

- (int64_t)_countOfStackedChartsFromActivityOptions:(unint64_t)a3
{
  unint64_t v3;

  v3 = 2 - (a3 & 1);
  if ((a3 & 2) == 0)
    v3 = a3 & 1 ^ 3;
  return v3 + ((uint64_t)(a3 << 61) >> 63);
}

- (id)_lineColorForActivityValue:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if ((unint64_t)a3 > 7)
    return 0;
  if (((1 << a3) & 0x33) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalLineColor", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (((1 << a3) & 0x44) != 0)
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityExerciseGoalLineColor", v3, v4);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityStandGoalLineColor", v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_metGoalFillStyleForActivityValue:(int64_t)a3 useGradient:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HKSolidFillStyle *v10;

  v4 = a4;
  if ((unint64_t)a3 <= 7)
  {
    if (((1 << a3) & 0x33) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalMetGradientTopColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalMetGradientBottomColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalMetNonGradientColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << a3) & 0x44) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityExerciseGoalMetGradientTopColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityExerciseGoalMetGradientBottomColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityStandGoalMetGradientTopColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityStandGoalMetGradientBottomColor");
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      v5 = v7;
    }
    v9 = v7;
    if (v4)
      goto LABEL_9;
LABEL_11:
    v10 = objc_alloc_init(HKSolidFillStyle);
    -[HKSolidFillStyle setColor:](v10, "setColor:", v9);
    goto LABEL_12;
  }
  v5 = 0;
  v6 = 0;
  v9 = 0;
  if (!a4)
    goto LABEL_11;
LABEL_9:
  v10 = -[HKGradientFillStyle initWithFirstColor:secondColor:]([HKGradientFillStyle alloc], "initWithFirstColor:secondColor:", v5, v6);
LABEL_12:

  return v10;
}

- (id)_missedGoalFillStyleForActivityValue:(int64_t)a3 useGradient:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  HKSolidFillStyle *v10;

  v4 = a4;
  if ((unint64_t)a3 <= 7)
  {
    if (((1 << a3) & 0x33) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalMissedGradientTopColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalMissedGradientBottomColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalMissedNonGradientColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (((1 << a3) & 0x44) != 0)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityExerciseGoalMissedGradientTopColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityExerciseGoalMissedGradientBottomColor");
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityStandGoalMissedGradientTopColor");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityStandGoalMissedGradientBottomColor");
      }
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v8;
      v5 = v7;
    }
    v9 = v7;
    if (v4)
      goto LABEL_9;
LABEL_11:
    v10 = objc_alloc_init(HKSolidFillStyle);
    -[HKSolidFillStyle setColor:](v10, "setColor:", v9);
    goto LABEL_12;
  }
  v5 = 0;
  v6 = 0;
  v9 = 0;
  if (!a4)
    goto LABEL_11;
LABEL_9:
  v10 = -[HKGradientFillStyle initWithFirstColor:secondColor:]([HKGradientFillStyle alloc], "initWithFirstColor:secondColor:", v5, v6);
LABEL_12:

  return v10;
}

- (id)_pausedFillStyleForActivityValue:(int64_t)a3
{
  HKSolidFillStyle *v3;
  void *v4;

  v3 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityPausedColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v3, "setColor:", v4);

  return v3;
}

- (id)_titleForActivityValue:(int64_t)a3 wheelchairUseCharacteristicCache:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;
  void *v12;

  v5 = a4;
  v6 = v5;
  if ((unint64_t)a3 > 7)
  {
    v10 = CFSTR("None");
    goto LABEL_9;
  }
  if (((1 << a3) & 0x33) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("MOVE_CHART_TITLE");
  }
  else
  {
    if (((1 << a3) & 0x44) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB6780], "localizationStringSuffixForWheelchairUser:", objc_msgSend(v5, "isWheelchairUser"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(CFSTR("STAND_CHART_TITLE"), "stringByAppendingString:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", v12, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("EXERCISE_CHART_TITLE");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_8:

LABEL_9:
  return v10;
}

- (int64_t)_representativeDataTypeForActivityValue:(int64_t)a3
{
  if ((unint64_t)a3 > 7)
    return 3;
  else
    return qword_1D7B828A0[a3];
}

- (id)_unitForActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a5;
  _DisplayTypeForActivityValue(a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedDisplayNameForDisplayType:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_displayTypeForActivityValue:(int64_t)a3 yAxis:(id)a4 dataProvider:(id)a5 displayTypeController:(id)a6 unitPreferenceController:(id)a7 wheelchairUseCharacteristicCache:(id)a8 timescopeToSummariesTable:(id)a9 activityOptions:(unint64_t)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  _ActivitySourceDelegateSharing *v26;
  id v27;
  id v28;
  HKDateRangeDataSource *v29;
  void *v30;
  void *v31;
  HKInteractiveChartGenericStatFormatter *v32;
  void *v33;
  int64_t v34;
  void *v35;
  HKInteractiveChartDisplayType *v36;
  _ActivitySourceDelegateSharing *v38;
  void *v39;
  void *v40;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v39 = v19;
  v40 = v16;
  if (v19)
  {
    v20 = v19;
    v21 = (void *)MEMORY[0x1E0C99D48];
    v22 = a8;
    v23 = a4;
    objc_msgSend(v21, "currentCalendar");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v17;
    v26 = -[_ActivitySourceDelegateSharing initWithTimescopeToSummariesTable:activityValue:displayTypeController:unitPreferenceController:calendar:]([_ActivitySourceDelegateSharing alloc], "initWithTimescopeToSummariesTable:activityValue:displayTypeController:unitPreferenceController:calendar:", v20, a3, v17, v18, v24);

  }
  else
  {
    v27 = a8;
    v28 = a4;
    v25 = v17;
    v26 = -[_ActivitySourceDelegateProvider initWithDataProvider:activityValue:displayTypeController:unitPreferenceController:]([_ActivitySourceDelegateProvider alloc], "initWithDataProvider:activityValue:displayTypeController:unitPreferenceController:", v16, a3, v17, v18);
  }
  v38 = v26;
  v29 = -[HKDateRangeDataSource initWithSourceDelegate:]([HKDateRangeDataSource alloc], "initWithSourceDelegate:", v26);
  v30 = v18;
  -[HKInteractiveChartActivityController _activitySeriesForActivityValue:wheelchairUseCharacteristicCache:unitPreferenceController:displayTypeController:activityOptions:](self, "_activitySeriesForActivityValue:wheelchairUseCharacteristicCache:unitPreferenceController:displayTypeController:activityOptions:", a3, a8, v18, v25, a10);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setYAxis:", a4);

  objc_msgSend(v31, "setDataSource:", v29);
  v32 = objc_alloc_init(HKInteractiveChartGenericStatFormatter);
  -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](v32, "setOverrideStatFormatterItemOptions:", &unk_1E9CEA688);
  -[HKInteractiveChartActivityController _unitForActivityValue:displayTypeController:unitPreferenceController:](self, "_unitForActivityValue:displayTypeController:unitPreferenceController:", a3, v25, v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[HKInteractiveChartActivityController _representativeDataTypeForActivityValue:](self, "_representativeDataTypeForActivityValue:", a3);
  -[HKInteractiveChartActivityController _titleForActivityValue:wheelchairUseCharacteristicCache:](self, "_titleForActivityValue:wheelchairUseCharacteristicCache:", a3, a8);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = -[HKInteractiveChartDisplayType initWithGraphSeries:displayName:unitName:valueFormatter:dataTypeCode:]([HKInteractiveChartDisplayType alloc], "initWithGraphSeries:displayName:unitName:valueFormatter:dataTypeCode:", v31, v35, v33, v32, v34);
  return v36;
}

- (id)_activitySeriesForActivityValue:(int64_t)a3 wheelchairUseCharacteristicCache:(id)a4 unitPreferenceController:(id)a5 displayTypeController:(id)a6 activityOptions:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  __CFString *v17;
  void *v18;
  id v19;
  id v20;
  BOOL v21;
  _BOOL8 v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  id v28;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[HKInteractiveChartActivityController _lineColorForActivityValue:](self, "_lineColorForActivityValue:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKInteractiveChartActivityController _countOfStackedChartsFromActivityOptions:](self, "_countOfStackedChartsFromActivityOptions:", a7);
  if (v16 < 2)
  {
    v17 = &stru_1E9C4C428;
  }
  else
  {
    -[HKInteractiveChartActivityController _titleForActivityValue:wheelchairUseCharacteristicCache:](self, "_titleForActivityValue:wheelchairUseCharacteristicCache:", a3, v12);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) == 4)
  {
    -[HKInteractiveChartActivityController _generateActivityGoalLineSeriesWithColor:](self, "_generateActivityGoalLineSeriesWithColor:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v28 = v14;
    v19 = v13;
    v20 = v12;
    v21 = v16 < 2;
    v22 = v16 > 1;
    -[HKInteractiveChartActivityController _metGoalFillStyleForActivityValue:useGradient:](self, "_metGoalFillStyleForActivityValue:useGradient:", a3, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _missedGoalFillStyleForActivityValue:useGradient:](self, "_missedGoalFillStyleForActivityValue:useGradient:", a3, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController _pausedFillStyleForActivityValue:](self, "_pausedFillStyleForActivityValue:", a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v27) = v21;
    v12 = v20;
    v13 = v19;
    v14 = v28;
    -[HKInteractiveChartActivityController _generateActivityBarSeriesWithColor:legendTitle:metGoalFillStyle:missedGoalFillStyle:pausedFillStyle:activityValue:unitPreferenceController:displayTypeController:drawLegendsInsideSeries:](self, "_generateActivityBarSeriesWithColor:legendTitle:metGoalFillStyle:missedGoalFillStyle:pausedFillStyle:activityValue:unitPreferenceController:displayTypeController:drawLegendsInsideSeries:", v15, v17, v23, v24, v25, a3, v13, v28, v27);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v18;
}

- (id)_zeroStringForActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;

  v7 = a4;
  v8 = a5;
  if ((unint64_t)(a3 - 1) < 2)
  {
    objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
    v9 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v10 = (void *)v9;
    objc_msgSend(v8, "localizedDisplayNameForUnit:value:", v9, &unk_1E9CECFE0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (a3)
  {
    if (a3 != 3)
    {
LABEL_10:
      v13 = &stru_1E9C4C428;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB6CD0], "hourUnit");
    v9 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  _DisplayTypeForActivityValue(0, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unitForDisplayType:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDisplayNameForUnit:value:", v12, &unk_1E9CECFE0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
  if (!v11)
    goto LABEL_10;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("0 %@"), v11);
  v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_11:
  return v13;
}

- (id)_activityYAxisForActivityValue:(int64_t)a3 zeroOnly:(BOOL)a4 stackOffset:(int64_t)a5 bottomLabelPadding:(double)a6 displayTypeController:(id)a7 unitPreferenceController:(id)a8
{
  _BOOL4 v10;
  id v12;
  id v13;
  HKSolidFillStyle *v14;
  void *v15;
  HKAxisStyle *v16;
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
  HKNumericAxisConfiguration *v27;
  void *v28;
  HKNumericAxisZeroOnly *v29;
  HKAxisLabelDimensionDisplayType *v30;
  HKNumericAxisZeroOnly *v31;

  v10 = a4;
  v12 = a7;
  v13 = a8;
  v14 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v14, "setColor:", v15);

  v16 = objc_alloc_init(HKAxisStyle);
  HKDefaultChartYAxisColor();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v17, v18, 2, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setLabelStyle:](v16, "setLabelStyle:", v19);

  -[HKAxisStyle setTickPositions:](v16, "setTickPositions:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v20, 2.0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setAxisLineStyle:](v16, "setAxisLineStyle:", v21);

  -[HKAxisStyle setFillStyle:](v16, "setFillStyle:", v14);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v22, HKUIOnePixel());
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKAxisStyle setBorderStyleForFill:](v16, "setBorderStyleForFill:", v23);
  -[HKAxisStyle setFillInnerPadding:](v16, "setFillInnerPadding:", 4.0);
  -[HKAxisStyle setFillOuterPadding:](v16, "setFillOuterPadding:", 4.0);
  -[HKAxisStyle setLocation:](v16, "setLocation:", 1);
  -[HKAxisStyle setShowGridLines:](v16, "setShowGridLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "colorWithAlphaComponent:", 0.5);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v25, 0.5);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setGridLineStyle:](v16, "setGridLineStyle:", v26);

  v27 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setPreferredStyle:](v27, "setPreferredStyle:", v16);
  if (v10)
  {
    -[HKInteractiveChartActivityController _zeroStringForActivityValue:displayTypeController:unitPreferenceController:](self, "_zeroStringForActivityValue:displayTypeController:unitPreferenceController:", a3, v12, v13);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v27, "setTopVerticalLabelPadding:", 0.0);
    -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v27, "setBottomVerticalLabelPadding:", a6);
    -[HKAxisConfiguration setMinLabels:](v27, "setMinLabels:", 2);
    -[HKAxisConfiguration setMaxLabels:](v27, "setMaxLabels:", 20);
    v29 = -[HKNumericAxisZeroOnly initWithZeroLabel:axisConfiguration:]([HKNumericAxisZeroOnly alloc], "initWithZeroLabel:axisConfiguration:", v28, v27);
  }
  else
  {
    -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v27, "setTopVerticalLabelPadding:", 10.0);
    -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v27, "setBottomVerticalLabelPadding:", a6);
    -[HKAxisConfiguration setMinLabels:](v27, "setMinLabels:", 2);
    -[HKAxisConfiguration setMaxLabels:](v27, "setMaxLabels:", 3);
    -[HKInteractiveChartActivityController _displayTypeForUnits:displayTypeController:](self, "_displayTypeForUnits:displayTypeController:", a3, v12);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v30 = -[HKAxisLabelDimensionDisplayType initWithDisplayType:unitPreferencesController:]([HKAxisLabelDimensionDisplayType alloc], "initWithDisplayType:unitPreferencesController:", v28, v13);
      -[HKNumericAxisConfiguration setLabelDimension:](v27, "setLabelDimension:", v30);

    }
    v29 = -[HKNumericAxis initWithConfiguration:]([HKNumericAxis alloc], "initWithConfiguration:", v27);
  }
  v31 = v29;

  return v31;
}

- (id)_displayTypeForUnits:(int64_t)a3 displayTypeController:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    if (a3 == 3)
    {
      v7 = &unk_1E9CED028;
    }
    else
    {
      if (a3 != 2)
      {
        v8 = 0;
        goto LABEL_9;
      }
      v7 = &unk_1E9CED010;
    }
  }
  else
  {
    v7 = &unk_1E9CECFF8;
  }
  objc_msgSend(v5, "displayTypeWithIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v8;
}

- (id)_generateActivityBarSeriesWithColor:(id)a3 legendTitle:(id)a4 metGoalFillStyle:(id)a5 missedGoalFillStyle:(id)a6 pausedFillStyle:(id)a7 activityValue:(int64_t)a8 unitPreferenceController:(id)a9 displayTypeController:(id)a10 drawLegendsInsideSeries:(BOOL)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _ActivityBarSeries *v23;
  uint64_t v24;
  HKStrokeStyle *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;
  void *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v33 = a3;
  v17 = a4;
  v18 = a10;
  v19 = a9;
  v20 = a7;
  v21 = a6;
  v22 = a5;
  v23 = -[_ActivityBarSeries initWithUnitPreferenceController:activityBarDelegate:displayTypeController:]([_ActivityBarSeries alloc], "initWithUnitPreferenceController:activityBarDelegate:displayTypeController:", v19, self, v18);

  if ((unint64_t)a8 > 7)
    v24 = 0;
  else
    v24 = qword_1D7B828A0[a8];
  -[_ActivityBarSeries setActivityDisplayTypeIdentifier:](v23, "setActivityDisplayTypeIdentifier:", v24);
  v25 = objc_alloc_init(HKStrokeStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.0);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKStrokeStyle setStrokeColor:](v25, "setStrokeColor:", v26);

  -[HKStrokeStyle setLineWidth:](v25, "setLineWidth:", 3.0);
  -[HKStrokeStyle setBlendMode:](v25, "setBlendMode:", 22);
  -[HKBarSeries setUnselectedStrokeStyle:](v23, "setUnselectedStrokeStyle:", v25);
  -[HKBarSeries setUnselectedFillStyle:](v23, "setUnselectedFillStyle:", v22);

  -[_ActivityBarSeries setMissedGoalUnselectedFillStyle:](v23, "setMissedGoalUnselectedFillStyle:", v21);
  -[_ActivityBarSeries setPausedUnselectedFillStyle:](v23, "setPausedUnselectedFillStyle:", v20);

  -[HKBarSeries setSelectedFillStyle:](v23, "setSelectedFillStyle:", 0);
  -[HKBarSeries setSelectedStrokeStyle:](v23, "setSelectedStrokeStyle:", 0);
  -[HKBarSeries setCornerRadii:](v23, "setCornerRadii:", 1.5, 1.5);
  if (v17)
  {
    +[HKLegendEntry legendEntryWithTitle:labelColor:](HKLegendEntry, "legendEntryWithTitle:labelColor:", v17, v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries setTitleLegendEntries:](v23, "setTitleLegendEntries:", v28);

    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKLegendEntry legendEntryWithTitle:labelColor:](HKLegendEntry, "legendEntryWithTitle:labelColor:", &stru_1E9C4C428, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries setDetailLegendEntries:](v23, "setDetailLegendEntries:", v31);

    -[HKGraphSeries setDrawLegendInsideSeries:](v23, "setDrawLegendInsideSeries:", a11);
  }

  return v23;
}

- (id)_generateActivityGoalLineSeriesWithColor:(id)a3
{
  id v3;
  _ActivityGoalLineSeries *v4;

  v3 = a3;
  v4 = -[_ActivityGoalLineSeries initWithColor:]([_ActivityGoalLineSeries alloc], "initWithColor:", v3);

  return v4;
}

+ (id)firstActivitySeriesForGraphView:(id)a3
{
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "allSeries", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v4 = v7;
          goto LABEL_11;
        }
      }
      v4 = (id)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)didUpdateFromDateZoom:(int64_t)a3 toDateZoom:(int64_t)a4 newVisibleRange:(id)a5
{
  self->_currentTimeScope = a4;
}

- (void)configureDisplayTypes:(id)a3 timeScope:(int64_t)a4 stackOffset:(int64_t)a5
{
  void *v5;
  id v6;

  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graphView");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setScrollingOptions:", 1);
}

- (id)makeAnnotationDataSource
{
  void *v3;

  -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController _handleAlternateAnnotationDataViewDataSource:](self, "_handleAlternateAnnotationDataViewDataSource:", v3);

  return -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
}

- (void)_handleAlternateAnnotationDataViewDataSource:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartActivityController;
  -[HKInteractiveChartViewController makeAnnotationDataSource](&v6, sel_makeAnnotationDataSource);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setStandardAnnotationViewDataSource:", v5);

}

- (void)updateSelectionAnnotationDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a3;
  v10 = a4;
  objc_msgSend(v19, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "useActivityAnnotationViewDataSource");

    objc_msgSend(v12, "activitySummaryData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActivitySummary:", v14);

    -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "dateZoom");
    -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTimeScope:", v17);

  }
  else
  {
    -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController healthStore](self, "healthStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "useStandardAnnotationViewDataSourceForContext:displayType:timeScope:resolution:healthStore:viewController:", v19, v10, a5, a6, v16, self);
  }

}

- (id)lollipopAnnotationColor
{
  void *v3;
  int v4;

  -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "useStandardAnnotationDataSource");

  if (v4)
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopBackgroundColor");
  else
    -[HKInteractiveChartActivityController _activityLollipopBackgroundColor](self, "_activityLollipopBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_activityLollipopBackgroundColor
{
  void *v2;
  unint64_t v3;
  void *v4;

  -[HKInteractiveChartActivityController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle");

  if (v3 >= 2)
  {
    if (v3 == 2)
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)descriptionSeriesForGraphView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "allSeries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionSpansForGraphView:(id)a3 timeScope:(int64_t)a4
{
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
  void *v21;
  _QWORD v23[3];
  _QWORD v24[4];

  v24[3] = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartActivityController moveValueDisplayType](self, "moveValueDisplayType", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activityMoveTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController _spanForValueDisplayType:timeScope:title:](self, "_spanForValueDisplayType:timeScope:title:", v6, a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartActivityController exerciseValueDisplayType](self, "exerciseValueDisplayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activityExerciseTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController _spanForValueDisplayType:timeScope:title:](self, "_spanForValueDisplayType:timeScope:title:", v10, a4, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartActivityController standValueDisplayType](self, "standValueDisplayType");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController activityAnnotationDataSource](self, "activityAnnotationDataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activityStandTitle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController _spanForValueDisplayType:timeScope:title:](self, "_spanForValueDisplayType:timeScope:title:", v14, a4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "dataSeriesTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v18;
  v24[0] = v9;
  objc_msgSend(v13, "dataSeriesTitle");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v19;
  v24[1] = v13;
  objc_msgSend(v17, "dataSeriesTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v20;
  v24[2] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, v23, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (id)_spanForValueDisplayType:(id)a3 timeScope:(int64_t)a4 title:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKAccessibilitySpan *v18;

  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "graphSeriesForTimeScope:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "visibleValueRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "minValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController _rangeValueAsNumber:](self, "_rangeValueAsNumber:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "maxValue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController _rangeValueAsNumber:](self, "_rangeValueAsNumber:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "localizedDisplayNameForDisplayType:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[HKAccessibilitySpan initWithTitle:seriesType:dataComprehensionMinYValue:dataComprehensionMaxYValue:dataComprehensionUnitForChart:]([HKAccessibilitySpan alloc], "initWithTitle:seriesType:dataComprehensionMinYValue:dataComprehensionMaxYValue:dataComprehensionUnitForChart:", v8, 2, v13, v15, v17);
  return v18;
}

- (id)_rangeValueAsNumber:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (id)descriptionForChartData:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  id v7;
  HKActivitySummaryAnnotationViewDataSource *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  int64_t v14;
  HKActivitySummaryAnnotationViewDataSource *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  int64_t v20;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v6;
    v8 = [HKActivitySummaryAnnotationViewDataSource alloc];
    -[HKInteractiveChartViewController displayTypeController](self, "displayTypeController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartActivityController wheelchairUseCharacteristicCache](self, "wheelchairUseCharacteristicCache");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartViewController dateCache](self, "dateCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKInteractiveChartActivityController activityOptions](self, "activityOptions");
    v20 = a4;
    v14 = -[HKInteractiveChartViewController annotationDataSourceFirstWeekday](self, "annotationDataSourceFirstWeekday");
    LOBYTE(v19) = -[HKInteractiveChartActivityController isChartSharingContext](self, "isChartSharingContext");
    v15 = -[HKActivitySummaryAnnotationViewDataSource initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:dateCache:currentValueViewContext:activityOptions:firstWeekday:isChartSharingContext:](v8, "initWithDisplayTypeController:unitController:wheelchairUseCharacteristicCache:dateCache:currentValueViewContext:activityOptions:firstWeekday:isChartSharingContext:", v9, v10, v11, v12, 0, v13, v14, v19);

    -[HKInteractiveChartActivityController _handleAlternateAnnotationDataViewDataSource:](self, "_handleAlternateAnnotationDataViewDataSource:", v15);
    objc_msgSend(v7, "activitySummaryData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKActivitySummaryAnnotationViewDataSource setActivitySummary:](v15, "setActivitySummary:", v16);
    -[HKActivitySummaryAnnotationViewDataSource setTimeScope:](v15, "setTimeScope:", v20);
    -[HKActivitySummaryAnnotationViewDataSource descriptionsForActivitySummary](v15, "descriptionsForActivitySummary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (BOOL)chartDataIsAvailable
{
  void *v2;
  char v3;

  -[HKInteractiveChartActivityController activityDataProvider](self, "activityDataProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "activitySummariesAreLoading") ^ 1;

  return v3;
}

- (id)dataSourceForCurrentValueViewString
{
  void *v2;
  void *v3;

  -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentValueDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)makeCurrentValueView
{
  _ActivityCurrentValueView *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  int64_t v9;
  _ActivityCurrentValueView *v10;
  uint64_t v12;

  v3 = [_ActivityCurrentValueView alloc];
  -[HKInteractiveChartViewController displayTypeController](self, "displayTypeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartViewController unitPreferenceController](self, "unitPreferenceController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController wheelchairUseCharacteristicCache](self, "wheelchairUseCharacteristicCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController activityDataProvider](self, "activityDataProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HKInteractiveChartActivityController activityOptions](self, "activityOptions");
  v9 = -[HKInteractiveChartViewController annotationDataSourceFirstWeekday](self, "annotationDataSourceFirstWeekday");
  LOBYTE(v12) = -[HKInteractiveChartActivityController isChartSharingContext](self, "isChartSharingContext");
  v10 = -[_ActivityCurrentValueView initWithDisplayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:currentValueViewCallbacks:activitySummaryDataProvider:activityOptions:firstWeekday:isChartSharingContext:](v3, "initWithDisplayTypeController:unitPreferenceController:wheelchairUseCharacteristicCache:currentValueViewCallbacks:activitySummaryDataProvider:activityOptions:firstWeekday:isChartSharingContext:", v4, v5, v6, self, v7, v8, v9, v12);
  -[HKInteractiveChartActivityController setActivityCurrentValueView:](self, "setActivityCurrentValueView:", v10);

  return -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
}

- (void)updateCurrentValueView:(id)a3 graphView:(id)a4 timeScope:(int64_t)a5 showInfoButton:(BOOL)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;

  v12 = a4;
  v9 = a3;
  -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateWithGraphView:timeScope:", v12, a5);

  }
}

- (void)setCurrentValueViewCallbacks:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[HKInteractiveChartActivityController setActivityCurrentValueViewCallbacks:](self, "setActivityCurrentValueViewCallbacks:", a3);
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tappedOnCurrentValueView_);
  -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v6);

  -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 1);

}

- (void)tappedOnCurrentValueView:(id)a3
{
  void *v4;
  id v5;

  -[HKInteractiveChartActivityController activityCurrentValueViewCallbacks](self, "activityCurrentValueViewCallbacks", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartActivityController activityCurrentValueView](self, "activityCurrentValueView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "didTapOnDateFromCurrentValueView:", v4);

}

- (id)calendarQueryDisplayType
{
  void *v2;
  void *v3;

  -[HKInteractiveChartViewController displayTypeController](self, "displayTypeController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "displayTypeWithIdentifier:", &unk_1E9CED040);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)calendarQuerySampleType
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6978], "activityCacheType");
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 0;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[HKInteractiveChartActivityController traitCollection](self, "traitCollection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceStyle");

  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int64_t)graphSeriesTimeScope
{
  return self->_currentTimeScope;
}

- (id)activitySummaryForCurrentRange
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[HKInteractiveChartViewController primaryGraphViewController](self, "primaryGraphViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "effectiveVisibleRangeActive");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartActivityController _dayActivitySummaryForDateRange:](self, "_dayActivitySummaryForDateRange:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_dayActivitySummaryForDateRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HKInteractiveChartActivityController activityDataProvider](self, "activityDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activitySummariesForDateRange:timeScope:", v4, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingUnit:value:toDate:options:", 64, -1, v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_activitySummaryDateComponentsFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCalendar:", 0);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v6;
  v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v15, "dateComponentsForCalendar:", v7, (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setCalendar:", 0);
        if (objc_msgSend(v16, "isEqual:", v10))
        {
          v12 = v15;

          goto LABEL_11;
        }

      }
      v12 = (id)objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

+ (id)_activitySummariesFromCodableCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "activitySummaryEntrys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_activitySummaryFromCodableSummaryEntry:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)_activitySummaryFromCodableSummaryEntry:(id)a3
{
  id v3;
  id v4;
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
  uint64_t v33;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0CB6278]);
  if (objc_msgSend(v3, "hasGregorianDateComponents"))
  {
    v5 = (void *)MEMORY[0x1E0C99D78];
    objc_msgSend(v3, "gregorianDateComponents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hkui_dateComponentsWithCodableDateComponents:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setGregorianDateComponents:", v7);

  }
  if (objc_msgSend(v3, "hasActivityMoveMode"))
    objc_msgSend(v4, "setActivityMoveMode:", objc_msgSend(v3, "activityMoveMode"));
  if (objc_msgSend(v3, "hasActiveEnergyBurned"))
  {
    v8 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "activeEnergyBurned");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "createWithCodableQuantity:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveEnergyBurned:", v10);

  }
  if (objc_msgSend(v3, "hasAppleMoveTime"))
  {
    v11 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "appleMoveTime");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "createWithCodableQuantity:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppleMoveTime:", v13);

  }
  if (objc_msgSend(v3, "hasAppleExerciseTime"))
  {
    v14 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "appleExerciseTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "createWithCodableQuantity:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppleExerciseTime:", v16);

  }
  if (objc_msgSend(v3, "hasAppleStandHours"))
  {
    v17 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "appleStandHours");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "createWithCodableQuantity:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppleStandHours:", v19);

  }
  if (objc_msgSend(v3, "hasActiveEnergyBurnedGoal"))
  {
    v20 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "activeEnergyBurnedGoal");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "createWithCodableQuantity:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActiveEnergyBurnedGoal:", v22);

  }
  objc_msgSend(v3, "appleMoveTimeGoal");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    v24 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "appleMoveTimeGoal");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "createWithCodableQuantity:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAppleMoveTimeGoal:", v26);

  }
  if (objc_msgSend(v3, "hasAppleExerciseTimeGoal"))
  {
    v27 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "appleExerciseTimeGoal");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "createWithCodableQuantity:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setExerciseTimeGoal:", v29);

  }
  if (objc_msgSend(v3, "hasAppleStandHoursGoal"))
  {
    v30 = (void *)MEMORY[0x1E0CB6A28];
    objc_msgSend(v3, "appleStandHoursGoal");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "createWithCodableQuantity:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setStandHoursGoal:", v32);

  }
  if (objc_msgSend(v3, "hasPaused"))
    v33 = objc_msgSend(v3, "paused");
  else
    v33 = 0;
  objc_msgSend(v4, "setPaused:", v33);

  return v4;
}

- (NSMapTable)yAxisAccessoryViewsByGraphSeries
{
  return self->_yAxisAccessoryViewsByGraphSeries;
}

- (void)setYAxisAccessoryViewsByGraphSeries:(id)a3
{
  objc_storeStrong((id *)&self->_yAxisAccessoryViewsByGraphSeries, a3);
}

- (HKActivitySummaryDataProvider)activityDataProvider
{
  return self->_activityDataProvider;
}

- (void)setActivityDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_activityDataProvider, a3);
}

- (HKActivitySummaryAnnotationViewDataSource)activityAnnotationDataSource
{
  return self->_activityAnnotationDataSource;
}

- (void)setActivityAnnotationDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_activityAnnotationDataSource, a3);
}

- (int64_t)currentTimeScope
{
  return self->_currentTimeScope;
}

- (void)setCurrentTimeScope:(int64_t)a3
{
  self->_currentTimeScope = a3;
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (_ActivityCurrentValueView)activityCurrentValueView
{
  return self->_activityCurrentValueView;
}

- (void)setActivityCurrentValueView:(id)a3
{
  objc_storeStrong((id *)&self->_activityCurrentValueView, a3);
}

- (HKInteractiveChartCurrentValueViewCallbacks)activityCurrentValueViewCallbacks
{
  return (HKInteractiveChartCurrentValueViewCallbacks *)objc_loadWeakRetained((id *)&self->_activityCurrentValueViewCallbacks);
}

- (void)setActivityCurrentValueViewCallbacks:(id)a3
{
  objc_storeWeak((id *)&self->_activityCurrentValueViewCallbacks, a3);
}

- (HKInteractiveChartDisplayType)moveValueDisplayType
{
  return self->_moveValueDisplayType;
}

- (HKInteractiveChartDisplayType)moveGoalDisplayType
{
  return self->_moveGoalDisplayType;
}

- (HKInteractiveChartDisplayType)exerciseValueDisplayType
{
  return self->_exerciseValueDisplayType;
}

- (HKInteractiveChartDisplayType)exerciseGoalDisplayType
{
  return self->_exerciseGoalDisplayType;
}

- (HKInteractiveChartDisplayType)standValueDisplayType
{
  return self->_standValueDisplayType;
}

- (HKInteractiveChartDisplayType)standGoalDisplayType
{
  return self->_standGoalDisplayType;
}

- (unint64_t)activityOptions
{
  return self->_activityOptions;
}

- (BOOL)isChartSharingContext
{
  return self->_isChartSharingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standGoalDisplayType, 0);
  objc_storeStrong((id *)&self->_standValueDisplayType, 0);
  objc_storeStrong((id *)&self->_exerciseGoalDisplayType, 0);
  objc_storeStrong((id *)&self->_exerciseValueDisplayType, 0);
  objc_storeStrong((id *)&self->_moveGoalDisplayType, 0);
  objc_storeStrong((id *)&self->_moveValueDisplayType, 0);
  objc_destroyWeak((id *)&self->_activityCurrentValueViewCallbacks);
  objc_storeStrong((id *)&self->_activityCurrentValueView, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_activityAnnotationDataSource, 0);
  objc_storeStrong((id *)&self->_activityDataProvider, 0);
  objc_storeStrong((id *)&self->_yAxisAccessoryViewsByGraphSeries, 0);
}

@end
