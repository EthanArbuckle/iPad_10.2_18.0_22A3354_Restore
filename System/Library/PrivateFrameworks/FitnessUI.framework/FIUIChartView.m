@implementation FIUIChartView

- (FIUIChartView)init
{
  return -[FIUIChartView initWithDateInterval:](self, "initWithDateInterval:", 0);
}

- (FIUIChartView)initWithDateInterval:(id)a3
{
  id v5;
  FIUIChartView *v6;
  FIUIChartDataGroup *v7;
  FIUIChartDataGroup *dataGroup;
  NSArray *xAxisLabels;
  NSArray *xAxisSubLabels;
  UIView *v11;
  UIView *containerView;

  v5 = a3;
  v6 = -[FIUIChartView initWithFrame:](self, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  if (v6)
  {
    v7 = objc_alloc_init(FIUIChartDataGroup);
    dataGroup = v6->_dataGroup;
    v6->_dataGroup = v7;

    xAxisLabels = v6->_xAxisLabels;
    v6->_xAxisLabels = (NSArray *)MEMORY[0x24BDBD1A8];

    xAxisSubLabels = v6->_xAxisSubLabels;
    v6->_xAxisSubLabels = 0;

    -[FIUIChartDataGroup setDataSource:](v6->_dataGroup, "setDataSource:", v6);
    objc_storeStrong((id *)&v6->_dateInterval, a3);
    v6->_yAxisEdgeInset = 0.0;
    v6->_labelsInsetChartBackground = 1;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x24BEBDB00]);
    containerView = v6->_containerView;
    v6->_containerView = v11;

    -[UIView setOpaque:](v6->_containerView, "setOpaque:", 0);
    -[FIUIChartView addSubview:](v6, "addSubview:", v6->_containerView);
  }

  return v6;
}

- (void)reloadData
{
  -[FIUIChartDataGroup reloadData](self->_dataGroup, "reloadData");
  -[FIUIChartView _adjustMinMaxValues](self, "_adjustMinMaxValues");
  -[FIUIChartView _updateHighlightedValue](self, "_updateHighlightedValue");
  -[FIUIChartView _reloadDataSeries](self, "_reloadDataSeries");
  -[FIUIChartView _updateDataSeries](self, "_updateDataSeries");
  -[FIUIChartView setNeedsLayout](self, "setNeedsLayout");
}

- (void)selectAxisPoint:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a4;
  if (-[NSArray count](self->_xAxisLabels, "count") > a3)
  {
    -[FIUIChartTimeAxisDescriptor axisLabels](self->_xAxisDescriptor, "axisLabels");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
    v10 = (id)objc_claimAutoreleasedReturnValue();

    -[FIUIChartTimeAxisDescriptor selectLabel:atIndex:](self->_xAxisDescriptor, "selectLabel:atIndex:", v4, a3);
    -[NSArray objectAtIndexedSubscript:](self->_xAxisLabels, "objectAtIndexedSubscript:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "labelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v9);

  }
}

