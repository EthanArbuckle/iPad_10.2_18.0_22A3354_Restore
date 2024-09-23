@implementation HKHistogramChartViewController

- (HKHistogramChartViewController)initWithHealthStore:(id)a3 dataSource:(id)a4 dataFormatter:(id)a5 minimumGraphViewHeight:(double)a6
{
  id v11;
  id v12;
  id v13;
  HKHistogramChartViewController *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HKDisplayType *displayType;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HKHistogramChartViewController;
  v14 = -[HKHistogramChartViewController init](&v20, sel_init);
  if (v14)
  {
    +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "quantityType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "displayTypeForObjectType:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    displayType = v14->_displayType;
    v14->_displayType = (HKDisplayType *)v17;

    objc_storeStrong((id *)&v14->_healthStore, a3);
    v14->_minimumGraphViewHeight = a6;
    objc_storeStrong((id *)&v14->_dataSource, a4);
    -[HKHistogramChartDataSource setFetchObserver:](v14->_dataSource, "setFetchObserver:", v14);
    objc_storeStrong((id *)&v14->_dataFormatter, a5);
  }

  return v14;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  id v5;
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
  HKHistogramAnnotationViewDataSource *v16;
  HKLollipopController *v17;
  void *v18;
  void *v19;
  HKLollipopController *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HKHistogramChartViewController;
  -[HKHistogramChartViewController viewDidLoad](&v21, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v4 = (void *)objc_msgSend(v3, "initWithArrangedSubviews:", MEMORY[0x1E0C9AA60]);
  objc_msgSend(v4, "setAxis:", 1);
  v5 = objc_alloc(MEMORY[0x1E0DC3990]);
  v6 = (void *)objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[HKHistogramChartViewController setHeaderLabel:](self, "setHeaderLabel:", v6);

  -[HKHistogramChartViewController headerLabel](self, "headerLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNumberOfLines:", 0);

  -[HKHistogramChartViewController headerLabel](self, "headerLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v8);

  -[HKHistogramChartViewController graphViewController](self, "graphViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartViewController addChildViewController:](self, "addChildViewController:", v9);

  -[HKHistogramChartViewController graphViewController](self, "graphViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didMoveToParentViewController:", self);

  -[HKHistogramChartViewController graphViewController](self, "graphViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addArrangedSubview:", v12);

  -[HKHistogramChartViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v4);

  -[HKHistogramChartViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartViewController _pinView:toParentView:](self, "_pinView:toParentView:", v4, v14);

  -[HKHistogramChartViewController dataFormatter](self, "dataFormatter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HKHistogramAnnotationViewDataSource initWithFormatter:]([HKHistogramAnnotationViewDataSource alloc], "initWithFormatter:", v15);
  -[HKHistogramChartViewController setAnnotationViewDataSource:](self, "setAnnotationViewDataSource:", v16);

  v17 = [HKLollipopController alloc];
  -[HKHistogramChartViewController annotationViewDataSource](self, "annotationViewDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartViewController view](self, "view");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HKLollipopController initWithAnnotationDataSource:parentView:delegate:](v17, "initWithAnnotationDataSource:parentView:delegate:", v18, v19, self);
  -[HKHistogramChartViewController setLollipopController:](self, "setLollipopController:", v20);

}

- (HKScalarGraphViewController)graphViewController
{
  HKScalarGraphViewController *graphViewController;
  HKHistogramAxisDimension *v4;
  void *v5;
  HKScalarGraphViewController *v6;
  HKScalarGraphViewController *v7;
  HKScalarGraphViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  graphViewController = self->_graphViewController;
  if (!graphViewController)
  {
    v4 = objc_alloc_init(HKHistogramAxisDimension);
    -[HKHistogramChartViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHistogramAxisDimension setDataSource:](v4, "setDataSource:", v5);

    v6 = [HKScalarGraphViewController alloc];
    -[HKHistogramChartViewController minimumGraphViewHeight](self, "minimumGraphViewHeight");
    v7 = -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](v6, "initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:", v4, 3, 0);
    v8 = self->_graphViewController;
    self->_graphViewController = v7;

    -[HKGraphViewController graphView](self->_graphViewController, "graphView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDelegate:", self);

    -[HKGraphViewController graphView](self->_graphViewController, "graphView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMultiSeriesSelection:", 1);

    -[HKGraphViewController graphView](self->_graphViewController, "graphView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setDisableSelection:", 0);

    v12 = *MEMORY[0x1E0DC49E8];
    v13 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v15 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    -[HKGraphViewController graphView](self->_graphViewController, "graphView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAxisInset:", v12, v13, v14, v15);

    -[HKGraphViewController graphView](self->_graphViewController, "graphView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "xAxis");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "preferredStyle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "labelStyle");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setVerticalAlignment:", 2);

    graphViewController = self->_graphViewController;
  }
  return graphViewController;
}

- (CGSize)_barCornerRadiusForCurrentDevice
{
  void *v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isiPad"))
    v3 = 3.0;
  else
    v3 = 1.5;

  v4 = v3;
  v5 = v3;
  result.height = v5;
  result.width = v4;
  return result;
}

- (HKHistogramBarSeries)histogramSeries
{
  HKHistogramBarSeries *histogramSeries;
  HKHistogramBarSeries *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HKHistogramBarSeries *v10;
  HKHistogramBarSeries *v11;
  HKHistogramBarSeries *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  histogramSeries = self->_histogramSeries;
  if (!histogramSeries)
  {
    v4 = [HKHistogramBarSeries alloc];
    -[HKHistogramChartViewController displayType](self, "displayType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayCategory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fillStyle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHistogramChartViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "numberOfBins");
    -[HKHistogramChartViewController _barCornerRadiusForCurrentDevice](self, "_barCornerRadiusForCurrentDevice");
    v10 = -[HKHistogramBarSeries initWithFillStyle:numberOfColumns:cornerRadii:](v4, "initWithFillStyle:numberOfColumns:cornerRadii:", v7, v9);
    v11 = self->_histogramSeries;
    self->_histogramSeries = v10;

    v12 = self->_histogramSeries;
    objc_msgSend((id)objc_opt_class(), "defaultVerticalAxis");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries setYAxis:](v12, "setYAxis:", v13);

    -[HKHistogramChartViewController dataSource](self, "dataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "yAxisRange");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      +[HKNumericFixedAxisScalingRule ruleWithDefaultAxisBounds:axisBoundsOverrides:](HKNumericFixedAxisScalingRule, "ruleWithDefaultAxisBounds:axisBoundsOverrides:", v15, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKGraphSeries setAxisScalingRule:](self->_histogramSeries, "setAxisScalingRule:", v16);

    }
    -[HKHistogramChartViewController dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKGraphSeries setDataSource:](self->_histogramSeries, "setDataSource:", v17);

    histogramSeries = self->_histogramSeries;
  }
  return histogramSeries;
}

+ (id)defaultVerticalAxis
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
  void *v14;
  HKNumericAxisConfiguration *v15;
  HKNumericAxis *v16;

  v2 = objc_alloc_init(HKSolidFillStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSolidFillStyle setColor:](v2, "setColor:", v3);

  v4 = objc_alloc_init(HKAxisStyle);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v5, v6, 2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setLabelStyle:](v4, "setLabelStyle:", v7);

  -[HKAxisStyle setTickPositions:](v4, "setTickPositions:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v8, 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setAxisLineStyle:](v4, "setAxisLineStyle:", v9);

  -[HKAxisStyle setFillStyle:](v4, "setFillStyle:", v2);
  -[HKAxisStyle setFillInnerPadding:](v4, "setFillInnerPadding:", 4.0);
  -[HKAxisStyle setFillOuterPadding:](v4, "setFillOuterPadding:", 4.0);
  -[HKAxisStyle setLocation:](v4, "setLocation:", 1);
  -[HKAxisStyle setShowGridLines:](v4, "setShowGridLines:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "colorWithAlphaComponent:", 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v11, HKUIOnePixel());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setGridLineStyle:](v4, "setGridLineStyle:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v13, HKUIOnePixel() * 0.5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAxisStyle setBorderStyleForFill:](v4, "setBorderStyleForFill:", v14);

  v15 = objc_alloc_init(HKNumericAxisConfiguration);
  -[HKAxisConfiguration setPreferredStyle:](v15, "setPreferredStyle:", v4);
  v16 = -[HKNumericAxis initWithConfiguration:]([HKNumericAxis alloc], "initWithConfiguration:", v15);

  return v16;
}

- (void)_pinView:(id)a3 toParentView:(id)a4
{
  id v5;
  id v6;
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
  id v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v6, "leadingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leadingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintEqualToAnchor:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setActive:", 1);

  objc_msgSend(v6, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "constraintEqualToAnchor:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setActive:", 1);

  objc_msgSend(v6, "topAnchor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "constraintEqualToAnchor:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setActive:", 1);

  objc_msgSend(v6, "bottomAnchor");
  v18 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "bottomAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "constraintEqualToAnchor:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setActive:", 1);

}

- (id)_descriptionDateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)_descriptionDateFormatter_formatter;
  if (!_descriptionDateFormatter_formatter)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v4 = (void *)_descriptionDateFormatter_formatter;
    _descriptionDateFormatter_formatter = (uint64_t)v3;

    objc_msgSend((id)_descriptionDateFormatter_formatter, "setDateFormat:", CFSTR("MM/dd/yyyy"));
    v2 = (void *)_descriptionDateFormatter_formatter;
  }
  return v2;
}

