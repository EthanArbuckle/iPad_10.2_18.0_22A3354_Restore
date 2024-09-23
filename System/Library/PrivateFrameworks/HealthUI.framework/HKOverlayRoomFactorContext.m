@implementation HKOverlayRoomFactorContext

+ (id)factorStackHeight
{
  return -[HKInteractiveChartStackHeight initWithKind:heightValue:]([HKInteractiveChartStackHeight alloc], "initWithKind:heightValue:", 1, 50.0);
}

- (HKOverlayRoomFactorContext)initWithPrimaryDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  BOOL v21;
  void *v22;
  char isKindOfClass;
  void *v24;
  void *v25;
  HKOverlayRoomFactorContext *v26;
  NSArray *preservedLegendEntries;
  void *v29;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a7;
  v18 = a6;
  v19 = a5;
  objc_msgSend(v17, "healthStore");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = +[HKInteractiveChartInfographicFactory infographicSupportedForDisplayType:factorDisplayType:healthStore:](HKInteractiveChartInfographicFactory, "infographicSupportedForDisplayType:factorDisplayType:healthStore:", v15, v16, v20);

  objc_msgSend(v16, "objectType");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomFactorContext.m"), 48, CFSTR("HKOverlayRoomFactorContext: only category types are supported."));

  }
  objc_msgSend(v15, "sampleType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sampleType");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)HKOverlayRoomFactorContext;
  v26 = -[HKOverlayRoomStackedContext initWithSampleType:overlayDisplayType:stackedSampleType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:](&v31, sel_initWithSampleType_overlayDisplayType_stackedSampleType_overlayChartController_currentCalendarOverride_applicationItems_isInfoButtonHidden_, v24, 0, v25, v19, v18, v17, !v21);

  if (v26)
  {
    v26->_overlayMode = a8;
    v26->_directPrimaryDisplayType = 0;
    preservedLegendEntries = v26->_preservedLegendEntries;
    v26->_preservedLegendEntries = 0;

    v26->_allowsDeselection = a9;
  }

  return v26;
}

- (HKOverlayRoomFactorContext)initWithPrimaryInteractiveChartDisplayType:(id)a3 factorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8 allowsDeselection:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  BOOL v22;
  void *v23;
  void *v24;
  HKOverlayRoomFactorContext *v25;
  NSArray *preservedLegendEntries;
  void *v28;
  objc_super v30;

  v15 = a4;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a3;
  objc_msgSend(v19, "baseDisplayType");
  v20 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "healthStore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = +[HKInteractiveChartInfographicFactory infographicSupportedForDisplayType:factorDisplayType:healthStore:](HKInteractiveChartInfographicFactory, "infographicSupportedForDisplayType:factorDisplayType:healthStore:", v20, v15, v21);

  objc_msgSend(v15, "objectType");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  LOBYTE(v20) = objc_opt_isKindOfClass();

  if ((v20 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomFactorContext.m"), 77, CFSTR("HKOverlayRoomFactorContext: only category types are supported."));

  }
  objc_msgSend(v15, "sampleType");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30.receiver = self;
  v30.super_class = (Class)HKOverlayRoomFactorContext;
  v25 = -[HKOverlayRoomStackedContext initWithDisplayType:overlayDisplayType:stackedSampleType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:](&v30, sel_initWithDisplayType_overlayDisplayType_stackedSampleType_overlayChartController_currentCalendarOverride_applicationItems_isInfoButtonHidden_, v19, 0, v24, v18, v17, v16, !v22);

  if (v25)
  {
    v25->_overlayMode = a8;
    v25->_directPrimaryDisplayType = 1;
    preservedLegendEntries = v25->_preservedLegendEntries;
    v25->_preservedLegendEntries = 0;

    v25->_allowsDeselection = a9;
  }

  return v25;
}

- (HKOverlayRoomFactorContext)initWithPrimaryInteractiveChartDisplayType:(id)a3 interactiveChartFactorDisplayType:(id)a4 overlayChartController:(id)a5 currentCalendarOverride:(id)a6 applicationItems:(id)a7 overlayMode:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  char isKindOfClass;
  HKOverlayRoomFactorContext *v22;
  HKOverlayRoomFactorContext *v23;
  NSArray *preservedLegendEntries;
  void *v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  objc_msgSend(v16, "objectType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomFactorContext.m"), 100, CFSTR("HKOverlayRoomFactorContext: only category types are supported."));

  }
  v27.receiver = self;
  v27.super_class = (Class)HKOverlayRoomFactorContext;
  v22 = -[HKOverlayRoomStackedContext initWithDisplayType:overlayDisplayType:stackedDisplayType:overlayChartController:currentCalendarOverride:applicationItems:isInfoButtonHidden:](&v27, sel_initWithDisplayType_overlayDisplayType_stackedDisplayType_overlayChartController_currentCalendarOverride_applicationItems_isInfoButtonHidden_, v15, 0, v16, v17, v18, v19, 1);
  v23 = v22;
  if (v22)
  {
    v22->_overlayMode = a8;
    v22->_directPrimaryDisplayType = 1;
    preservedLegendEntries = v22->_preservedLegendEntries;
    v22->_preservedLegendEntries = 0;

    v23->_allowsDeselection = 1;
  }

  return v23;
}