- (void)setDateInterval:(id)a3
{
  FIUIChartTimeAxisDescriptor *xAxisDescriptor;
  void *v6;
  FIUIChartTimeAxisDescriptor *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[NSDateInterval isEqualToDateInterval:](self->_dateInterval, "isEqualToDateInterval:"))
  {
    objc_storeStrong((id *)&self->_dateInterval, a3);
    xAxisDescriptor = self->_xAxisDescriptor;
    objc_msgSend(v9, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIChartTimeAxisDescriptor setMinValue:](xAxisDescriptor, "setMinValue:", v6);

    v7 = self->_xAxisDescriptor;
    objc_msgSend(v9, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIChartTimeAxisDescriptor setMaxValue:](v7, "setMaxValue:", v8);

    -[FIUIChartView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)setXAxisDescriptor:(id)a3
{
  FIUIChartTimeAxisDescriptor **p_xAxisDescriptor;
  id v6;
  FIUIChartTimeAxisDescriptor *v7;
  void *v8;
  FIUIChartTimeAxisDescriptor *v9;
  void *v10;

  p_xAxisDescriptor = &self->_xAxisDescriptor;
  objc_storeStrong((id *)&self->_xAxisDescriptor, a3);
  v6 = a3;
  v7 = *p_xAxisDescriptor;
  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor setMinValue:](v7, "setMinValue:", v8);

  v9 = *p_xAxisDescriptor;
  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor setMaxValue:](v9, "setMaxValue:", v10);

  -[FIUIChartView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setYAxisDescriptor:(id)a3
{
  FIUIChartAxisDescriptor **p_yAxisDescriptor;
  id v6;

  p_yAxisDescriptor = &self->_yAxisDescriptor;
  objc_storeStrong((id *)&self->_yAxisDescriptor, a3);
  v6 = a3;
  -[FIUIChartAxisDescriptor setMinValue:](*p_yAxisDescriptor, "setMinValue:", self->_minYValue);
  -[FIUIChartAxisDescriptor setMaxValue:](*p_yAxisDescriptor, "setMaxValue:", self->_maxYValue);

  -[FIUIChartView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setBackgroundView:(id)a3
{
  FIUIChartBackgroundView *v5;
  FIUIChartBackgroundView *backgroundView;
  FIUIChartBackgroundView *v7;

  v5 = (FIUIChartBackgroundView *)a3;
  backgroundView = self->_backgroundView;
  v7 = v5;
  if (backgroundView != v5)
  {
    -[FIUIChartBackgroundView removeFromSuperview](backgroundView, "removeFromSuperview");
    -[FIUIChartView addSubview:](self, "addSubview:", v7);
    objc_storeStrong((id *)&self->_backgroundView, a3);
  }

}

- (void)_updateBackgroundView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[FIUIChartView bounds](self, "bounds");
  -[FIUIChartView _yAxisLabelPadding](self, "_yAxisLabelPadding");
  -[FIUIChartView _xAxisLabelPaddingForBackground:](self, "_xAxisLabelPaddingForBackground:", 1);
  -[FIUIChartView _yAxisLabelPadding](self, "_yAxisLabelPadding");
  UIRectInset();
  v4 = v3;
  v6 = v5;
  -[FIUIChartBackgroundView sizeThatFits:](self->_backgroundView, "sizeThatFits:", v7, v8);
  -[FIUIChartBackgroundView setFrame:](self->_backgroundView, "setFrame:", v4, v6, v9, v10);
  -[FIUIChartBackgroundView setNeedsDisplay](self->_backgroundView, "setNeedsDisplay");
}

- (void)_reloadDataSeries
{
  unint64_t v3;
  uint64_t i;
  void *v5;
  NSArray *v6;
  NSArray *chartSeries;
  id v8;

  v3 = -[FIUIChartView _numberOfSeries](self, "_numberOfSeries");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    for (i = 0; i != v3; ++i)
    {
      -[FIUIChartView _seriesAtIndex:](self, "_seriesAtIndex:", i);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v8, "addObject:", v5);

    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v8);
  v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
  chartSeries = self->_chartSeries;
  self->_chartSeries = v6;

}

- (void)_updateDataSeries
{
  unint64_t v3;
  void *v4;
  void *v5;

  if (-[NSArray count](self->_chartSeries, "count"))
  {
    v3 = 0;
    do
    {
      -[FIUIChartDataGroup dataSetAtIndex:](self->_dataGroup, "dataSetAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSArray objectAtIndexedSubscript:](self->_chartSeries, "objectAtIndexedSubscript:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setDataSet:", v4);
      objc_msgSend(v5, "setDataSource:", self);

      ++v3;
    }
    while (v3 < -[NSArray count](self->_chartSeries, "count"));
  }
}

- (void)_adjustMinMaxValues
{
  void *v3;
  void *v4;
  id WeakRetained;
  char v6;
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  id v16;
  double v17;
  id v18;
  char v19;
  double v20;
  id v21;
  double v22;
  double v23;
  NSNumber *v24;
  NSNumber *maxYValue;
  float v26;
  id v27;
  char v28;
  id v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  NSNumber *v35;
  NSNumber *minYValue;
  NSNumber *v37;

  -[FIUIChartDataGroup minYValue](self->_dataGroup, "minYValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    goto LABEL_4;
  }
  -[FIUIChartDataGroup maxYValue](self->_dataGroup, "maxYValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_4:
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      v7 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v7, "overrideMinMaxYValueInChart:", self);
      v9 = v8;
      v11 = v10;

LABEL_23:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
      v35 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      minYValue = self->_minYValue;
      self->_minYValue = v35;

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
      v37 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      maxYValue = self->_maxYValue;
      self->_maxYValue = v37;
      goto LABEL_24;
    }
    -[FIUIChartDataGroup minYValue](self->_dataGroup, "minYValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    v9 = v13;

    -[FIUIChartDataGroup maxYValue](self->_dataGroup, "maxYValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "doubleValue");
    v11 = v15;

    if (vabdd_f64(v11, v9) >= 2.22044605e-16)
    {
LABEL_20:
      v27 = objc_loadWeakRetained((id *)&self->_dataSource);
      v28 = objc_opt_respondsToSelector();

      if ((v28 & 1) != 0)
      {
        v29 = objc_loadWeakRetained((id *)&self->_dataSource);
        objc_msgSend(v29, "minimumYRangeForChart:", self);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "doubleValue");
        v32 = v31;

        v33 = v32 - (v11 - v9);
        if (v33 > 2.22044605e-16)
        {
          v34 = v33 * 0.5;
          v9 = v9 - floor(v34);
          v11 = v11 + ceil(v34);
        }
      }
      goto LABEL_23;
    }
    v16 = objc_loadWeakRetained((id *)&self->_dataSource);
    v17 = 0.0;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v18 = objc_loadWeakRetained((id *)&self->_dataSource);
      v19 = objc_opt_respondsToSelector();

      v20 = 0.0;
      if ((v19 & 1) == 0)
      {
LABEL_13:
        if (v17 > 2.22044605e-16 || v20 > 2.22044605e-16)
        {
          if (v9 >= v17)
            v9 = v17;
          -[NSNumber floatValue](self->_maxYValue, "floatValue");
          if (v20 >= v26)
            v11 = v20;
        }
        else
        {
          v11 = v11 + 1.0;
          v9 = v9 + -1.0;
        }
        goto LABEL_20;
      }
      v21 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v21, "defaultOverrideMinYValueInChart:", self);
      v17 = v22;

      v16 = objc_loadWeakRetained((id *)&self->_dataSource);
      objc_msgSend(v16, "defaultOverrideMaxYValueInChart:", self);
      v20 = v23;
    }
    else
    {
      v20 = 0.0;
    }

    goto LABEL_13;
  }
  v24 = self->_minYValue;
  self->_minYValue = 0;

  maxYValue = self->_maxYValue;
  self->_maxYValue = 0;
