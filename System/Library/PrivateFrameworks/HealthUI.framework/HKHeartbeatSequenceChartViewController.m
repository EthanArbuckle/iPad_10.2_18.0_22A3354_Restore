@implementation HKHeartbeatSequenceChartViewController

- (HKHeartbeatSequenceChartViewController)initWithMinimumHeight:(double)a3
{
  return -[HKHeartbeatSequenceChartViewController initWithMinimumHeight:startDate:](self, "initWithMinimumHeight:startDate:", 0, a3);
}

- (HKHeartbeatSequenceChartViewController)initWithMinimumHeight:(double)a3 startDate:(id)a4
{
  id v7;
  HKAxisLabelDimensionMinuteSecond *v8;
  HKHeartbeatSequenceChartViewController *v9;
  NSMutableArray *v10;
  NSMutableArray *sequenceDataSources;
  NSMutableArray *v12;
  NSMutableArray *graphSeries;
  uint64_t v14;
  HKAxis *commonVerticalAxis;
  objc_super v17;

  v7 = a4;
  v8 = -[HKAxisLabelDimensionMinuteSecond initWithStartDate:]([HKAxisLabelDimensionMinuteSecond alloc], "initWithStartDate:", v7);
  v17.receiver = self;
  v17.super_class = (Class)HKHeartbeatSequenceChartViewController;
  v9 = -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](&v17, sel_initWithMinimumHeight_labelDimension_labelEndings_numericAxisConfigurationOverrides_, v8, 0, 0, a3);
  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    sequenceDataSources = v9->_sequenceDataSources;
    v9->_sequenceDataSources = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    graphSeries = v9->_graphSeries;
    v9->_graphSeries = v12;

    -[HKHeartbeatSequenceChartViewController _verticalNumericalAxis](v9, "_verticalNumericalAxis");
    v14 = objc_claimAutoreleasedReturnValue();
    commonVerticalAxis = v9->_commonVerticalAxis;
    v9->_commonVerticalAxis = (HKAxis *)v14;

    objc_storeStrong((id *)&v9->_startDate, a4);
  }

  return v9;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKHeartbeatSequenceChartViewController;
  -[HKScalarGraphViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[HKHeartbeatSequenceChartViewController _adjustGraphViewOptions](self, "_adjustGraphViewOptions");
  -[HKHeartbeatSequenceChartViewController _recomputeAxisRanges](self, "_recomputeAxisRanges");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKHeartbeatSequenceChartViewController;
  -[HKHeartbeatSequenceChartViewController viewWillLayoutSubviews](&v13, sel_viewWillLayoutSubviews);
  -[HKHeartbeatSequenceChartViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[HKGraphViewController graphView](self, "graphView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

- (void)addSequenceData:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  HKHealthKeyColor();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[HKHeartbeatSequenceChartViewController addSequenceData:color:lineWidth:markerRadius:dashStyle:annotate:](self, "addSequenceData:color:lineWidth:markerRadius:dashStyle:annotate:", v4, v5, 0, 1, 2.0, 3.0);

}

- (void)addSequenceData:(id)a3 color:(id)a4 lineWidth:(double)a5 markerRadius:(double)a6 dashStyle:(int64_t)a7 annotate:(BOOL)a8
{
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  double v18;
  double v19;
  int64_t v20;
  BOOL v21;

  v14 = a4;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __106__HKHeartbeatSequenceChartViewController_addSequenceData_color_lineWidth_markerRadius_dashStyle_annotate___block_invoke;
  v16[3] = &unk_1E9C43378;
  v16[4] = self;
  v17 = v14;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v15 = v14;
  objc_msgSend(a3, "enumerateSequences:", v16);

}

uint64_t __106__HKHeartbeatSequenceChartViewController_addSequenceData_color_lineWidth_markerRadius_dashStyle_annotate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  HKHeartbeatSequenceDataSource *v4;
  void *v5;

  v3 = a2;
  v4 = objc_alloc_init(HKHeartbeatSequenceDataSource);
  -[HKHeartbeatSequenceDataSource setHeartbeatSequencePoints:](v4, "setHeartbeatSequencePoints:", v3);

  objc_msgSend(*(id *)(a1 + 32), "_heartbeatSequenceSeriesForSource:axis:color:lineWidth:markerRadius:dashStyle:annotate:", v4, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1032), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 48), *(double *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "addObject:", v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "addObject:", v5);

  return 1;
}

- (void)_adjustGraphViewOptions
{
  id v2;

  -[HKGraphViewController graphView](self, "graphView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDisableSelection:", 1);
  objc_msgSend(v2, "setOutlineOptions:", 4);

}

