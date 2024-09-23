@implementation _ActivitySourceDelegate

- (_ActivitySourceDelegate)initWithActivityValue:(int64_t)a3 displayTypeController:(id)a4 unitPreferenceController:(id)a5
{
  id v9;
  id v10;
  _ActivitySourceDelegate *v11;
  _ActivitySourceDelegate *v12;
  uint64_t v13;
  NSCalendar *currentCalendar;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_ActivitySourceDelegate;
  v11 = -[_ActivitySourceDelegate init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_activityValue = a3;
    objc_storeStrong((id *)&v11->_displayTypeController, a4);
    objc_storeStrong((id *)&v12->_unitPreferenceController, a5);
    objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
    v13 = objc_claimAutoreleasedReturnValue();
    currentCalendar = v12->_currentCalendar;
    v12->_currentCalendar = (NSCalendar *)v13;

  }
  return v12;
}

- (double)_intervalSpanForTimeScope:(int64_t)a3 startDate:(id)a4 calendar:(id)a5
{
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v7 = a4;
  v8 = a5;
  v9 = 0.0;
  if ((unint64_t)a3 <= 6)
  {
    +[HKGraphZoomLevelConfiguration configurationForZoomLevel:](HKGraphZoomLevelConfiguration, "configurationForZoomLevel:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = v10;
      objc_msgSend(MEMORY[0x1E0C99D78], "hk_dateComponentsForCalendarUnit:", objc_msgSend(v10, "majorTickCalendarUnit"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dateByAddingComponents:toDate:options:", v12, v7, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "timeIntervalSinceDate:", v7);
      v9 = v14;

    }
  }

  return v9;
}

- (id)dataForDateRange:(id)a3 timeScope:(int64_t)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[_ActivitySourceDelegate activitySummariesForDateRange:timeScope:](self, "activitySummariesForDateRange:timeScope:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        -[_ActivitySourceDelegate _chartPointForActivityValue:summary:timeScope:](self, "_chartPointForActivityValue:summary:timeScope:", -[_ActivitySourceDelegate activityValue](self, "activityValue", (_QWORD)v15), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12), a4);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)activitySummariesForDateRange:(id)a3 timeScope:(int64_t)a4
{
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartActivityController.m"), 1474, CFSTR("Subclass must provide an implementation for activitySummariesForDateRange:timeScope:"));

  return (id)MEMORY[0x1E0C9AA60];
}

- (void)setUpdateDelegate:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartActivityController.m"), 1479, CFSTR("Subclass must provide an implementationfor setUpdateDelegate:"));

}

- (id)_chartPointForActivityValue:(int64_t)a3 summary:(id)a4 timeScope:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  BOOL v27;
  BOOL v28;
  double v29;
  uint64_t v30;
  _ActivitySourceDelegate *v31;
  uint64_t v33;
  int64_t v34;
  uint64_t v35;
  void *v36;

  v8 = a4;
  -[_ActivitySourceDelegate currentCalendar](self, "currentCalendar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateComponentsForCalendar:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = a3 & 0xFFFFFFFFFFFFFFFCLL;
  -[_ActivitySourceDelegate _quantityForActivityValue:summary:](self, "_quantityForActivityValue:summary:", a3, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "hour");
  if ((a3 & 0xFFFFFFFFFFFFFFFCLL) != 4 || v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v34 = a5;
    -[_ActivitySourceDelegate displayTypeController](self, "displayTypeController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _DisplayTypeForActivityValue(a3, v15);
    v16 = objc_claimAutoreleasedReturnValue();

    if ((unint64_t)a3 <= 6 && ((0x77u >> a3) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB6978], "quantityTypeForIdentifier:", **((_QWORD **)&unk_1E9C45278 + a3));
      v35 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v35 = 0;
    }
    -[_ActivitySourceDelegate unitPreferenceController](self, "unitPreferenceController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (void *)v16;
    objc_msgSend(v17, "unitForDisplayType:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[_ActivitySourceDelegate currentCalendar](self, "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dateFromComponents:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3 == 3 && (objc_msgSend(v12, "doubleValueForUnit:", v18), v21 == 0.0))
    {
      v14 = 0;
      v23 = (void *)v35;
      v22 = v36;
    }
    else
    {
      -[_ActivitySourceDelegate currentCalendar](self, "currentCalendar");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[_ActivitySourceDelegate _intervalSpanForTimeScope:startDate:calendar:](self, "_intervalSpanForTimeScope:startDate:calendar:", v34, v20, v24);
      v26 = v25;

      v27 = v11 == 4;
      v28 = v11 != 4;
      v29 = v26 * 0.5;
      if (v27)
        v29 = v26;
      objc_msgSend(v20, "dateByAddingTimeInterval:", v29);
      v30 = objc_claimAutoreleasedReturnValue();

      LOBYTE(v33) = v28;
      v31 = self;
      v23 = (void *)v35;
      v22 = v36;
      -[_ActivitySourceDelegate _healthChartPointForQuantity:quantityType:activityValue:referenceDisplayType:activitySummaryData:preferredUnit:date:createBarValue:](v31, "_healthChartPointForQuantity:quantityType:activityValue:referenceDisplayType:activitySummaryData:preferredUnit:date:createBarValue:", v12, v35, a3, v36, v8, v18, v30, v33);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)v30;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_quantityForActivityValue:(int64_t)a3 summary:(id)a4
{
  id v5;
  void *v6;
  int64_t v7;

  v5 = a4;
  v6 = v5;
  switch(a3)
  {
    case 0:
      objc_msgSend(v5, "activeEnergyBurned");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 1:
      objc_msgSend(v5, "appleMoveTime");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 2:
      objc_msgSend(v5, "appleExerciseTime");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 3:
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_4;
      objc_msgSend(v6, "appleStandHours");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 4:
      objc_msgSend(v5, "activeEnergyBurnedGoal");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 5:
      objc_msgSend(v5, "appleMoveTimeGoal");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 6:
      objc_msgSend(v5, "exerciseTimeGoal");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    case 7:
LABEL_4:
      objc_msgSend(v6, "standHoursGoal");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_11:
      a3 = v7;
      break;
    default:
      break;
  }

  return (id)a3;
}

- (id)_healthChartPointForQuantity:(id)a3 quantityType:(id)a4 activityValue:(int64_t)a5 referenceDisplayType:(id)a6 activitySummaryData:(id)a7 preferredUnit:(id)a8 date:(id)a9 createBarValue:(BOOL)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HKQuantityTypeDataSourceValue *v21;
  uint64_t v22;
  void *v23;
  HKHealthChartPoint *v24;
  HKInteractiveChartActivityData *v25;

  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a4;
  v20 = a3;
  v21 = objc_alloc_init(HKQuantityTypeDataSourceValue);
  -[HKQuantityTypeDataSourceValue setQuantityType:](v21, "setQuantityType:", v19);

  -[HKQuantityTypeDataSourceValue setStartDate:](v21, "setStartDate:", v15);
  -[HKQuantityTypeDataSourceValue setEndDate:](v21, "setEndDate:", v15);

  if (a10)
  {
    objc_msgSend(v20, "_unit");
    v22 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6A28], "quantityWithUnit:doubleValue:", v22, 0.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKQuantityTypeDataSourceValue setMaxQuantity:](v21, "setMaxQuantity:", v20);

    -[HKQuantityTypeDataSourceValue setMinQuantity:](v21, "setMinQuantity:", v23);
    v20 = (id)v22;
  }
  else
  {
    -[HKQuantityTypeDataSourceValue setMinQuantity:](v21, "setMinQuantity:", v20);
    -[HKQuantityTypeDataSourceValue setMaxQuantity:](v21, "setMaxQuantity:", v20);
  }

  v24 = -[HKHealthChartPoint initWithDataSourceValue:options:unit:displayType:]([HKHealthChartPoint alloc], "initWithDataSourceValue:options:unit:displayType:", v21, 12, v16, v18);
  v25 = objc_alloc_init(HKInteractiveChartActivityData);
  -[HKInteractiveChartActivityData setActivitySummaryData:](v25, "setActivitySummaryData:", v17);

  -[HKInteractiveChartActivityData setActivityValue:](v25, "setActivityValue:", a5);
  -[HKHealthChartPoint setUserInfo:](v24, "setUserInfo:", v25);

  return v24;
}

- (int64_t)activityValue
{
  return self->_activityValue;
}

- (HKDisplayTypeController)displayTypeController
{
  return self->_displayTypeController;
}

- (HKUnitPreferenceController)unitPreferenceController
{
  return self->_unitPreferenceController;
}

- (NSCalendar)currentCalendar
{
  return self->_currentCalendar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentCalendar, 0);
  objc_storeStrong((id *)&self->_unitPreferenceController, 0);
  objc_storeStrong((id *)&self->_displayTypeController, 0);
}

@end