LABEL_24:

  -[FIUIChartAxisDescriptor setMinValue:](self->_yAxisDescriptor, "setMinValue:", self->_minYValue);
  -[FIUIChartAxisDescriptor setMaxValue:](self->_yAxisDescriptor, "setMaxValue:", self->_maxYValue);
}

- (void)_updateHighlightedValue
{
  FIUIChartDataSource **p_dataSource;
  id WeakRetained;
  char v5;
  FIUIChartAxisDescriptor *yAxisDescriptor;
  void *v7;
  id v8;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    yAxisDescriptor = self->_yAxisDescriptor;
    v8 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v8, "highlightedYValueInChart:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUIChartAxisDescriptor setHighlightedValue:](yAxisDescriptor, "setHighlightedValue:", v7);

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FIUIChartView;
  -[FIUIChartView layoutSubviews](&v3, sel_layoutSubviews);
  -[FIUIChartView _layoutContainerView](self, "_layoutContainerView");
  -[FIUIChartView _layoutChartSeries](self, "_layoutChartSeries");
  -[FIUIChartView _layoutAxisLabels](self, "_layoutAxisLabels");
  -[FIUIChartView _orderSubviews](self, "_orderSubviews");
  -[FIUIChartView _updateBackgroundView](self, "_updateBackgroundView");
}

- (void)_layoutContainerView
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIView *containerView;

  -[FIUIChartView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  -[UIView frame](self->_containerView, "frame");
  if (v4 != v8 || v6 != v7)
  {
    containerView = self->_containerView;
    -[FIUIChartView bounds](self, "bounds");
    -[UIView setFrame:](containerView, "setFrame:");
  }
  -[FIUIChartView bringSubviewToFront:](self, "bringSubviewToFront:", self->_containerView);
}

- (void)_layoutAxisLabels
{
  -[FIUIChartView _layoutXAxisLabels](self, "_layoutXAxisLabels");
  -[FIUIChartView _layoutYAxisLabels](self, "_layoutYAxisLabels");
}

