@implementation HKOverlayRoomTrendContext

- (HKOverlayRoomTrendContext)initWithBaseDisplayType:(id)a3 trendModel:(id)a4 overlayChartController:(id)a5 applicationItems:(id)a6 overlayMode:(int64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HKOverlayRoomTrendContext *v16;
  HKOverlayRoomTrendContext *v17;
  void *v18;
  uint64_t v19;
  HKInteractiveChartDisplayType *trendDisplayType;
  void *v21;
  uint64_t v22;
  HKDisplayTypeContextItem *lastUpdatedItem;
  HKGraphSeries *seriesForSelectedTrend;
  objc_super v26;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v26.receiver = self;
  v26.super_class = (Class)HKOverlayRoomTrendContext;
  v16 = -[HKOverlayRoomTrendContext init](&v26, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_trendModel, a4);
    objc_msgSend(v15, "unitController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomTrendContext _buildTrendDisplayTypeFromModel:baseDisplayType:unitController:](v17, "_buildTrendDisplayTypeFromModel:baseDisplayType:unitController:", v13, v12, v18);
    v19 = objc_claimAutoreleasedReturnValue();
    trendDisplayType = v17->_trendDisplayType;
    v17->_trendDisplayType = (HKInteractiveChartDisplayType *)v19;

    objc_storeStrong((id *)&v17->_overlayChartController, a5);
    v17->_categoryIdentifier = objc_msgSend(v12, "categoryIdentifier");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "baseDisplayType");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v17->_categoryIdentifier = objc_msgSend(v21, "categoryIdentifier");

    }
    v17->_overlayMode = a7;
    -[HKOverlayRoomTrendContext _durationContextItemWithSummaryPhrase:timeScope:](v17, "_durationContextItemWithSummaryPhrase:timeScope:", &stru_1E9C4C428, 4);
    v22 = objc_claimAutoreleasedReturnValue();
    lastUpdatedItem = v17->_lastUpdatedItem;
    v17->_lastUpdatedItem = (HKDisplayTypeContextItem *)v22;

    seriesForSelectedTrend = v17->_seriesForSelectedTrend;
    v17->_seriesForSelectedTrend = 0;

  }
  return v17;
}

- (BOOL)isEqual:(id)a3
{
  HKOverlayRoomTrendContext *v4;

  v4 = (HKOverlayRoomTrendContext *)a3;
  objc_opt_class();
  LOBYTE(self) = objc_opt_isKindOfClass() & (self == v4);

  return (char)self;
}

+ (int64_t)findStartingTimeScopeFromTrendModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;

  v3 = a3;
  if (objc_msgSend(v3, "selectTrendInitially")
    && (objc_msgSend(v3, "timeScopeTrends"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "firstObject"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    objc_msgSend(v3, "timeScopeTrends");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "timeScope");

  }
  else
  {
    v8 = 8;
  }

  return v8;
}

+ (id)findInitialDateFromTrendModel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "timeScopeTrends");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trendSpans");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "trendDateInterval");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v3, "selectTrendInitially");
  v9 = 0;
  if ((_DWORD)v4 && v8)
  {
    objc_msgSend(v8, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)_buildTrendDisplayTypeFromModel:(id)a3 baseDisplayType:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  HKFixedValueDateSpanDataSource *v17;
  void *v18;
  void *v19;
  HKInteractiveChartDisplayType *v20;
  void *v21;
  HKInteractiveChartDisplayType *v22;
  _QWORD v24[4];
  id v25;
  _QWORD aBlock[4];
  id v27;
  id v28;

  v8 = a5;
  v9 = a3;
  -[HKOverlayRoomTrendContext _representativeDisplayTypeFromDisplayType:](self, "_representativeDisplayTypeFromDisplayType:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke;
  aBlock[3] = &unk_1E9C411C0;
  v27 = v8;
  v12 = v10;
  v28 = v12;
  v13 = v8;
  v14 = _Block_copy(aBlock);
  v24[0] = v11;
  v24[1] = 3221225472;
  v24[2] = __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke_2;
  v24[3] = &unk_1E9C411E8;
  v25 = v12;
  v15 = v12;
  v16 = _Block_copy(v24);
  v17 = -[HKFixedValueDateSpanDataSource initWithTrendModel:preferredUnitBlock:fixedValueScalingBlock:]([HKFixedValueDateSpanDataSource alloc], "initWithTrendModel:preferredUnitBlock:fixedValueScalingBlock:", v9, v14, v16);

  -[HKOverlayRoomTrendContext _buildAnnotatedHorizontalLineSeriesUsingDisplayType:unitController:](self, "_buildAnnotatedHorizontalLineSeriesUsingDisplayType:unitController:", v15, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDataSource:", v17);
  -[HKOverlayRoomTrendContext _buildTrendOverlayValueFormatterUsingDisplayType:unitController:](self, "_buildTrendOverlayValueFormatterUsingDisplayType:unitController:", v15, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = [HKInteractiveChartDisplayType alloc];
  objc_msgSend(v15, "objectType");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HKInteractiveChartDisplayType initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:](v20, "initWithGraphSeries:baseDisplayType:valueFormatter:dataTypeCode:", v18, v15, v19, objc_msgSend(v21, "code"));

  return v22;
}

uint64_t __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unitForDisplayType:", *(_QWORD *)(a1 + 40));
}

id __92__HKOverlayRoomTrendContext__buildTrendDisplayTypeFromModel_baseDisplayType_unitController___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "presentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "adjustedValueForDaemonValue:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_representativeDisplayTypeFromDisplayType:(id)a3
{
  id v3;
  char isKindOfClass;
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "baseDisplayType");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v6;
    v7 = v10;

  }
  return v7;
}

