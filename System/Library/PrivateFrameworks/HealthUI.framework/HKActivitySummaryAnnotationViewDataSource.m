@implementation HKActivitySummaryAnnotationViewDataSource

- (HKActivitySummaryAnnotationViewDataSource)initWithDisplayTypeController:(id)a3 unitController:(id)a4 wheelchairUseCharacteristicCache:(id)a5 dateCache:(id)a6 currentValueViewContext:(BOOL)a7 activityOptions:(unint64_t)a8 firstWeekday:(int64_t)a9 isChartSharingContext:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  HKActivitySummaryAnnotationViewDataSource *v20;
  HKActivitySummaryAnnotationViewDataSource *v21;
  uint64_t v22;
  NSArray *columnsForPosition;
  HKInteractiveChartAnnotationViewDataSource *standardAnnotationDataSource;
  objc_super v27;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v27.receiver = self;
  v27.super_class = (Class)HKActivitySummaryAnnotationViewDataSource;
  v20 = -[HKActivitySummaryAnnotationViewDataSource init](&v27, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_displayTypeController, a3);
    objc_storeStrong((id *)&v21->_unitController, a4);
    objc_storeStrong((id *)&v21->_wheelchairUseCharacteristicCache, a5);
    objc_storeStrong((id *)&v21->_dateCache, a6);
    v21->_currentValueViewContext = a7;
    v21->_firstWeekday = a9;
    -[HKActivitySummaryAnnotationViewDataSource _buildColumnPositionsFromOptions:](v21, "_buildColumnPositionsFromOptions:", a8);
    v22 = objc_claimAutoreleasedReturnValue();
    columnsForPosition = v21->_columnsForPosition;
    v21->_columnsForPosition = (NSArray *)v22;

    standardAnnotationDataSource = v21->_standardAnnotationDataSource;
    v21->_standardAnnotationDataSource = 0;

    v21->_useStandardAnnotationDataSource = 0;
    v21->_isChartSharingContext = a10;
  }

  return v21;
}

- (void)setStandardAnnotationViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_standardAnnotationDataSource, a3);
}

- (void)useActivityAnnotationViewDataSource
{
  self->_useStandardAnnotationDataSource = 0;
}

- (void)useStandardAnnotationViewDataSourceForContext:(id)a3 displayType:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 healthStore:(id)a7 viewController:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  self->_useStandardAnnotationDataSource = 1;
  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  -[HKActivitySummaryAnnotationViewDataSource standardAnnotationDataSource](self, "standardAnnotationDataSource");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "updateWithSelectionContext:displayType:timeScope:resolution:healthStore:viewController:", v17, v16, a5, a6, v15, v14);

}

- (id)_buildColumnPositionsFromOptions:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = v4;
  if ((v3 & 1) != 0)
  {
    if ((v3 & 2) != 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v5, "addObject:", &unk_1E9CEC5D8);
    if ((v3 & 4) != 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v4, "addObject:", &unk_1E9CEC5C0);
  if ((v3 & 2) == 0)
    goto LABEL_7;
LABEL_3:
  if ((v3 & 4) == 0)
LABEL_4:
    objc_msgSend(v5, "addObject:", &unk_1E9CEC5F0);
LABEL_5:
  v6 = (void *)objc_msgSend(v5, "copy");

  return v6;
}