- (id)_displayDescriptionForDataSource:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[HKHistogramChartViewController _descriptionDateFormatter](self, "_descriptionDateFormatter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "samplesStartDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringFromDate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHistogramChartViewController _descriptionDateFormatter](self, "_descriptionDateFormatter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "samplesEndDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "stringFromDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)didCompleteFetchForDataSource:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  -[HKHistogramChartViewController displayType](self, "displayType", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localization");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayName");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  -[HKHistogramChartViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartViewController _displayDescriptionForDataSource:](self, "_displayDescriptionForDataSource:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ Histogram\n%@"), v21, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKHistogramChartViewController headerLabel](self, "headerLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  -[HKHistogramChartViewController dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "numberOfBins");
  -[HKHistogramChartViewController histogramSeries](self, "histogramSeries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumberOfColumns:", v11);

  -[HKHistogramChartViewController graphViewController](self, "graphViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "graphView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "xAxis");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "valueForKeyPath:", CFSTR("axisLabelCache"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performSelector:", sel_invalidateCache);

  -[HKHistogramChartViewController dataSource](self, "dataSource");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "xAxisRange");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKHistogramChartViewController graphViewController](self, "graphViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "graphView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v18, v18, v18);

}

- (void)updateAnnotationDataSource:(id)a3 pointContexts:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[HKHistogramChartViewController annotationViewDataSource](self, "annotationViewDataSource");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updateWithPointSelectionContexts:", v5);

}

