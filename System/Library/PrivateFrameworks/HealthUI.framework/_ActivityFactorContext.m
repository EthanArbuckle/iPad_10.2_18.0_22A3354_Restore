@implementation _ActivityFactorContext

- (_ActivityFactorContext)initWithPrimaryDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 activityCurrentValueView:(id)a9
{
  id v16;
  _ActivityFactorContext *v17;
  _ActivityFactorContext *v18;
  char v20;
  objc_super v21;

  v16 = a9;
  v21.receiver = self;
  v21.super_class = (Class)_ActivityFactorContext;
  v20 = 1;
  v17 = -[HKOverlayRoomFactorContext initWithPrimaryDisplayType:factorDisplayType:overlayChartController:currentCalendarOverride:applicationItems:overlayMode:allowsDeselection:](&v21, sel_initWithPrimaryDisplayType_factorDisplayType_overlayChartController_currentCalendarOverride_applicationItems_overlayMode_allowsDeselection_, a3, a4, a5, a6, a7, a8, v20);
  v18 = v17;
  if (v17)
    objc_storeWeak((id *)&v17->_activityCurrentValueView, v16);

  return v18;
}

- (BOOL)_isGraphViewReadyForContextUpdate:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  BOOL v10;

  v3 = a3;
  +[HKInteractiveChartActivityController firstActivitySeriesForGraphView:](HKInteractiveChartActivityController, "firstActivitySeriesForGraphView:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v6 = v5;
  v8 = v7;

  v9 = v8 > 0.0;
  if (v6 <= 0.0)
    v9 = 0;
  if (v4)
    v10 = v9;
  else
    v10 = 0;

  return v10;
}

- (void)updateContextItemForDateInterval:(id)a3 overlayController:(id)a4 timeScope:(int64_t)a5 resolution:(int64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _ActivityFactorContext *v21;
  id v22;
  id v23;
  id v24[2];
  id location;
  _QWORD block[5];
  id v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_msgSend(v13, "primaryGraphViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "graphView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_ActivityFactorContext _isGraphViewReadyForContextUpdate:](self, "_isGraphViewReadyForContextUpdate:", v16))
  {
    objc_initWeak(&location, self);
    v32[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = 3221225472;
    v18[2] = __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
    v18[3] = &unk_1E9C45258;
    v18[0] = MEMORY[0x1E0C809B0];
    objc_copyWeak(v24, &location);
    v19 = v12;
    v24[1] = (id)a5;
    v20 = v13;
    v21 = self;
    v22 = v16;
    v23 = v14;
    -[HKOverlayRoomStackedContext chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:](self, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", 1, v17, v20, 1, a5, a6, v18);

    objc_destroyWeak(v24);
    objc_destroyWeak(&location);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __109___ActivityFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    block[3] = &unk_1E9C45230;
    block[4] = self;
    v27 = v12;
    v28 = v13;
    v30 = a5;
    v31 = a6;
    v29 = v14;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
}

- (id)_moveStringForSummary:(id)a3
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

  v4 = a3;
  if (objc_msgSend(v4, "activityMoveMode") == 2)
  {
    objc_msgSend(v4, "appleMoveTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appleMoveTimeGoal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    HKLocalizedDisplayStringForAppleMoveTime(v5, v6, 1, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_ActivityFactorContext activityCurrentValueView](self, "activityCurrentValueView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activitySummaryDataProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayTypeController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "displayTypeWithIdentifier:", &unk_1E9CECFF8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ActivityFactorContext activityCurrentValueView](self, "activityCurrentValueView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "activitySummaryDataProvider");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unitController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "unitForDisplayType:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "activeEnergyBurned");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValueForUnit:", v6);
    objc_msgSend(v14, "numberWithDouble:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "activeEnergyBurned");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    HKLocalizedStringWithEnergy();
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[_ActivityFactorContext activityCurrentValueView](self, "activityCurrentValueView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "activitySummaryDataProvider");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unitController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedDisplayNameForUnit:value:", v6, v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    HKFormatValueAndUnit(v18, v22);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (_ActivityCurrentValueView)activityCurrentValueView
{
  return (_ActivityCurrentValueView *)objc_loadWeakRetained((id *)&self->_activityCurrentValueView);
}

- (void)setActivityCurrentValueView:(id)a3
{
  objc_storeWeak((id *)&self->_activityCurrentValueView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_activityCurrentValueView);
}

@end