- (void)_layoutYAxisLabels
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  NSArray *v39;
  NSArray *yAxisLabels;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)-[NSArray mutableCopy](self->_yAxisLabels, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartAxisDescriptor axisLabels](self->_yAxisDescriptor, "axisLabels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSNumber doubleValue](self->_minYValue, "doubleValue");
  v42 = v6;
  -[NSNumber doubleValue](self->_maxYValue, "doubleValue");
  v41 = v7;
  if (objc_msgSend(v5, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "hk_dequeue");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      if (!v10)
      {
        v10 = objc_alloc_init(MEMORY[0x24BEBD708]);
        objc_msgSend(v10, "setTextAlignment:", 2);
        -[UIView addSubview:](self->_containerView, "addSubview:", v10);
      }
      -[FIUIChartAxisDescriptor labelFont](self->_yAxisDescriptor, "labelFont");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setFont:", v11);

      objc_msgSend(v9, "text");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setText:", v12);

      objc_msgSend(v9, "labelColor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setTextColor:", v13);

      objc_msgSend(v9, "shadowOffset");
      objc_msgSend(v10, "setShadowOffset:");
      objc_msgSend(v9, "shadowColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShadowColor:", v14);

      objc_msgSend(v9, "shadowBlur");
      objc_msgSend(v10, "setShadowBlur:");
      objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
      objc_msgSend(v10, "setNumberOfLines:", 0);
      objc_msgSend(v10, "sizeToFit");
      -[FIUIChartView _insetChartRect](self, "_insetChartRect");
      v16 = v15;
      v18 = v17;
      v20 = v19;
      v22 = v21;
      objc_msgSend(v10, "intrinsicContentSize");
      v24 = v23;
      v26 = v25;
      -[FIUIChartAxisDescriptor axisDescriptorPadding](self->_yAxisDescriptor, "axisDescriptorPadding");
      objc_msgSend(v9, "location");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "doubleValue");
      v29 = v28;

      v30 = FIUIChartRelativePositionForYPlaneValue(v29, v42, v41);
      FIUIChartAbsolutePositionForYPlaneValue(self, v30, v16, v18, v20, v22);
      if (v8 && v8 != objc_msgSend(v5, "count") - 1 && vabdd_f64(v29, v42) < vabdd_f64(v29, v41))
        objc_msgSend(v10, "_firstBaselineOffsetFromTop");
      UIRoundToViewScale();
      v32 = v31;
      UIRoundToViewScale();
      objc_msgSend(v10, "setFrame:", v32, v33, v24, v26);
      objc_msgSend(v4, "addObject:", v10);

      ++v8;
    }
    while (v8 < objc_msgSend(v5, "count"));
  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v34 = v3;
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v44 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * i), "removeFromSuperview");
      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v36);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);
  v39 = (NSArray *)objc_claimAutoreleasedReturnValue();
  yAxisLabels = self->_yAxisLabels;
  self->_yAxisLabels = v39;

}

- (void)_layoutXAxisLabels
{
  FIUIChartView *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t i;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  NSArray *xAxisLabels;
  NSArray *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t n;
  NSArray *xAxisSubLabels;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  CGFloat v72;
  CGFloat v73;
  CGFloat v74;
  CGFloat v75;
  CGFloat v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t m;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  FIUIChartView *v85;
  id obj;
  uint64_t v87;
  void *v88;
  void *v89;
  uint64_t v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  _BYTE v112[128];
  _BYTE v113[128];
  _BYTE v114[128];
  _BYTE v115[128];
  _BYTE v116[128];
  uint64_t v117;
  CGRect v118;
  CGRect v119;
  CGRect v120;
  CGRect v121;
  CGRect v122;
  CGRect v123;
  CGRect v124;

  v2 = self;
  v117 = *MEMORY[0x24BDAC8D0];
  v88 = (void *)-[NSArray mutableCopy](self->_xAxisLabels, "mutableCopy");
  -[FIUIChartTimeAxisDescriptor axisLabels](v2->_xAxisDescriptor, "axisLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor axisSubLabels](v2->_xAxisDescriptor, "axisSubLabels");
  v82 = v3;
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reverseObjectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  -[FIUIChartTimeAxisDescriptor labelFont](v2->_xAxisDescriptor, "labelFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lineHeight");

  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  obj = v4;
  v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
  if (v90)
  {
    v87 = *(_QWORD *)v109;
    v84 = *MEMORY[0x24BEBB360];
    v85 = v2;
    do
    {
      for (i = 0; i != v90; ++i)
      {
        if (*(_QWORD *)v109 != v87)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
        objc_msgSend(v88, "lastObject");
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v88, "removeLastObject");
        if (!v8)
        {
          v8 = objc_alloc_init(MEMORY[0x24BEBD708]);
          objc_msgSend(v8, "setTextAlignment:", 1);
          -[UIView addSubview:](v2->_containerView, "addSubview:", v8);
        }
        -[FIUIChartTimeAxisDescriptor labelFont](v2->_xAxisDescriptor, "labelFont");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setFont:", v9);

        objc_msgSend(v7, "text");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setText:", v10);

        objc_msgSend(v7, "labelColor");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setTextColor:", v11);

        objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
        objc_msgSend(v8, "setNumberOfLines:", 0);
        objc_msgSend(v8, "sizeToFit");
        -[FIUIChartTimeAxisDescriptor labelAMPMFont](v2->_xAxisDescriptor, "labelAMPMFont");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = objc_alloc_init(MEMORY[0x24BDD1500]);
          objc_msgSend(v7, "text");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "AMSymbol");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "rangeOfString:", v15);
          v18 = v17;

          if (v16 == 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(v7, "text");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "PMSymbol");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v19, "rangeOfString:", v20);
            v18 = v21;

            v2 = v85;
            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
              goto LABEL_14;
          }
          else
          {
            v2 = v85;
          }
          objc_msgSend(v8, "attributedText");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = (void *)objc_msgSend(v22, "mutableCopy");

          objc_msgSend(v23, "addAttribute:value:range:", v84, v12, v16, v18);
          objc_msgSend(v8, "setAttributedText:", v23);