- (id)_buildTrendOverlayValueFormatterUsingDisplayType:(id)a3 unitController:(id)a4
{
  id v5;
  id v6;
  HKInteractiveChartTrendOverlayFormatter *v7;
  void *v8;
  void *v9;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(HKInteractiveChartTrendOverlayFormatter);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopValueFont");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter setMajorFont:](v7, "setMajorFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter setMinorFont:](v7, "setMinorFont:", v9);

  -[HKInteractiveChartDataFormatter setUnitController:](v7, "setUnitController:", v5);
  -[HKInteractiveChartDataFormatter setDisplayType:](v7, "setDisplayType:", v6);

  return v7;
}

- (id)_buildAnnotatedHorizontalLineSeriesUsingDisplayType:(id)a3 unitController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  HKDisplayTypeNumberFormatter *v16;
  HKUnitlessNumberFormatter *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  HKAnnotatedHorizontalLineSeries *v26;
  _QWORD v27[3];
  _QWORD v28[4];

  v28[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v26 = objc_alloc_init(HKAnnotatedHorizontalLineSeries);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_appKeyColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomTrendContext _representativeDisplayTypeFromDisplayType:](self, "_representativeDisplayTypeFromDisplayType:", v6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayCategory categoryWithID:](HKDisplayCategory, "categoryWithID:", objc_msgSend(v25, "categoryIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v10;
  if (v10)
  {
    objc_msgSend(v10, "color");
    v11 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v11;
  }
  v12 = v6;
  objc_opt_class();
  v13 = v12;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v12;
    objc_msgSend(v14, "baseDisplayType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v14;
    if (v15)
    {
      objc_msgSend(v14, "baseDisplayType");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  v16 = -[HKDisplayTypeNumberFormatter initWithDisplayType:unitController:]([HKDisplayTypeNumberFormatter alloc], "initWithDisplayType:unitController:", v13, v7);
  v17 = -[HKUnitlessNumberFormatter initWithDisplayType:unitPreferenceController:]([HKUnitlessNumberFormatter alloc], "initWithDisplayType:unitPreferenceController:", v13, v7);
  -[HKOverlayRoomTrendContext _buildTrendingLineSeriesStyleWithColor:formattingDisplayType:unitController:annotationFormatter:](self, "_buildTrendingLineSeriesStyleWithColor:formattingDisplayType:unitController:annotationFormatter:", v9, v13, v7, v17);
  v23 = v12;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomTrendContext _buildTrendingLineSeriesStyleWithColor:formattingDisplayType:unitController:annotationFormatter:](self, "_buildTrendingLineSeriesStyleWithColor:formattingDisplayType:unitController:annotationFormatter:", v8, v13, v7, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKOverlayRoomTrendContext _buildTrendingLineSeriesStyleWithColor:formattingDisplayType:unitController:annotationFormatter:](self, "_buildTrendingLineSeriesStyleWithColor:formattingDisplayType:unitController:annotationFormatter:", v9, v13, v7, v16);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v27[0] = &unk_1E9CEAFD0;
  v27[1] = &unk_1E9CEAFE8;
  v28[0] = v20;
  v28[1] = v18;
  v27[2] = &unk_1E9CEB000;
  v28[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAnnotatedHorizontalLineSeries setHorizontalLineStyles:](v26, "setHorizontalLineStyles:", v21);

  -[HKAnnotatedHorizontalLineSeries setValueOutlineWidth:](v26, "setValueOutlineWidth:", 0.0);
  return v26;
}

- (id)_buildTrendingLineSeriesStyleWithColor:(id)a3 formattingDisplayType:(id)a4 unitController:(id)a5 annotationFormatter:(id)a6
{
  id v7;
  id v8;
  HKStrokeStyle *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  HKAnnotationHorizontalLineSeriesStyle *v14;

  v7 = a3;
  v8 = a6;
  v9 = objc_alloc_init(HKStrokeStyle);
  -[HKStrokeStyle setStrokeColor:](v9, "setStrokeColor:", v7);
  -[HKStrokeStyle setLineWidth:](v9, "setLineWidth:", 4.0);
  -[HKStrokeStyle setLineCap:](v9, "setLineCap:", 1);
  -[HKStrokeStyle setLineJoin:](v9, "setLineJoin:", 1);
  -[HKStrokeStyle setDashStyle:](v9, "setDashStyle:", 0);
  objc_msgSend(MEMORY[0x1E0DC3E88], "currentTraitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceStyle");
  if (v11 <= 2)
    -[HKStrokeStyle setBlendMode:](v9, "setBlendMode:", dword_1D7B813E0[v11]);
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredRoundedFontForTextStyle:additionalSymbolicTraits:", *MEMORY[0x1E0DC4AB8], 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v7, v12, 0, 2, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_alloc_init(HKAnnotationHorizontalLineSeriesStyle);
  -[HKAnnotationHorizontalLineSeriesStyle setLineStrokeStyle:](v14, "setLineStrokeStyle:", v9);
  -[HKAnnotationHorizontalLineSeriesStyle setValueStyle:](v14, "setValueStyle:", v13);

  return v14;
}

- (id)sampleTypeForDateRangeUpdates
{
  return 0;
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
  -[HKOverlayRoomTrendContext trendDisplayType](self, "trendDisplayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKOverlayRoomTrendContext trendDisplayType](self, "trendDisplayType");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomTrendContext overlayChartController](self, "overlayChartController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "graphSeriesForTimeScope:", a5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "startDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke;
    v19[3] = &unk_1E9C41238;
    v19[4] = self;
    v21 = a5;
    v20 = v11;
    objc_msgSend(v15, "cachedDataForCustomGraphSeries:timeScope:resolution:startDate:endDate:completion:", v16, a5, 0, v17, v18, v19);

  }
}

void __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke(_QWORD *a1, void *a2, char a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  char v17;

  v7 = a2;
  v8 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2;
  v12[3] = &unk_1E9C41210;
  v17 = a3;
  v9 = (void *)a1[5];
  v12[4] = a1[4];
  v13 = v7;
  v16 = a1[6];
  v14 = v8;
  v15 = v9;
  v10 = v8;
  v11 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], v12);

}