- (void)_recomputeAxisRanges
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[HKGraphViewController graphView](self, "graphView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v4 = self->_sequenceDataSources;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v34;
    v8 = -1.79769313e308;
    v9 = 1.79769313e308;
    v10 = 1.79769313e308;
    v11 = -1.79769313e308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v34 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * i), "unionWithExtent:", v9, v10, v8, v11, (_QWORD)v33);
        v9 = v13;
        v10 = v14;
        v8 = v15;
        v11 = v16;
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v6);
  }
  else
  {
    v8 = -1.79769313e308;
    v9 = 1.79769313e308;
    v10 = 1.79769313e308;
    v11 = -1.79769313e308;
  }

  if (v9 >= 1.79769313e308 || v10 >= 1.79769313e308 || v8 <= -1.79769313e308 || v11 <= -1.79769313e308)
  {
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CED508, &unk_1E9CED508, (_QWORD)v33);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v19, v19, v19);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9 + -1.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKHeartbeatSequenceChartViewController initialXAxisOffset](self, "initialXAxisOffset");
    if (v20 >= v8 + -30.0)
      v20 = v8 + -30.0;
    v21 = v20 + 30.0;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (_QWORD)v33);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v19, v24, v24);
    v25 = v10 + v11;
    v26 = v10 + v11 * 0.5;
    v27 = v26 + 20.0;
    if (v11 >= 40.0)
      v28 = v10;
    else
      v28 = v26 + -20.0;
    if (v11 >= 40.0)
      v29 = v10 + v11;
    else
      v29 = v27;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v28, v25);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "autoscaleYAxesAnimated:specificRange:onlyIfNeeded:completion:", 0, v32, 0, 0);
  }

}

- (id)_heartbeatSequenceSeriesForSource:(id)a3 axis:(id)a4 color:(id)a5 lineWidth:(double)a6 markerRadius:(double)a7 dashStyle:(int64_t)a8 annotate:(BOOL)a9
{
  _BOOL4 v9;
  id v15;
  HKLineSeries *v16;
  HKGradientFillStyle *v17;
  void *v18;
  void *v19;
  HKGradientFillStyle *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  HKLineSeriesPointMarkerStyle *v26;
  void *v27;
  HKLineSeriesPresentationStyle *v28;
  HKAxisLabelStyle *v29;
  void *v30;
  HKLineSeriesPresentationStyle *v31;
  HKLineSeriesPresentationStyle *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  HKLineSeriesPointMarkerStyle *v41;
  HKGradientFillStyle *v42;
  id v43;
  HKGradientFillStyle *v44;
  id v45;
  HKLineSeriesPresentationStyle *v46;
  HKLineSeriesPresentationStyle *v47;
  _QWORD v48[2];

  v9 = a9;
  v48[1] = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v43 = a4;
  v45 = a3;
  v16 = objc_alloc_init(HKLineSeries);
  v17 = [HKGradientFillStyle alloc];
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v17, "initWithFirstColor:secondColor:", v18, v19);

  v20 = [HKGradientFillStyle alloc];
  HKHealthKeyColor();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "colorWithAlphaComponent:", 0.3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  HKHealthKeyColor();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "colorWithAlphaComponent:", 0.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = -[HKGradientFillStyle initWithFirstColor:secondColor:](v20, "initWithFirstColor:secondColor:", v22, v24);

  v25 = HKUIOnePixel() + a6;
  v26 = -[HKLineSeriesPointMarkerStyle initWithColor:radius:style:]([HKLineSeriesPointMarkerStyle alloc], "initWithColor:radius:style:", v15, 1, a7);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v15, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setDashStyle:", a8);
  v28 = objc_alloc_init(HKLineSeriesPresentationStyle);
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v28, "setStrokeStyle:", v27);
  v41 = v26;
  if (v9)
  {
    -[HKLineSeriesPresentationStyle setPointMarkerStyle:](v28, "setPointMarkerStyle:", v26);
    -[HKLineSeriesPresentationStyle setWaveForm:](v28, "setWaveForm:", 0);
    -[HKLineSeriesPresentationStyle setEndCapStyle:](v28, "setEndCapStyle:", v26);
    v29 = objc_alloc_init(HKAxisLabelStyle);
    objc_msgSend(MEMORY[0x1E0DC1350], "boldSystemFontOfSize:", 12.0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKAxisLabelStyle setFont:](v29, "setFont:", v30);

    -[HKAxisLabelStyle setTextColor:](v29, "setTextColor:", v15);
    -[HKLineSeriesPresentationStyle setAnnotationStyle:](v28, "setAnnotationStyle:", v29);

  }
  else
  {
    -[HKLineSeriesPresentationStyle setWaveForm:](v28, "setWaveForm:", 0);
    -[HKLineSeriesPresentationStyle setEndCapStyle:](v28, "setEndCapStyle:", v26);
  }
  v31 = objc_alloc_init(HKLineSeriesPresentationStyle);
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v31, "setStrokeStyle:", v27);
  -[HKLineSeriesPresentationStyle setFillStyle:](v31, "setFillStyle:", v44);
  -[HKLineSeriesPresentationStyle setWaveForm:](v31, "setWaveForm:", 0);
  v32 = objc_alloc_init(HKLineSeriesPresentationStyle);
  HKHealthKeyColor();
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v33, v25);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeriesPresentationStyle setStrokeStyle:](v32, "setStrokeStyle:", v34);

  -[HKLineSeriesPresentationStyle setFillStyle:](v32, "setFillStyle:", v42);
  -[HKLineSeriesPresentationStyle setWaveForm:](v32, "setWaveForm:", 0);
  v48[0] = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setUnhighlightedPresentationStyles:](v16, "setUnhighlightedPresentationStyles:", v35);

  v47 = v31;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setHighlightedPresentationStyles:](v16, "setHighlightedPresentationStyles:", v36);

  v46 = v32;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKLineSeries setSelectedPresentationStyles:](v16, "setSelectedPresentationStyles:", v37);

  -[HKGraphSeries setYAxis:](v16, "setYAxis:", v43);
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CED518, &unk_1E9CED528);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:axisBoundsOverrides:](HKNumericFixedAxisScalingRule, "ruleWithDefaultAxisBounds:axisBoundsOverrides:", v38, 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphSeries setAxisScalingRule:](v16, "setAxisScalingRule:", v39);

  -[HKGraphSeries setDataSource:](v16, "setDataSource:", v45);
  return v16;
}