LABEL_14:
        }
        objc_msgSend(v8, "intrinsicContentSize");
        objc_msgSend(v7, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[FIUIChartView _absolutePositionForXPlaneValue:](v2, "_absolutePositionForXPlaneValue:", v24);

        objc_msgSend(v7, "useReversePlacement");
        -[FIUIChartTimeAxisDescriptor axisDescriptorPadding](v2->_xAxisDescriptor, "axisDescriptorPadding");
        if (v2->_xAxisLabelsShouldBaselineAlign)
        {
          -[UIView bounds](v2->_containerView, "bounds");
          CGRectGetMaxY(v118);
          objc_msgSend(v8, "_firstBaselineOffsetFromTop");
        }
        else
        {
          objc_msgSend(v83, "count");
          -[UIView bounds](v2->_containerView, "bounds");
          CGRectGetMaxY(v119);
          -[FIUIChartView _xAxisLabelPaddingForBackground:](v2, "_xAxisLabelPaddingForBackground:", 0);
          UIRoundToViewScale();
          UIRoundToViewScale();
        }
        UIRoundToViewScale();
        objc_msgSend(v8, "setFrame:");
        if (-[FIUIChartTimeAxisDescriptor hideClippedLabels](v2->_xAxisDescriptor, "hideClippedLabels"))
        {
          objc_msgSend(v8, "frame");
          v26 = v25;
          objc_msgSend(v8, "frame");
          v28 = v27;
          objc_msgSend(v8, "frame");
          v30 = v29;
          -[FIUIChartView bounds](v2, "bounds");
          v123.size.height = 2.22507386e-308;
          v123.origin.x = v26;
          v123.origin.y = v28;
          v123.size.width = v30;
          objc_msgSend(v8, "setHidden:", !CGRectContainsRect(v120, v123));
        }
        objc_msgSend(v89, "insertObject:atIndex:", v8, 0);

      }
      v90 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v108, v116, 16);
    }
    while (v90);
  }

  v106 = 0u;
  v107 = 0u;
  v104 = 0u;
  v105 = 0u;
  v31 = v88;
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v105;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v105 != v34)
          objc_enumerationMutation(v31);
        objc_msgSend(*(id *)(*((_QWORD *)&v104 + 1) + 8 * j), "removeFromSuperview");
      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v104, v115, 16);
    }
    while (v33);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v89);
  v36 = objc_claimAutoreleasedReturnValue();
  xAxisLabels = v2->_xAxisLabels;
  v2->_xAxisLabels = (NSArray *)v36;

  if (objc_msgSend(v83, "count"))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v91 = -[FIUIChartTimeAxisDescriptor subLabelAlignment](v2->_xAxisDescriptor, "subLabelAlignment");
    else
      v91 = 0;
    v45 = (void *)-[NSArray mutableCopy](v2->_xAxisSubLabels, "mutableCopy");

    objc_msgSend(v83, "reverseObjectEnumerator");
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    obj = v46;
    v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v101;
      do
      {
        for (k = 0; k != v48; ++k)
        {
          if (*(_QWORD *)v101 != v49)
            objc_enumerationMutation(obj);
          v51 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * k);
          objc_msgSend(v45, "lastObject");
          v52 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v45, "removeLastObject");
          if (!v52)
          {
            v52 = objc_alloc_init(MEMORY[0x24BEBD708]);
            objc_msgSend(v52, "setTextAlignment:", 1);
            -[UIView addSubview:](v2->_containerView, "addSubview:", v52);
          }
          -[FIUIChartTimeAxisDescriptor subLabelFont](v2->_xAxisDescriptor, "subLabelFont");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setFont:", v53);

          objc_msgSend(v51, "text");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setText:", v54);

          objc_msgSend(v51, "labelColor");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "setTextColor:", v55);

          objc_msgSend(v51, "location");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          -[FIUIChartView _absolutePositionForXPlaneValue:](v2, "_absolutePositionForXPlaneValue:", v56);

          -[UIView bounds](v2->_containerView, "bounds");
          CGRectGetMaxY(v121);
          -[FIUIChartView _xAxisLabelPaddingForBackground:](v2, "_xAxisLabelPaddingForBackground:", 0);
          UIRoundToViewScale();
          objc_msgSend(v52, "intrinsicContentSize");
          v58 = v57;
          v60 = v59;
          -[FIUIChartTimeAxisDescriptor subAxisDescriptorPadding](v2->_xAxisDescriptor, "subAxisDescriptorPadding");
          if (v61 > 0.00000011920929)
          {
            if (!v91)
              objc_msgSend(v52, "intrinsicContentSize");
            -[FIUIChartTimeAxisDescriptor subAxisDescriptorPadding](v2->_xAxisDescriptor, "subAxisDescriptorPadding");
          }
          UIRoundToViewScale();
          v63 = v62;
          -[FIUIChartTimeAxisDescriptor subAxisVerticalPadding](v2->_xAxisDescriptor, "subAxisVerticalPadding");
          UIRoundToViewScale();
          objc_msgSend(v52, "setFrame:", v63, v64, v58, v60);
          if (-[FIUIChartTimeAxisDescriptor hideClippedLabels](v2->_xAxisDescriptor, "hideClippedLabels"))
          {
            -[FIUIChartView bounds](v2, "bounds");
            v66 = v65;
            v68 = v67;
            v70 = v69;
            v72 = v71;
            objc_msgSend(v52, "frame");
            v124.origin.x = v73;
            v124.origin.y = v74;
            v124.size.width = v75;
            v124.size.height = v76;
            v122.origin.x = v66;
            v122.origin.y = v68;
            v122.size.width = v70;
            v122.size.height = v72;
            objc_msgSend(v52, "setHidden:", !CGRectContainsRect(v122, v124));
          }
          objc_msgSend(v44, "insertObject:atIndex:", v52, 0);

        }
        v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v114, 16);
      }
      while (v48);
    }

    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    v31 = v45;
    v77 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
    if (v77)
    {
      v78 = v77;
      v79 = *(_QWORD *)v97;
      do
      {
        for (m = 0; m != v78; ++m)
        {
          if (*(_QWORD *)v97 != v79)
            objc_enumerationMutation(v31);
          objc_msgSend(*(id *)(*((_QWORD *)&v96 + 1) + 8 * m), "removeFromSuperview");
        }
        v78 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v96, v113, 16);
      }
      while (v78);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v44);
    v81 = objc_claimAutoreleasedReturnValue();
    xAxisSubLabels = v2->_xAxisSubLabels;
    v2->_xAxisSubLabels = (NSArray *)v81;
  }
  else
  {
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v38 = v2->_xAxisSubLabels;
    v39 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v93;
      do
      {
        for (n = 0; n != v40; ++n)
        {
          if (*(_QWORD *)v93 != v41)
            objc_enumerationMutation(v38);
          objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * n), "removeFromSuperview");
        }
        v40 = -[NSArray countByEnumeratingWithState:objects:count:](v38, "countByEnumeratingWithState:objects:count:", &v92, v112, 16);
      }
      while (v40);
    }

    xAxisSubLabels = v2->_xAxisSubLabels;
    v2->_xAxisSubLabels = 0;
    v44 = v89;
  }

}