- (id)dateViewWithOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[HKActivitySummaryAnnotationViewDataSource useStandardAnnotationDataSource](self, "useStandardAnnotationDataSource"))
  {
    -[HKActivitySummaryAnnotationViewDataSource standardAnnotationDataSource](self, "standardAnnotationDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dateViewWithOrientation:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_gregorianDateComponents");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendarWithLocalTimeZone");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummaryAnnotationViewDataSource _dateColumnWithDateComponents:calendar:orientation:](self, "_dateColumnWithDateComponents:calendar:orientation:", v7, v8, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)leftMarginViewWithOrientation:(int64_t)a3
{
  void *v5;
  void *v6;

  if (-[HKActivitySummaryAnnotationViewDataSource useStandardAnnotationDataSource](self, "useStandardAnnotationDataSource"))
  {
    -[HKActivitySummaryAnnotationViewDataSource standardAnnotationDataSource](self, "standardAnnotationDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leftMarginViewWithOrientation:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[HKActivitySummaryAnnotationViewDataSource _hasRingView](self, "_hasRingView"))
  {
    -[HKActivitySummaryAnnotationViewDataSource _ringColumn](self, "_ringColumn");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (int64_t)numberOfValuesForAnnotationView:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  int64_t v9;

  v4 = a3;
  if (-[HKActivitySummaryAnnotationViewDataSource useStandardAnnotationDataSource](self, "useStandardAnnotationDataSource"))
  {
    -[HKActivitySummaryAnnotationViewDataSource standardAnnotationDataSource](self, "standardAnnotationDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "numberOfValuesForAnnotationView:", v4);
LABEL_6:
    v9 = v6;

    goto LABEL_7;
  }
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPaused");

  if ((v8 & 1) == 0)
  {
    -[HKActivitySummaryAnnotationViewDataSource columnsForPosition](self, "columnsForPosition");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");
    goto LABEL_6;
  }
  v9 = 1;
LABEL_7:

  return v9;
}

- (id)valueViewForColumnAtIndex:(int64_t)a3 orientation:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;

  if (-[HKActivitySummaryAnnotationViewDataSource useStandardAnnotationDataSource](self, "useStandardAnnotationDataSource"))
  {
    -[HKActivitySummaryAnnotationViewDataSource standardAnnotationDataSource](self, "standardAnnotationDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "valueViewForColumnAtIndex:orientation:", a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isPaused");

    if (v10)
    {
      -[HKActivitySummaryAnnotationViewDataSource _pauseColumn](self, "_pauseColumn");
      v11 = objc_claimAutoreleasedReturnValue();
    }
    else if (a3 < 0
           || (-[HKActivitySummaryAnnotationViewDataSource columnsForPosition](self, "columnsForPosition"),
               v12 = (void *)objc_claimAutoreleasedReturnValue(),
               v13 = objc_msgSend(v12, "count"),
               v12,
               v13 <= a3))
    {
      v17 = objc_alloc(MEMORY[0x1E0DC3F10]);
      v11 = objc_msgSend(v17, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    }
    else
    {
      -[HKActivitySummaryAnnotationViewDataSource columnsForPosition](self, "columnsForPosition");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectAtIndexedSubscript:", a3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (int)objc_msgSend(v15, "intValue");

      -[HKActivitySummaryAnnotationViewDataSource viewForColumnType:](self, "viewForColumnType:", v16);
      v11 = objc_claimAutoreleasedReturnValue();
    }
    v8 = (void *)v11;
  }
  return v8;
}

- (id)_pauseColumn
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[HKActivitySummaryAnnotationViewDataSource _pauseTextForTimeScope:](self, "_pauseTextForTimeScope:", -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartActivityValueFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v5);

  -[HKActivitySummaryAnnotationViewDataSource _pauseTextColorForTimeScope:](self, "_pauseTextColorForTimeScope:", -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v6);

  objc_msgSend(v3, "setNumberOfLines:", 0);
  objc_msgSend(v3, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v3, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintLessThanOrEqualToConstant:", 175.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setActive:", 1);

  objc_msgSend(v3, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintEqualToConstant:", 50.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActive:", 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartLollipopAccessibilityIdentifier:", CFSTR("Paused"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v11);

  return v3;
}

- (id)_pauseTextForTimeScope:(int64_t)a3
{
  uint64_t v5;

  v5 = -[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext");
  if ((_DWORD)v5)
  {
    if ((unint64_t)a3 >= 6)
    {
      if ((unint64_t)(a3 - 6) >= 3)
        return (id)v5;
      goto LABEL_6;
    }
LABEL_8:
    -[HKActivitySummaryAnnotationViewDataSource _pausedActivityLongPeriod](self, "_pausedActivityLongPeriod");
    v5 = objc_claimAutoreleasedReturnValue();
    return (id)v5;
  }
  if ((unint64_t)(a3 - 4) >= 5)
  {
    if ((unint64_t)a3 > 3)
      return (id)v5;
    goto LABEL_8;
  }
LABEL_6:
  -[HKActivitySummaryAnnotationViewDataSource _pausedActivityDayPeriod](self, "_pausedActivityDayPeriod");
  v5 = objc_claimAutoreleasedReturnValue();
  return (id)v5;
}

- (id)_pausedActivityLongPeriod
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = -[HKActivitySummaryAnnotationViewDataSource isChartSharingContext](self, "isChartSharingContext");
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isStandalonePhoneSummary");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("ACTIVITY_PAUSED_SELECTION_SHARED_LONG");
  if (v5)
    v8 = CFSTR("ACTIVITY_PAUSED_SELECTION_SHARED_LONG_VEGA");
  v9 = CFSTR("ACTIVITY_PAUSED_SELECTION_LONG_VEGA");
  if (!v5)
    v9 = CFSTR("ACTIVITY_PAUSED_SELECTION_LONG");
  if (v3)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_pausedActivityDayPeriod
{
  _BOOL4 v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  void *v11;

  v3 = -[HKActivitySummaryAnnotationViewDataSource isChartSharingContext](self, "isChartSharingContext");
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_isStandalonePhoneSummary");

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = CFSTR("ACTIVITY_PAUSED_SELECTION_SHARED_DAY");
  if (v5)
    v8 = CFSTR("ACTIVITY_PAUSED_SELECTION_SHARED_DAY_VEGA");
  v9 = CFSTR("ACTIVITY_PAUSED_SELECTION_DAY_VEGA");
  if (!v5)
    v9 = CFSTR("ACTIVITY_PAUSED_SELECTION_DAY");
  if (v3)
    v10 = v8;
  else
    v10 = v9;
  objc_msgSend(v6, "localizedStringForKey:value:table:", v10, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_pauseTextColorForTimeScope:(int64_t)a3
{
  id v3;

  if ((unint64_t)a3 < 6)
  {
    if (!-[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      self = (HKActivitySummaryAnnotationViewDataSource *)objc_claimAutoreleasedReturnValue();
      return self;
    }
    v3 = (id)objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    goto LABEL_5;
  }
  if ((unint64_t)(a3 - 6) < 3)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    self = (HKActivitySummaryAnnotationViewDataSource *)objc_claimAutoreleasedReturnValue();
  }
  return self;
}

- (id)viewForColumnType:(unint64_t)a3
{
  const char *v3;

  switch(a3)
  {
    case 2uLL:
      -[HKActivitySummaryAnnotationViewDataSource _standColumn](self, "_standColumn");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1uLL:
      -[HKActivitySummaryAnnotationViewDataSource _exerciseColumn](self, "_exerciseColumn");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 0uLL:
      -[HKActivitySummaryAnnotationViewDataSource _moveColumn](self, "_moveColumn");
      v3 = (const char *)objc_claimAutoreleasedReturnValue();
LABEL_7:
      a2 = v3;
      break;
  }
  return (id)(id)a2;
}

- (BOOL)showSeparators
{
  void *v3;
  char v4;

  if (-[HKActivitySummaryAnnotationViewDataSource useStandardAnnotationDataSource](self, "useStandardAnnotationDataSource"))
  {
    -[HKActivitySummaryAnnotationViewDataSource standardAnnotationDataSource](self, "standardAnnotationDataSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "showSeparators");
  }
  else
  {
    -[HKActivitySummaryAnnotationViewDataSource columnsForPosition](self, "columnsForPosition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (unint64_t)objc_msgSend(v3, "count") > 1;
  }

  return v4;
}

- (BOOL)_hasRingView
{
  _BOOL4 v3;
  int64_t v4;

  v3 = -[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext");
  v4 = -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope");
  if (!v3)
    return v4 == 5 || -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope") == 4;
  if (v4 == 6)
    return objc_msgSend(MEMORY[0x1E0DC3BF8], "hk_currentDeviceHas4InchScreen") ^ 1;
  else
    return 0;
}

- (id)activityStandTitle
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB6780];
  -[HKActivitySummaryAnnotationViewDataSource wheelchairUseCharacteristicCache](self, "wheelchairUseCharacteristicCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizationStringSuffixForWheelchairUser:", objc_msgSend(v3, "isWheelchairUser"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("STAND_CHART_TITLE"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v6, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_standColumnValueString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleStandHours");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "standHoursGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedDisplayStringForAppleStandHours(v4, v6, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("HOURS_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource _valueUnitAttributedStringWithValueString:unitString:](self, "_valueUnitAttributedStringWithValueString:unitString:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_standColumnAsNumber
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleStandHours");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
}

- (id)_standColumn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKActivitySummaryAnnotationViewDataSource _standColumnValueString](self, "_standColumnValueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activityStandTitle](self, "activityStandTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityStandGoalLineColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _bodyColor](self, "_bodyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _columnViewWithTitle:titleColor:body:bodyColor:alignment:](self, "_columnViewWithTitle:titleColor:body:bodyColor:alignment:", v4, v5, v3, v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityExerciseTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("EXERCISE_CHART_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_exerciseColumnValueString
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleExerciseTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "exerciseTimeGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedDisplayStringForAppleExerciseTime(v4, v6, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("MINUTES_MEDIUM"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource _valueUnitAttributedStringWithValueString:unitString:](self, "_valueUnitAttributedStringWithValueString:unitString:", v7, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_exerciseColumnAsNumber
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleExerciseTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
}

- (id)_exerciseColumn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKActivitySummaryAnnotationViewDataSource _exerciseColumnValueString](self, "_exerciseColumnValueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activityExerciseTitle](self, "activityExerciseTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityExerciseGoalLineColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _bodyColor](self, "_bodyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _columnViewWithTitle:titleColor:body:bodyColor:alignment:](self, "_columnViewWithTitle:titleColor:body:bodyColor:alignment:", v4, v5, v3, v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)activityMoveTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MOVE_CHART_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_energyColumnValueString
{
  void *v3;
  void *v4;
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

  -[HKActivitySummaryAnnotationViewDataSource displayTypeController](self, "displayTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeWithIdentifier:", &unk_1E9CEC608);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource unitController](self, "unitController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unitForDisplayType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeEnergyBurned");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedStringWithEnergy();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource unitController](self, "unitController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "activeEnergyBurned");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValueForUnit:", v6);
  objc_msgSend(v11, "numberWithDouble:");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedDisplayNameForDisplayType:value:", v4, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource _valueUnitAttributedStringWithValueString:unitString:](self, "_valueUnitAttributedStringWithValueString:unitString:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_energyColumnAsNumber
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;

  -[HKActivitySummaryAnnotationViewDataSource displayTypeController](self, "displayTypeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayTypeWithIdentifier:", &unk_1E9CEC608);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource unitController](self, "unitController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unitForDisplayType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeEnergyBurned");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValueForUnit:", v6);
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_energyColumn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HKActivitySummaryAnnotationViewDataSource _energyColumnValueString](self, "_energyColumnValueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activityMoveTitle](self, "activityMoveTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_activityMoveGoalLineColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _bodyColor](self, "_bodyColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _columnViewWithTitle:titleColor:body:bodyColor:alignment:](self, "_columnViewWithTitle:titleColor:body:bodyColor:alignment:", v4, v5, v3, v6, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_moveTimeColumnValueString
{
  void *v3;
  void *v4;
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

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appleMoveTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appleMoveTimeGoal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKLocalizedDisplayStringForAppleMoveTime(v4, v6, 1, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource displayTypeController](self, "displayTypeController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayTypeWithIdentifier:", &unk_1E9CEC620);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource unitController](self, "unitController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unitForDisplayType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource unitController](self, "unitController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB37E8];
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appleMoveTime");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValueForUnit:", v11);
  objc_msgSend(v13, "numberWithDouble:");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedDisplayNameForUnit:value:", v11, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource _valueUnitAttributedStringWithValueString:unitString:](self, "_valueUnitAttributedStringWithValueString:unitString:", v7, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)_moveTimeColumnAsNumber
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appleMoveTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "minuteUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "doubleValueForUnit:", v4);
  v6 = v5;

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
}

- (id)_moveTimeColumn
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HKActivitySummaryAnnotationViewDataSource _moveTimeColumnValueString](self, "_moveTimeColumnValueString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activityMoveTitle](self, "activityMoveTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF51B0], "energyColors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nonGradientTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _bodyColor](self, "_bodyColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _columnViewWithTitle:titleColor:body:bodyColor:alignment:](self, "_columnViewWithTitle:titleColor:body:bodyColor:alignment:", v4, v6, v3, v7, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_moveColumn
{
  void *v3;
  void *v4;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    -[HKActivitySummaryAnnotationViewDataSource _moveTimeColumn](self, "_moveTimeColumn");
  else
    -[HKActivitySummaryAnnotationViewDataSource _energyColumn](self, "_energyColumn");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_moveColumnValueString
{
  void *v3;
  void *v4;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    -[HKActivitySummaryAnnotationViewDataSource _moveTimeColumnValueString](self, "_moveTimeColumnValueString");
  else
    -[HKActivitySummaryAnnotationViewDataSource _energyColumnValueString](self, "_energyColumnValueString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_moveColumnAsNumber
{
  void *v3;
  void *v4;

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "activityMoveMode") == 2)
    -[HKActivitySummaryAnnotationViewDataSource _moveTimeColumnAsNumber](self, "_moveTimeColumnAsNumber");
  else
    -[HKActivitySummaryAnnotationViewDataSource _energyColumnAsNumber](self, "_energyColumnAsNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_percentStringWithQuantity:(id)a3 goalQuantity:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "_unit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v7);
  v9 = v8;

  objc_msgSend(v5, "doubleValueForUnit:", v7);
  v11 = v10;

  v12 = v9 / v11;
  if (((*(_QWORD *)&v12 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 <= 0x3FE)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_percentNumberFormatter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringFromNumber:", v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("NO_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_valueUnitAttributedStringWithValueString:(id)a3 unitString:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  _QWORD *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[2];
  _QWORD v32[2];
  _QWORD v33[3];

  v33[2] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0DC1350];
  v25 = a4;
  v7 = a3;
  objc_msgSend(v6, "hk_chartActivityValueFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueUnitFont");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext");
  v11 = *MEMORY[0x1E0DC1138];
  if (v10)
  {
    v33[0] = v8;
    v12 = *MEMORY[0x1E0DC1140];
    v32[0] = v11;
    v32[1] = v12;
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v33;
    v16 = v32;
  }
  else
  {
    v31[0] = v8;
    v12 = *MEMORY[0x1E0DC1140];
    v30[0] = v11;
    v30[1] = v12;
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v13;
    v14 = (void *)MEMORY[0x1E0C99D80];
    v15 = v31;
    v16 = v30;
  }
  objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 2, v25);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v7, v17);
  objc_msgSend(v9, "addObject:", v18);
  if (-[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext"))
    objc_msgSend(MEMORY[0x1E0DC3658], "systemDarkMidGrayColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v11;
  v28[1] = v12;
  v29[0] = v27;
  v29[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", CFSTR(" "), v20);
  objc_msgSend(v9, "addObject:", v21);
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v26, v20);

  objc_msgSend(v9, "addObject:", v22);
  HKUIJoinAttributedStringsForLocale(v9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)_ringColumn
{
  void *v3;
  void *v4;
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

  -[HKActivitySummaryAnnotationViewDataSource ringContainer](self, "ringContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB7850]), "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    -[HKActivitySummaryAnnotationViewDataSource setRingView:](self, "setRingView:", v4);

    -[HKActivitySummaryAnnotationViewDataSource ringView](self, "ringView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAutoresizingMask:", 40);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, 48.0, 48.0);
    -[HKActivitySummaryAnnotationViewDataSource setRingContainer:](self, "setRingContainer:", v6);

    -[HKActivitySummaryAnnotationViewDataSource ringContainer](self, "ringContainer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummaryAnnotationViewDataSource ringView](self, "ringView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v8);

    -[HKActivitySummaryAnnotationViewDataSource ringContainer](self, "ringContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAutoresizingMask:", 16);

  }
  -[HKActivitySummaryAnnotationViewDataSource ringView](self, "ringView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setActivitySummary:animated:", v11, -[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext"));

  -[HKActivitySummaryAnnotationViewDataSource activitySummary](self, "activitySummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isPaused") & 1) != 0)
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKActivitySummaryAnnotationViewDataSource ringView](self, "ringView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_setActivityRingViewBackgroundColor:", v13);

  -[HKActivitySummaryAnnotationViewDataSource ringContainer](self, "ringContainer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_dateColumnWithDateComponents:(id)a3 calendar:(id)a4 orientation:(int64_t)a5
{
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = (objc_class *)MEMORY[0x1E0DC3990];
  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init(v7);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueDateFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemMidGrayColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTextColor:", v12);

  -[HKActivitySummaryAnnotationViewDataSource _dateTextForDateComponents:calendar:timeScope:](self, "_dateTextForDateComponents:calendar:timeScope:", v9, v8, -[HKActivitySummaryAnnotationViewDataSource timeScope](self, "timeScope"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setText:", v13);
  objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v10, "setBaselineAdjustment:", 1);
  objc_msgSend(v10, "sizeToFit");
  return v10;
}

- (id)_dateTextForDateComponents:(id)a3 calendar:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;

  v8 = a3;
  v9 = a4;
  if ((unint64_t)a5 <= 8)
  {
    if (a5 == 3)
      -[HKActivitySummaryAnnotationViewDataSource _weekContainingDateComponents:calendar:timeScope:](self, "_weekContainingDateComponents:calendar:timeScope:", v8, v9, 3);
    else
      HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v8, v9, a5, 0);
    a5 = objc_claimAutoreleasedReturnValue();
  }

  return (id)a5;
}

- (id)_weekContainingDateComponents:(id)a3 calendar:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  HKActivitySummaryAnnotationViewDataSource *v14;
  HKActivitySummaryAnnotationViewDataSource *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a3;
  -[HKActivitySummaryAnnotationViewDataSource dateCache](self, "dateCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "dateFromComponents:", v9);
    v11 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3588], "hk_dateIntervalForDayFromDate:calendar:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x1E0C99790]);
    v14 = (HKActivitySummaryAnnotationViewDataSource *)objc_claimAutoreleasedReturnValue();

    if (-[HKActivitySummaryAnnotationViewDataSource firstWeekday](self, "firstWeekday") == -1)
      v15 = v14;
    else
      v15 = self;
    objc_msgSend(v8, "hk_weeksContainingInterval:firstWeekday:", v12, -[HKActivitySummaryAnnotationViewDataSource firstWeekday](v15, "firstWeekday"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKActivitySummaryAnnotationViewDataSource dateCache](self, "dateCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    HKLastUpdatedIntervalText(v16, a5, v17, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (id)v11;
  }
  else
  {
    HKCombinedStringForAnnotationDateWithTimeScope((uint64_t)v9, v8, a5, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (id)_columnViewWithTitle:(id)a3 titleColor:(id)a4 body:(id)a5 bodyColor:(id)a6 alignment:(int64_t)a7
{
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v11 = (objc_class *)MEMORY[0x1E0DC3990];
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = objc_alloc_init(v11);
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v16, "setTextColor:", v14);

  objc_msgSend(v16, "setText:", v15);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueKindFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

  objc_msgSend(v16, "setTextAlignment:", a7);
  objc_msgSend(v16, "setAdjustsFontSizeToFitWidth:", 1);
  v18 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.Title"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "hk_chartLollipopAccessibilityIdentifier:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAccessibilityIdentifier:", v20);

  v21 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v21, "setTextColor:", v12);

  objc_msgSend(v21, "setTextAlignment:", a7);
  objc_msgSend(v21, "setAttributedText:", v13);

  objc_msgSend(v21, "setAdjustsFontSizeToFitWidth:", 1);
  v22 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.Body"), v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "hk_chartLollipopAccessibilityIdentifier:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityIdentifier:", v24);

  v25 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v29[0] = v16;
  v29[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = (void *)objc_msgSend(v25, "initWithArrangedSubviews:", v26);

  objc_msgSend(v27, "setAxis:", 1);
  return v27;
}

- (id)_bodyColor
{
  if (-[HKActivitySummaryAnnotationViewDataSource currentValueViewContext](self, "currentValueViewContext"))
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)descriptionsForActivitySummary
{
  id v3;
  void *v4;
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

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKActivitySummaryAnnotationViewDataSource activityMoveTitle](self, "activityMoveTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _moveColumnValueString](self, "_moveColumnValueString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _moveColumnAsNumber](self, "_moveColumnAsNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _valueWithTitle:attributedValue:valueAsNumber:](self, "_valueWithTitle:attributedValue:valueAsNumber:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  -[HKActivitySummaryAnnotationViewDataSource activityExerciseTitle](self, "activityExerciseTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _exerciseColumnValueString](self, "_exerciseColumnValueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _exerciseColumnAsNumber](self, "_exerciseColumnAsNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _valueWithTitle:attributedValue:valueAsNumber:](self, "_valueWithTitle:attributedValue:valueAsNumber:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v11);

  -[HKActivitySummaryAnnotationViewDataSource activityStandTitle](self, "activityStandTitle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _standColumnValueString](self, "_standColumnValueString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _standColumnAsNumber](self, "_standColumnAsNumber");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKActivitySummaryAnnotationViewDataSource _valueWithTitle:attributedValue:valueAsNumber:](self, "_valueWithTitle:attributedValue:valueAsNumber:", v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v15);

  return v3;
}

- (id)_valueWithTitle:(id)a3 attributedValue:(id)a4 valueAsNumber:(id)a5
{
  id v7;
  id v8;
  id v9;
  HKAccessibilityValue *v10;
  void *v11;
  HKAccessibilityValue *v12;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = [HKAccessibilityValue alloc];
  objc_msgSend(v8, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKAccessibilityValue initWithValueTitle:valueType:valueDescription:valueAsNumber:](v10, "initWithValueTitle:valueType:valueDescription:valueAsNumber:", v9, &stru_1E9C4C428, v11, v7);
  return v12;
}

- (HKActivitySummary)activitySummary
{
  return self->_activitySummary;
}

- (void)setActivitySummary:(id)a3
{
  objc_storeStrong((id *)&self->_activitySummary, a3);
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

- (BOOL)useStandardAnnotationDataSource
{
  return self->_useStandardAnnotationDataSource;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (void)setDisplayTypeController:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeController, a3);
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (_HKWheelchairUseCharacteristicCache)wheelchairUseCharacteristicCache
{
  return self->_wheelchairUseCharacteristicCache;
}

- (void)setWheelchairUseCharacteristicCache:(id)a3
{
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, a3);
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (void)setDateCache:(id)a3
{
  objc_storeStrong((id *)&self->_dateCache, a3);
}

- (BOOL)currentValueViewContext
{
  return self->_currentValueViewContext;
}

- (void)setCurrentValueViewContext:(BOOL)a3
{
  self->_currentValueViewContext = a3;
}

- (UIView)ringContainer
{
  return self->_ringContainer;
}

- (void)setRingContainer:(id)a3
{
  objc_storeStrong((id *)&self->_ringContainer, a3);
}

- (HKActivityRingView)ringView
{
  return self->_ringView;
}

- (void)setRingView:(id)a3
{
  objc_storeStrong((id *)&self->_ringView, a3);
}

- (int64_t)firstWeekday
{
  return self->_firstWeekday;
}

- (NSArray)columnsForPosition
{
  return self->_columnsForPosition;
}

- (HKInteractiveChartAnnotationViewDataSource)standardAnnotationDataSource
{
  return self->_standardAnnotationDataSource;
}

- (BOOL)isChartSharingContext
{
  return self->_isChartSharingContext;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardAnnotationDataSource, 0);
  objc_storeStrong((id *)&self->_columnsForPosition, 0);
  objc_storeStrong((id *)&self->_ringView, 0);
  objc_storeStrong((id *)&self->_ringContainer, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_wheelchairUseCharacteristicCache, 0);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
  objc_storeStrong((id *)&self->_activitySummary, 0);
}

@end