void __112__HKOverlayRoomTrendContext_updateContextItemForDateInterval_overlayController_timeScope_resolution_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  if (*(_BYTE *)(a1 + 72))
  {
    objc_msgSend(*(id *)(a1 + 32), "_summaryGivenChartPoints:timeScope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_durationContextItemWithSummaryPhrase:timeScope:", v3, *(_QWORD *)(a1 + 64));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setLastUpdatedItem:", v2);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
}

- (BOOL)canSelectOverlayContextItem:(id)a3 isDeselecting:(BOOL)a4 timeScope:(int64_t)a5 chartController:(id)a6
{
  return -[HKOverlayRoomTrendContext _timeScopeMayHaveTrends:](self, "_timeScopeMayHaveTrends:", a5, a4);
}

- (void)overlayStateDidChange:(BOOL)a3 contextItem:(id)a4 chartController:(id)a5
{
  _BOOL4 v5;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a3;
  v14 = a5;
  objc_msgSend(v14, "selectedTimeScopeController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "selectedTimeScope");

  if (v5)
  {
    objc_msgSend(v14, "fixedRangeForTimeScope:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(v14, "currentCalendar");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKOverlayRoomTrendContext _trendValueRangeForTimescope:calendar:](self, "_trendValueRangeForTimescope:calendar:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        objc_msgSend(v14, "scrollToRange:withVisibleAlignment:", v11, 1);

    }
    -[HKOverlayRoomTrendContext trendDisplayType](self, "trendDisplayType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "graphSeriesForTimeScope:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKOverlayRoomTrendContext setSeriesForSelectedTrend:](self, "setSeriesForSelectedTrend:", v13);

  }
  else
  {
    -[HKOverlayRoomTrendContext setSeriesForSelectedTrend:](self, "setSeriesForSelectedTrend:", 0);
  }

}

- (int64_t)resolutionForTimeScope:(int64_t)a3 traitResolution:(int64_t)a4
{
  return 0;
}

- (id)_trendValueRangeForTimescope:(int64_t)a3 calendar:(id)a4
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  id obj;
  uint64_t v28;
  id v29;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v31 = a4;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  -[HKOverlayRoomTrendContext trendModel](self, "trendModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeScopeTrends");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v38;
    v25 = *(_QWORD *)v38;
    do
    {
      v10 = 0;
      v26 = v7;
      do
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v10);
        if (objc_msgSend(v11, "timeScope", v25) == a3)
        {
          v28 = v10;
          v35 = 0u;
          v36 = 0u;
          v33 = 0u;
          v34 = 0u;
          objc_msgSend(v11, "trendSpans");
          v29 = (id)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v34;
            do
            {
              for (i = 0; i != v13; ++i)
              {
                if (*(_QWORD *)v34 != v14)
                  objc_enumerationMutation(v29);
                v16 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
                objc_msgSend(v16, "trendDateInterval");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "startDate");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "trendDateInterval");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "endDate");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v18, v20);
                v21 = (void *)objc_claimAutoreleasedReturnValue();

                -[HKOverlayRoomTrendContext _adjustTrendValueRange:timescope:calendar:](self, "_adjustTrendValueRange:timescope:calendar:", v21, a3, v31);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = v22;
                if (v8)
                  objc_msgSend(v8, "unionRange:", v22);
                else
                  v8 = v22;

              }
              v13 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
            }
            while (v13);
          }

          v9 = v25;
          v7 = v26;
          v10 = v28;
        }
        ++v10;
      }
      while (v10 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_adjustTrendValueRange:(id)a3 timescope:(int64_t)a4 calendar:(id)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;

  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (a4 == 4)
  {
    objc_msgSend(v9, "endDate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "endDate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v22, "hk_isBeforeDate:", v23);

    if (v24)
    {
      objc_msgSend(v9, "endDate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 1, v25);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "endDate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v25) = objc_msgSend(v18, "hk_isBeforeDate:", v26);

      if ((_DWORD)v25)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomTrendContext.m"), 372, CFSTR("Trend end date computation failure"));

      }
    }
    else
    {
      v18 = v22;
    }
    objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", -31, v18);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_startOfDateByAddingDays:toDate:", 0, v31);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 != 3)
    {
      v28 = 0;
      goto LABEL_17;
    }
    v12 = objc_msgSend(v10, "firstWeekday");
    objc_msgSend(v9, "endDate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v12, v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "endDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = objc_msgSend(v14, "hk_isBeforeDate:", v15);

    if ((_DWORD)v13)
    {
      v16 = objc_msgSend(v11, "firstWeekday");
      objc_msgSend(v9, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v16, v17, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "endDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v17) = objc_msgSend(v18, "hk_isBeforeDate:", v19);

      if ((_DWORD)v17)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKOverlayRoomTrendContext.m"), 358, CFSTR("Trend end date computation failure"));

      }
    }
    else
    {
      v18 = v14;
    }
    objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", objc_msgSend(v11, "firstWeekday"), v18, -26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v11, "firstWeekday");
    objc_msgSend(v9, "startDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hk_startOfWeekWithFirstWeekday:beforeDate:addingWeeks:", v30, v31, 0);
    v32 = objc_claimAutoreleasedReturnValue();
  }
  v33 = (void *)v32;

  if (objc_msgSend(v33, "hk_isBeforeDate:", v29))
  {
    v34 = v29;

    v33 = v34;
  }
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v33, v18);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_17:
  return v28;
}