- (void)_layoutChartSeries
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double top;
  double left;
  double right;
  double bottom;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  UIView *v24;
  UIView *containerView;
  NSArray *obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[FIUIChartView _chartRect](self, "_chartRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  top = self->_contentBufferEdgeInsets.top;
  left = self->_contentBufferEdgeInsets.left;
  bottom = self->_contentBufferEdgeInsets.bottom;
  right = self->_contentBufferEdgeInsets.right;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  obj = self->_chartSeries;
  v15 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = v10 - (top + bottom);
    v18 = v8 - (left + right);
    v19 = v6 + top;
    v20 = v4 + left;
    v21 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v23, "setFrame:", v20, v19, v18, v17);
        objc_msgSend(v23, "superview");
        v24 = (UIView *)objc_claimAutoreleasedReturnValue();
        containerView = self->_containerView;

        if (v24 != containerView)
        {
          UIEdgeInsetsSubtract();
          objc_msgSend(v23, "setEdgeInsets:");
          -[UIView addSubview:](self->_containerView, "addSubview:", v23);
        }
        objc_msgSend(v23, "setNeedsLayout");
      }
      v16 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v16);
  }

}

- (void)_orderSubviews
{
  NSArray *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  int v10;
  UIView *containerView;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_chartSeries;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "displayAboveAxisLabels", (_QWORD)v12);
        containerView = self->_containerView;
        if (v10)
          -[UIView bringSubviewToFront:](containerView, "bringSubviewToFront:", v9);
        else
          -[UIView insertSubview:atIndex:](containerView, "insertSubview:atIndex:", v9, v6++);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

}