- (id)stackedContextButtonBackground
{
  void *v2;

  v2 = -[HKOverlayRoomFactorContext overlayMode](self, "overlayMode");
  if ((unint64_t)v2 >= 3)
  {
    if (v2 == (void *)3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
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
  id v22;
  id v23[3];
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a7;
  objc_initWeak(&location, self);
  v25[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
  v19[3] = &unk_1E9C43750;
  objc_copyWeak(v23, &location);
  v16 = v13;
  v20 = v16;
  v17 = v12;
  v21 = v17;
  v23[1] = (id)a5;
  v18 = v14;
  v22 = v18;
  v23[2] = (id)a6;
  -[HKOverlayRoomStackedContext chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:](self, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", 1, v15, v16, 1, a5, a6, v19);

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);

}

void __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(uint64_t a1, void *a2, void *a3, int a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id WeakRetained;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  _QWORD v31[4];
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  _QWORD v36[4];
  id v37;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v13 = WeakRetained;
  if (a4)
  {
    v30 = v10;
    objc_msgSend(WeakRetained, "displayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "selectedRangeFormatter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayPillValueProvidingFactory overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:](HKOverlayPillValueProvidingFactory, "overlayPillValueProviderForDisplayType:selectedRangeFormatter:interfaceLayout:", v14, v15, +[HKOverlayPillValueProvidingFactory interfaceLayoutForController:](HKOverlayPillValueProvidingFactory, "interfaceLayoutForController:", *(_QWORD *)(a1 + 32)));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = *(_QWORD *)(a1 + 64);
    v18 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "currentCalendar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKOverlayRoomFactorContext factorDateIntervalsWithChartPoints:dateInterval:timeScope:calendar:intersection:](HKOverlayRoomFactorContext, "factorDateIntervalsWithChartPoints:dateInterval:timeScope:calendar:intersection:", v9, v18, v17, v19, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "count"))
    {
      v21 = *(_QWORD *)(a1 + 32);
      v22 = *(_QWORD *)(a1 + 64);
      v23 = *(_QWORD *)(a1 + 72);
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3;
      v31[3] = &unk_1E9C43728;
      v32 = v16;
      v33 = v13;
      v35 = *(_QWORD *)(a1 + 64);
      v34 = *(id *)(a1 + 48);
      objc_msgSend(v13, "chartPointsForChartPointType:dateIntervals:overlayChartController:dateIntervalMustMatchView:timeScope:resolution:completion:", 0, v20, v21, 0, v22, v23, v31);

      v24 = v32;
    }
    else
    {
      objc_msgSend(v13, "displayType");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 64);
      objc_msgSend(v13, "applicationItems");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "unitController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "valueFromChartPoints:unit:displayType:timeScope:unitPreferenceController:", MEMORY[0x1E0C9AA60], v30, v25, v26, v28);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v29 = *(_QWORD *)(a1 + 64);
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
      v36[3] = &unk_1E9C41C00;
      v37 = *(id *)(a1 + 48);
      objc_msgSend(v13, "setLastUpdatedItemFromPillValue:timeScope:completion:", v24, v29, v36);

    }
    v10 = v30;
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  if (a4)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "displayType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(a1 + 40), "applicationItems");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unitController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "valueFromChartPoints:unit:displayType:timeScope:unitPreferenceController:", v7, v8, v10, v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4;
    v17[3] = &unk_1E9C41C00;
    v15 = *(void **)(a1 + 40);
    v16 = *(_QWORD *)(a1 + 56);
    v18 = *(id *)(a1 + 48);
    objc_msgSend(v15, "setLastUpdatedItemFromPillValue:timeScope:completion:", v14, v16, v17);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __113__HKOverlayRoomFactorContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return -[HKOverlayRoomFactorContext allowsDeselection](self, "allowsDeselection", a3, a4, a5, a6) || !a4;
}

- (void)overlayStateWillChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL8 v5;
  id v7;

  v5 = a3;
  v7 = a5;
  if (-[HKOverlayRoomFactorContext directPrimaryDisplayType](self, "directPrimaryDisplayType"))
    -[HKOverlayRoomFactorContext _toggleSeriesLegend:chartController:](self, "_toggleSeriesLegend:chartController:", v5, v7);

}

- (void)_toggleSeriesLegend:(BOOL)a3 chartController:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  -[HKOverlayRoomFactorContext _findFirstGraphSeries:](self, "_findFirstGraphSeries:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v12 = v6;
    if (v4)
    {
      objc_msgSend(v6, "titleLegendEntries");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomFactorContext setPreservedLegendEntries:](self, "setPreservedLegendEntries:", v7);

      -[HKOverlayRoomStackedContext displayType](self, "displayType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "baseDisplayType");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "localization");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "shortenedDisplayName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKOverlayContextUtilities setStackedSeriesLegend:title:](HKOverlayContextUtilities, "setStackedSeriesLegend:title:", v12, v11);

    }
    else
    {
      -[HKOverlayRoomFactorContext preservedLegendEntries](self, "preservedLegendEntries");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTitleLegendEntries:", v9);
    }

    v6 = v12;
  }

}