- (int64_t)stackCountForGraphView:(id)a3
{
  return 1;
}

- (id)graphView:(id)a3 graphSeriesForZoom:(int64_t)a4 stackOffset:(int64_t)a5
{
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[HKHistogramChartViewController histogramSeries](self, "histogramSeries", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)seriesSelectionLineColorForGraphView:(id)a3
{
  void *v3;
  void *v4;

  -[HKHistogramChartViewController displayType](self, "displayType", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "color");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)graphViewPointSelectionDifferentiatesSeriesGroups:(id)a3
{
  return 1;
}

- (void)graphView:(id)a3 didUpdateSelectedPoint:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v17 = a4;
  if (+[HKLollipopController pointSelectionContextsHaveUserInfo:](HKLollipopController, "pointSelectionContextsHaveUserInfo:"))
  {
    -[HKHistogramChartViewController lollipopController](self, "lollipopController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isVisible");

    if (v6)
    {
      -[HKHistogramChartViewController lollipopController](self, "lollipopController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "updateWithPointContexts:", v17);
    }
    else
    {
      -[HKHistogramChartViewController headerLabel](self, "headerLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "frame");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;

      -[HKHistogramChartViewController lollipopController](self, "lollipopController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setVisibleWithRect:pointContexts:animated:", v17, 1, v10, v12, v14, v16);
    }

  }
}

- (void)graphViewDidEndSelection:(id)a3
{
  id v3;

  -[HKHistogramChartViewController lollipopController](self, "lollipopController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvisibleAnimated:", 1);

}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (void)setHealthStore:(id)a3
{
  objc_storeStrong((id *)&self->_healthStore, a3);
}

- (double)minimumGraphViewHeight
{
  return self->_minimumGraphViewHeight;
}

- (void)setMinimumGraphViewHeight:(double)a3
{
  self->_minimumGraphViewHeight = a3;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (void)setGraphViewController:(id)a3
{
  objc_storeStrong((id *)&self->_graphViewController, a3);
}

- (void)setHistogramSeries:(id)a3
{
  objc_storeStrong((id *)&self->_histogramSeries, a3);
}

- (HKHistogramChartDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (HKHistogramChartDataFormatter)dataFormatter
{
  return self->_dataFormatter;
}

- (void)setDataFormatter:(id)a3
{
  objc_storeStrong((id *)&self->_dataFormatter, a3);
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void)setDisplayType:(id)a3
{
  objc_storeStrong((id *)&self->_displayType, a3);
}

- (HKHistogramAnnotationViewDataSource)annotationViewDataSource
{
  return self->_annotationViewDataSource;
}

- (void)setAnnotationViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_annotationViewDataSource, a3);
}

- (HKLollipopController)lollipopController
{
  return self->_lollipopController;
}

- (void)setLollipopController:(id)a3
{
  objc_storeStrong((id *)&self->_lollipopController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lollipopController, 0);
  objc_storeStrong((id *)&self->_annotationViewDataSource, 0);
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dataFormatter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_histogramSeries, 0);
  objc_storeStrong((id *)&self->_graphViewController, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

@end