- (double)_xAxisLabelPaddingForBackground:(BOOL)a3
{
  void *v4;
  double result;

  if (self->_labelsInsetChartBackground || !a3)
  {
    -[FIUIChartTimeAxisDescriptor labelFont](self->_xAxisDescriptor, "labelFont", a3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lineHeight");

    -[FIUIChartTimeAxisDescriptor subAxisSpacing](self->_xAxisDescriptor, "subAxisSpacing");
  }
  UIRoundToViewScale();
  return result;
}

- (double)_yAxisLabelPadding
{
  return self->_yAxisEdgeInset;
}

- (CGRect)_chartRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[UIView frame](self->_containerView, "frame");
  -[FIUIChartView _yAxisLabelPadding](self, "_yAxisLabelPadding");
  -[FIUIChartView _xAxisLabelPaddingForBackground:](self, "_xAxisLabelPaddingForBackground:", 0);
  -[FIUIChartView _yAxisLabelPadding](self, "_yAxisLabelPadding");
  UIRectInset();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)_insetChartRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGRect result;

  -[FIUIChartView _chartRect](self, "_chartRect");
  top = self->_seriesEdgeInsets.top;
  left = self->_seriesEdgeInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_seriesEdgeInsets.right);
  v12 = v11 - (top + self->_seriesEdgeInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (double)_absolutePositionForXPlaneValue:(id)a3
{
  float v4;
  double v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;

  -[FIUIChartView _relativePositionForXPlaneValue:](self, "_relativePositionForXPlaneValue:", a3);
  v5 = v4;
  -[FIUIChartView _insetChartRect](self, "_insetChartRect");
  return FIUIChartAbsolutePositionForXPlaneValue(self, v5, v6, v7, v8, v9);
}

- (float)_relativePositionForXPlaneValue:(id)a3
{
  NSDateInterval *dateInterval;
  id v5;
  void *v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  dateInterval = self->_dateInterval;
  v5 = a3;
  -[NSDateInterval startDate](dateInterval, "startDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = ((double (*)(void))FIUIChartXAxisFloatValue)();

  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = ((double (*)(void))FIUIChartXAxisFloatValue)();

  v10 = FIUIChartXAxisFloatValue(v5);
  return FIUIChartRelativePositionForXPlaneValue(v10, v7, v9);
}

- (unint64_t)_numberOfSeries
{
  id WeakRetained;
  unint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v4 = objc_msgSend(WeakRetained, "numberOfSeriesInChart:", self);

  return v4;
}

- (id)_seriesAtIndex:(unint64_t)a3
{
  id WeakRetained;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "chart:seriesAtIndex:", self, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_numberOfDataPointsForSeriesAtIndex:(unint64_t)a3
{
  id WeakRetained;
  unint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v6 = objc_msgSend(WeakRetained, "chart:numberOfDataPointsForSeriesAtIndex:", self, a3);

  return v6;
}

- (id)_dataPointAtIndex:(unint64_t)a3 forSeriesAtIndex:(unint64_t)a4
{
  id WeakRetained;
  void *v8;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "chart:dataPointAtIndex:forSeriesAtIndex:", self, a3, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_dataPointsForSeriesAtIndex:(unint64_t)a3
{
  FIUIChartDataSource **p_dataSource;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v8, "chart:dataPointsForSeriesAtIndex:", self, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_labelsForSeriesAtIndex:(unint64_t)a3
{
  FIUIChartDataSource **p_dataSource;
  id WeakRetained;
  char v7;
  id v8;
  void *v9;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v8, "chart:labelsForSeriesAtIndex:", self, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (unint64_t)dataGroup:(id)a3 numberOfPointsInSetAtIndex:(unint64_t)a4
{
  return -[FIUIChartView _numberOfDataPointsForSeriesAtIndex:](self, "_numberOfDataPointsForSeriesAtIndex:", a4);
}

- (id)dataGroup:(id)a3 pointForSetAtIndex:(unint64_t)a4 pointIndex:(unint64_t)a5
{
  return -[FIUIChartView _dataPointAtIndex:forSeriesAtIndex:](self, "_dataPointAtIndex:forSeriesAtIndex:", a5, a4);
}

- (id)dataGroup:(id)a3 dataPointsForSetAtIndex:(unint64_t)a4
{
  return -[FIUIChartView _dataPointsForSeriesAtIndex:](self, "_dataPointsForSeriesAtIndex:", a4);
}

- (id)dataGroup:(id)a3 labelsForSetAtIndex:(unint64_t)a4
{
  return -[FIUIChartView _labelsForSeriesAtIndex:](self, "_labelsForSeriesAtIndex:", a4);
}

- (id)minXValueForChartSeries:(id)a3
{
  return -[NSDateInterval startDate](self->_dateInterval, "startDate", a3);
}

- (id)maxXValueForChartSeries:(id)a3
{
  return -[NSDateInterval endDate](self->_dateInterval, "endDate", a3);
}

- (id)minYValueForChartSeries:(id)a3
{
  return self->_minYValue;
}

- (id)maxYValueForChartSeries:(id)a3
{
  return self->_maxYValue;
}

- (FIUIChartDataSource)dataSource
{
  return (FIUIChartDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (FIUIChartTimeAxisDescriptor)xAxisDescriptor
{
  return self->_xAxisDescriptor;
}

- (FIUIChartAxisDescriptor)yAxisDescriptor
{
  return self->_yAxisDescriptor;
}

- (FIUIChartBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (double)yAxisEdgeInset
{
  return self->_yAxisEdgeInset;
}

- (void)setYAxisEdgeInset:(double)a3
{
  self->_yAxisEdgeInset = a3;
}

- (double)xAxisToLabelPadding
{
  return self->_xAxisToLabelPadding;
}

- (void)setXAxisToLabelPadding:(double)a3
{
  self->_xAxisToLabelPadding = a3;
}

- (BOOL)labelsInsetChartBackground
{
  return self->_labelsInsetChartBackground;
}

- (void)setLabelsInsetChartBackground:(BOOL)a3
{
  self->_labelsInsetChartBackground = a3;
}

- (BOOL)xAxisLabelsShouldBaselineAlign
{
  return self->_xAxisLabelsShouldBaselineAlign;
}

- (void)setXAxisLabelsShouldBaselineAlign:(BOOL)a3
{
  self->_xAxisLabelsShouldBaselineAlign = a3;
}

- (UIEdgeInsets)seriesEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_seriesEdgeInsets.top;
  left = self->_seriesEdgeInsets.left;
  bottom = self->_seriesEdgeInsets.bottom;
  right = self->_seriesEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setSeriesEdgeInsets:(UIEdgeInsets)a3
{
  self->_seriesEdgeInsets = a3;
}

- (UIEdgeInsets)contentBufferEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentBufferEdgeInsets.top;
  left = self->_contentBufferEdgeInsets.left;
  bottom = self->_contentBufferEdgeInsets.bottom;
  right = self->_contentBufferEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentBufferEdgeInsets:(UIEdgeInsets)a3
{
  self->_contentBufferEdgeInsets = a3;
}

- (double)animationDuration
{
  return self->_animationDuration;
}

- (void)setAnimationDuration:(double)a3
{
  self->_animationDuration = a3;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSNumber)minYValue
{
  return self->_minYValue;
}

- (void)setMinYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (NSNumber)maxYValue
{
  return self->_maxYValue;
}

- (void)setMaxYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 544);
}

- (NSNumber)highlightedYValue
{
  return self->_highlightedYValue;
}

- (void)setHighlightedYValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 552);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightedYValue, 0);
  objc_storeStrong((id *)&self->_maxYValue, 0);
  objc_storeStrong((id *)&self->_minYValue, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_yAxisDescriptor, 0);
  objc_storeStrong((id *)&self->_xAxisDescriptor, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_chartSeries, 0);
  objc_storeStrong((id *)&self->_yAxisLabels, 0);
  objc_storeStrong((id *)&self->_xAxisSubLabels, 0);
  objc_storeStrong((id *)&self->_xAxisLabels, 0);
  objc_storeStrong((id *)&self->_dataGroup, 0);
}

@end