- (id)_findFirstGraphSeries:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "primaryGraphViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "allSeries");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)factorDateIntervalsWithChartPoints:(id)a3 dateInterval:(id)a4 timeScope:(int64_t)a5 calendar:(id)a6 intersection:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  id v35;
  int64_t v36;
  BOOL v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __110__HKOverlayRoomFactorContext_factorDateIntervalsWithChartPoints_dateInterval_timeScope_calendar_intersection___block_invoke;
  v31[3] = &unk_1E9C43778;
  v16 = v15;
  v32 = v16;
  v37 = a7;
  v17 = v13;
  v33 = v17;
  v35 = a1;
  v36 = a5;
  v18 = v14;
  v34 = v18;
  objc_msgSend(v12, "hk_map:", v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v19, "count") >= 2)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0CB65B0]);
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v21 = v19;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v28;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v28 != v24)
            objc_enumerationMutation(v21);
          objc_msgSend(v20, "insertInterval:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v25++), (_QWORD)v27);
        }
        while (v23 != v25);
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
      }
      while (v23);
    }

    objc_msgSend(v20, "mergedIntervals");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v19;
}

id __110__HKOverlayRoomFactorContext_factorDateIntervalsWithChartPoints_dateInterval_timeScope_calendar_intersection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  objc_msgSend(v3, "minXValueAsGenericType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "maxXValueAsGenericType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "hk_isAfterDate:", *(_QWORD *)(a1 + 32)))
  {
    v6 = *(id *)(a1 + 32);

    v5 = v6;
  }
  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 40), "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "hk_isAfterDate:", v4);

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "startDate");
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }
    objc_msgSend(*(id *)(a1 + 40), "endDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hk_isBeforeDate:", v5);

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 40), "endDate");
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
  }
  objc_msgSend(v4, "dateByAddingTimeInterval:", 0.01);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -0.01);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_alignDate:timeScope:alignment:calendar:", v13, *(_QWORD *)(a1 + 64), 0, *(_QWORD *)(a1 + 48));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_alignDate:timeScope:alignment:calendar:", v14, *(_QWORD *)(a1 + 64), 2, *(_QWORD *)(a1 + 48));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  if (objc_msgSend(v15, "hk_isBeforeDate:", v16))
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v15, v16);

  return v17;
}

+ (id)_alignDate:(id)a3 timeScope:(int64_t)a4 alignment:(int64_t)a5 calendar:(id)a6
{
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v9 = a3;
  v10 = a6;
  +[HKGraphZoomLevelConfiguration chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:](HKGraphZoomLevelConfiguration, "chartVisibleRangeForTimeScope:anchorDate:alignment:dataRange:calendar:firstWeekday:cadence:level:", a4, v9, a5, 0, v10, objc_msgSend(v10, "firstWeekday"), 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v9;
  v13 = v12;
  if (a5 == 2)
  {
    objc_msgSend(v11, "endDate");
    v15 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v14 = v12;
  if (!a5)
  {
    objc_msgSend(v11, "startDate");
    v15 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v14 = (void *)v15;

  }
  return v14;
}

+ (id)_leadingPredicateForRange:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "endDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("startDate <= %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_leadingSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E48], 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_trailingPredicateForRange:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("endDate >= %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_trailingSortDescriptors
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB5E60], 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (double)_distanceBetween:(id)a3 otherDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!a4)
    return 1.79769313e308;
  v5 = a4;
  objc_msgSend(a3, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend(v5, "timeIntervalSinceReferenceDate");
  v9 = v8;

  return vabdd_f64(v7, v9);
}

+ (id)_dateIntervalToValueRange:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_currentGraphView:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "primaryGraphViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_currentVisibleDateRange:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "_currentGraphView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "actualVisibleRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3588]);
      objc_msgSend(v5, "startDate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v6, "initWithStartDate:endDate:", v7, v8);

    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)stackedHeight
{
  return -[HKInteractiveChartStackHeight initWithKind:heightValue:]([HKInteractiveChartStackHeight alloc], "initWithKind:heightValue:", 1, 50.0);
}

- (BOOL)healthFactorContext
{
  return 1;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (BOOL)directPrimaryDisplayType
{
  return self->_directPrimaryDisplayType;
}

- (NSArray)preservedLegendEntries
{
  return self->_preservedLegendEntries;
}

- (void)setPreservedLegendEntries:(id)a3
{
  objc_storeStrong((id *)&self->_preservedLegendEntries, a3);
}

- (BOOL)allowsDeselection
{
  return self->_allowsDeselection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preservedLegendEntries, 0);
}

@end
