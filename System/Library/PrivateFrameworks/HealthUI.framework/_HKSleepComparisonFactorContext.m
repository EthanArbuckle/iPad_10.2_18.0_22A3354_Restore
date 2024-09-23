@implementation _HKSleepComparisonFactorContext

- (_HKSleepComparisonFactorContext)initWithStackedFactorDisplayType:(id)a3 currentCalendarOverride:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 contextChangeDelegate:(id)a7 primarySleepDisplayType:(id)a8 sleepChartFormatter:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  _HKSleepComparisonFactorContext *v24;
  objc_super v26;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  objc_msgSend(a3, "objectType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v23 = v22;
  else
    v23 = 0;
  v26.receiver = self;
  v26.super_class = (Class)_HKSleepComparisonFactorContext;
  v24 = -[_HKSleepComparisonContext initWithStackedSampleType:currentCalendarOverride:overlayChartController:applicationItems:contextChangeDelegate:primarySleepDisplayType:](&v26, sel_initWithStackedSampleType_currentCalendarOverride_overlayChartController_applicationItems_contextChangeDelegate_primarySleepDisplayType_, v23, v21, v20, v19, v18, v17);

  if (v24)
    objc_storeStrong((id *)&v24->_sleepChartFormatter, a9);

  return v24;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _HKSleepComparisonFactorContext *v22;
  id v23;
  id v24[3];
  id location;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_initWeak(&location, self);
  v26[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __118___HKSleepComparisonFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v19[3] = &unk_1E9C457D0;
  objc_copyWeak(v24, &location);
  v16 = v13;
  v20 = v16;
  v17 = v12;
  v24[1] = (id)a5;
  v24[2] = (id)a6;
  v21 = v17;
  v22 = self;
  v18 = v14;
  v23 = v18;
  -[HKOverlayRoomStackedContext chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:](self, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", 1, v15, v16, 1, a5, a6, v19);

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);

}

- (void)_setContextItem:(id)a3 timeScope:(int64_t)a4 completion:(id)a5
{
  id v8;
  id v9;
  HKOverlayPillValue *v10;
  void *v11;
  HKOverlayPillValue *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = a3;
  v10 = [HKOverlayPillValue alloc];
  objc_msgSend(v9, "string");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HKOverlayPillValue initWithValueString:unitString:](v10, "initWithValueString:unitString:", v11, &stru_1E9C4C428);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __72___HKSleepComparisonFactorContext__setContextItem_timeScope_completion___block_invoke;
  v14[3] = &unk_1E9C41C00;
  v15 = v8;
  v13 = v8;
  -[HKOverlayRoomStackedContext setLastUpdatedItemFromPillValue:timeScope:completion:](self, "setLastUpdatedItemFromPillValue:timeScope:completion:", v12, a4, v14);

}

- (id)stackedHeight
{
  return +[HKOverlayRoomFactorContext factorStackHeight](HKOverlayRoomFactorContext, "factorStackHeight");
}

- (BOOL)healthFactorContext
{
  return 1;
}

- (HKInteractiveChartDataFormatter)sleepChartFormatter
{
  return self->_sleepChartFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sleepChartFormatter, 0);
}

@end
