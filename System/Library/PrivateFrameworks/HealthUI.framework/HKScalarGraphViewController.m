@implementation HKScalarGraphViewController

- (HKScalarGraphViewController)initWithMinimumHeight:(double)a3 labelDimension:(id)a4 labelEndings:(int64_t)a5 numericAxisConfigurationOverrides:(id)a6
{
  void *v8;
  HKScalarGraphViewController *v9;
  HKScalarGraphViewController *v10;
  objc_super v12;

  -[HKScalarGraphViewController _buildGraphViewWithLabelDimension:labelEndings:numericAxisConfigurationOverrides:](self, "_buildGraphViewWithLabelDimension:labelEndings:numericAxisConfigurationOverrides:", a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)HKScalarGraphViewController;
  v9 = -[HKGraphViewController initWithGraphView:dateZoom:](&v12, sel_initWithGraphView_dateZoom_, v8, 5);
  v10 = v9;
  if (v9)
    v9->_minimumHeight = a3;

  return v10;
}

- (HKScalarGraphViewController)initWithMinimumHeight:(double)a3
{
  return -[HKScalarGraphViewController initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:](self, "initWithMinimumHeight:labelDimension:labelEndings:numericAxisConfigurationOverrides:", 0, 0, 0, a3);
}

- (void)loadView
{
  HKMinimumSizeView *v3;

  v3 = -[HKMinimumSizeView initWithFrame:]([HKMinimumSizeView alloc], "initWithFrame:", 0.0, 0.0, 1.0, 1.0);
  -[HKMinimumSizeView setMinimumHeight:](v3, "setMinimumHeight:", self->_minimumHeight);
  -[HKScalarGraphViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKScalarGraphViewController;
  -[HKScalarGraphViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[HKScalarGraphViewController _setupGraphViewSelectionStyle](self, "_setupGraphViewSelectionStyle");
  -[HKScalarGraphViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);
  -[HKGraphViewController graphView](self, "graphView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v4);

  -[HKGraphViewController graphView](self, "graphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKScalarGraphViewController _pinView:toParentView:](self, "_pinView:toParentView:", v5, v3);

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

- (id)_buildGraphViewWithLabelDimension:(id)a3 labelEndings:(int64_t)a4 numericAxisConfigurationOverrides:(id)a5
{
  id v6;
  HKGraphView *v7;
  HKGraphView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HKNumericAxisConfiguration *v17;
  HKNumericAxisConfiguration *v18;
  HKNumericAxis *v19;
  void *v21;
  void *v22;
  id v24;

  v6 = a3;
  v24 = a5;
  v7 = [HKGraphView alloc];
  v8 = -[HKGraphView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", &unk_1E9CED438, &unk_1E9CED448);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:](v8, "setEffectiveAxisRange:effectiveVisibleRangeCadence:effectiveVisibleRangeActive:", v9, v9, v9);
  -[HKGraphView setAxisInset:](v8, "setAxisInset:", 0.0, 0.0, 30.0, 0.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphView setOutlineColor:](v8, "setOutlineColor:", v10);

  -[HKGraphView setOutlineOptions:](v8, "setOutlineOptions:", 5);
  -[HKGraphView setFeatheringOptions:](v8, "setFeatheringOptions:", 15);
  -[HKGraphView setHardLeftMarginWidth:](v8, "setHardLeftMarginWidth:", 16.0);
  v11 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v12, 1.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAxisLineStyle:");
  objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartAxisLabelFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKAxisLabelStyle labelStyleWithColor:font:horizontalAlignment:verticalAlignment:](HKAxisLabelStyle, "labelStyleWithColor:font:horizontalAlignment:verticalAlignment:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLabelStyle:", v13);

  objc_msgSend(v11, "setTickPositions:", 0);
  objc_msgSend(v11, "setAxisLabelPosition:", 1);
  objc_msgSend(v11, "setShowGridLines:", 1);
  objc_msgSend(v11, "setLocation:", 2);
  objc_msgSend(v11, "setFillOuterPadding:", 15.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartAxisMajorGridColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "colorWithAlphaComponent:", 0.5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", v15, 0.5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setDashStyle:", 1);
  objc_msgSend(v11, "setGridLineStyle:", v16);
  v17 = objc_alloc_init(HKNumericAxisConfiguration);
  v18 = v17;
  if (v6)
    -[HKNumericAxisConfiguration setLabelDimension:](v17, "setLabelDimension:", v6);
  -[HKAxisConfiguration setPreferredStyle:](v18, "setPreferredStyle:", v11);
  -[HKNumericAxisConfiguration setBottomVerticalLabelPadding:](v18, "setBottomVerticalLabelPadding:", 0.0);
  -[HKNumericAxisConfiguration setTopVerticalLabelPadding:](v18, "setTopVerticalLabelPadding:", 0.0);
  if (v24)
    -[HKNumericAxisConfiguration applyOverridesFromNumericAxisConfiguration:](v18, "applyOverridesFromNumericAxisConfiguration:", v24);
  v19 = -[HKNumericAxis initWithConfiguration:]([HKNumericAxis alloc], "initWithConfiguration:", v18);
  -[HKAxis setAxisLabelEndings:](v19, "setAxisLabelEndings:", a4);
  -[HKGraphView setXAxis:](v8, "setXAxis:", v19);

  return v8;
}

- (void)_setupGraphViewSelectionStyle
{
  void *v3;
  void *v4;
  void *v5;
  HKGraphViewSelectionStyle *v6;

  v6 = objc_alloc_init(HKGraphViewSelectionStyle);
  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", 0, 2.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewSelectionStyle setSelectedPointLineStrokeStyle:](v6, "setSelectedPointLineStrokeStyle:", v3);

  +[HKStrokeStyle strokeStyleWithColor:lineWidth:](HKStrokeStyle, "strokeStyleWithColor:lineWidth:", 0, HKUIOnePixel());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewSelectionStyle setTouchPointLineStrokeStyle:](v6, "setTouchPointLineStrokeStyle:", v4);

  -[HKGraphViewSelectionStyle setUnselectedSeriesAlpha:](v6, "setUnselectedSeriesAlpha:", 0.2);
  -[HKGraphViewController graphView](self, "graphView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectionStyle:", v6);

}

+ (double)hardLeftMarginWidth
{
  return 16.0;
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

@end