- (id)_summaryGivenChartPoints:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if (-[HKOverlayRoomTrendContext _timeScopeMayHaveTrends:](self, "_timeScopeMayHaveTrends:", a4))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v8 = (void *)MEMORY[0x1E0CB34D0];
      v9 = v7;
      objc_msgSend(v8, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizableTrendDescription");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "localizedStringForKey:value:table:", v11, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("TREND_UNAVAILABLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("TREND_NOT_COMPUTED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_durationContextItemWithSummaryPhrase:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  HKDisplayTypeContextItem *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = objc_alloc_init(HKDisplayTypeContextItem);
  -[HKOverlayRoomTrendContext _trendTitle](self, "_trendTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setTitle:](v7, "setTitle:", v8);

  objc_msgSend(MEMORY[0x1E0CB3940], "hk_chartOverlayAccessibilityIdentifier:", CFSTR("Trend"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setAccessibilityIdentifier:](v7, "setAccessibilityIdentifier:", v9);

  -[HKDisplayTypeContextItem setInfoHidden:](v7, "setInfoHidden:", 1);
  -[HKDisplayTypeContextItem setUnit:](v7, "setUnit:", &stru_1E9C4C428);
  -[HKDisplayTypeContextItem setValue:](v7, "setValue:", v6);

  -[HKDisplayTypeContextItem setUserInteractive:](v7, "setUserInteractive:", -[HKOverlayRoomTrendContext _timeScopeMayHaveTrends:](self, "_timeScopeMayHaveTrends:", a4));
  -[HKOverlayRoomTrendContext _unselectedMetricColorsUserInteractive:](self, "_unselectedMetricColorsUserInteractive:", -[HKDisplayTypeContextItem userInteractive](v7, "userInteractive"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setMetricColors:](v7, "setMetricColors:", v10);

  +[HKOverlayContextUtilities selectedMetricColorsForCategory:](HKOverlayContextUtilities, "selectedMetricColorsForCategory:", -[HKOverlayRoomTrendContext categoryIdentifier](self, "categoryIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDisplayTypeContextItem setSelectedMetricColors:](v7, "setSelectedMetricColors:", v11);

  return v7;
}

- (id)_unselectedMetricColorsUserInteractive:(BOOL)a3
{
  void *v3;
  unint64_t v5;
  uint64_t v6;
  void *v7;

  v5 = -[HKOverlayRoomTrendContext overlayMode](self, "overlayMode");
  if (v5 < 3)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemBackgroundColor");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v7 = (void *)v6;
      +[HKUIMetricColors defaultContextViewColorsUsingColor:](HKUIMetricColors, "defaultContextViewColorsUsingColor:", v6);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      return v3;
    }
    goto LABEL_8;
  }
  if (v5 == 3)
  {
    if (a3)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemBackgroundColor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_8:
    +[HKUIMetricColors disabledContextViewColor](HKUIMetricColors, "disabledContextViewColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_trendTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("TREND_TITLE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_timeScopeMayHaveTrends:(int64_t)a3
{
  return (unint64_t)(a3 - 3) <= 1
      && -[HKOverlayRoomTrendContext _timeScopeHasTrendSpans:](self, "_timeScopeHasTrendSpans:");
}

- (BOOL)_timeScopeHasTrendSpans:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HKOverlayRoomTrendContext trendModel](self, "trendModel", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeScopeTrends");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "timeScope") == a3)
        {
          objc_msgSend(v10, "trendSpans");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "count");

          if (v12)
          {
            v13 = 1;
            goto LABEL_12;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_12:

  return v13;
}

- (int64_t)overlayMode
{
  return self->_overlayMode;
}

- (HKChartSummaryTrendModel)trendModel
{
  return self->_trendModel;
}

- (HKInteractiveChartDisplayType)trendDisplayType
{
  return self->_trendDisplayType;
}

- (HKInteractiveChartOverlayViewController)overlayChartController
{
  return self->_overlayChartController;
}

- (int64_t)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (HKDisplayTypeContextItem)lastUpdatedItem
{
  return self->_lastUpdatedItem;
}

- (void)setLastUpdatedItem:(id)a3
{
  objc_storeStrong((id *)&self->_lastUpdatedItem, a3);
}

- (HKGraphSeries)seriesForSelectedTrend
{
  return self->_seriesForSelectedTrend;
}

- (void)setSeriesForSelectedTrend:(id)a3
{
  objc_storeStrong((id *)&self->_seriesForSelectedTrend, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seriesForSelectedTrend, 0);
  objc_storeStrong((id *)&self->_lastUpdatedItem, 0);
  objc_storeStrong((id *)&self->_overlayChartController, 0);
  objc_storeStrong((id *)&self->_trendDisplayType, 0);
  objc_storeStrong((id *)&self->_trendModel, 0);
}

@end