- (id)_verticalNumericalAxis
{
  HKSolidFillStyle *v2;
  void *v3;
  HKAxisStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKNumericAxisConfiguration *v14;
  HKNumericAxis *v15;

  v2 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v2, "setColor:", v3);

  v4 = objc_alloc_init(HKAxisStyle);
  HKDefaultChartYAxisColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKNumberFormatterFromTemplate(0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:numberFormatter:", v5, v6, 2, 2, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setLabelStyle:](v4, "setLabelStyle:", v8);

  -[HKAxisStyle setTickPositions:](v4, "setTickPositions:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v9, 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setAxisLineStyle:](v4, "setAxisLineStyle:", v10);

  -[HKAxisStyle setFillStyle:](v4, "setFillStyle:", v2);
  -[HKAxisStyle setFillInnerPadding:](v4, "setFillInnerPadding:", 10.0);
  -[HKAxisStyle setFillOuterPadding:](v4, "setFillOuterPadding:", 15.0);
  -[HKAxisStyle setLocation:](v4, "setLocation:", 1);
  -[HKAxisStyle setShowGridLines:](v4, "setShowGridLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartGrayGraphColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "colorWithAlphaComponent:", 0.5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v12, HKUIOnePixel());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setGridLineStyle:](v4, "setGridLineStyle:", v13);

  v14 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setPreferredStyle:](v14, "setPreferredStyle:", v4);
  v15 = -[HKNumericAxis initWithConfiguration:]([HKNumericAxis alloc], "initWithConfiguration:", v14);

  return v15;
}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  return self->_graphSeries;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSMutableArray)sequenceDataSources
{
  return self->_sequenceDataSources;
}

- (void)setSequenceDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_sequenceDataSources, a3);
}

- (NSMutableArray)graphSeries
{
  return self->_graphSeries;
}

- (void)setGraphSeries:(id)a3
{
  objc_storeStrong((id *)&self->_graphSeries, a3);
}

- (HKAxis)commonVerticalAxis
{
  return self->_commonVerticalAxis;
}

- (void)setCommonVerticalAxis:(id)a3
{
  objc_storeStrong((id *)&self->_commonVerticalAxis, a3);
}

- (double)initialXAxisOffset
{
  return self->_initialXAxisOffset;
}

- (void)setInitialXAxisOffset:(double)a3
{
  self->_initialXAxisOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonVerticalAxis, 0);
  objc_storeStrong((id *)&self->_graphSeries, 0);
  objc_storeStrong((id *)&self->_sequenceDataSources, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
