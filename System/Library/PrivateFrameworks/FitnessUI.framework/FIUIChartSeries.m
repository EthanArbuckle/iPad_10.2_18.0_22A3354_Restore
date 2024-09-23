@implementation FIUIChartSeries

- (FIUIChartSeries)init
{
  char *v2;
  FIUIChartSeries *v3;
  __int128 v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FIUIChartSeries;
  v2 = -[FIUIChartSeries init](&v8, sel_init);
  v3 = (FIUIChartSeries *)v2;
  if (v2)
  {
    v4 = *(_OWORD *)(MEMORY[0x24BEBE158] + 16);
    *(_OWORD *)(v2 + 472) = *MEMORY[0x24BEBE158];
    *(_OWORD *)(v2 + 488) = v4;
    objc_msgSend(v2, "setBackgroundColor:", 0);
    -[FIUIChartSeries setOpaque:](v3, "setOpaque:", 0);
    -[FIUIChartSeries layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "scale");
    objc_msgSend(v5, "setContentsScale:");

  }
  return v3;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FIUIChartSeries;
  -[FIUIChartSeries layoutSubviews](&v3, sel_layoutSubviews);
  -[FIUIChartSeries _reloadMinMaxValues](self, "_reloadMinMaxValues");
}

- (id)labelsFromDataSet
{
  return -[FIUIChartDataSet labelsForSet](self->_dataSet, "labelsForSet");
}

- (void)_reloadMinMaxValues
{
  FIUIChartSeriesDataSource **p_dataSource;
  id WeakRetained;
  NSDate *v5;
  NSDate *minXValue;
  id v7;
  NSDate *v8;
  NSDate *maxXValue;
  id v10;
  NSNumber *v11;
  NSNumber *minYValue;
  NSNumber *v13;
  NSNumber *maxYValue;
  id v15;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  objc_msgSend(WeakRetained, "minXValueForChartSeries:", self);
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  minXValue = self->_minXValue;
  self->_minXValue = v5;

  v7 = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v7, "maxXValueForChartSeries:", self);
  v8 = (NSDate *)objc_claimAutoreleasedReturnValue();
  maxXValue = self->_maxXValue;
  self->_maxXValue = v8;

  v10 = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v10, "minYValueForChartSeries:", self);
  v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  minYValue = self->_minYValue;
  self->_minYValue = v11;

  v15 = objc_loadWeakRetained((id *)p_dataSource);
  objc_msgSend(v15, "maxYValueForChartSeries:", self);
  v13 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  maxYValue = self->_maxYValue;
  self->_maxYValue = v13;

}

- (float)_relativePositionForXPlaneValue:(id)a3
{
  NSDate *minXValue;
  id v5;
  double v6;
  double v7;
  double v8;

  minXValue = self->_minXValue;
  v5 = a3;
  v6 = FIUIChartXAxisFloatValue(minXValue);
  v7 = FIUIChartXAxisFloatValue(self->_maxXValue);
  v8 = FIUIChartXAxisFloatValue(v5);

  return FIUIChartRelativePositionForXPlaneValue(v8, v6, v7);
}

- (float)_relativePositionForYPlaneValue:(id)a3
{
  NSNumber *minYValue;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  minYValue = self->_minYValue;
  v5 = a3;
  -[NSNumber doubleValue](minYValue, "doubleValue");
  v7 = v6;
  -[NSNumber doubleValue](self->_maxYValue, "doubleValue");
  v9 = v8;
  objc_msgSend(v5, "doubleValue");
  v11 = v10;

  return FIUIChartRelativePositionForYPlaneValue(v11, v7, v9);
}

- (double)xValueForPointFromChartPoint:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;

  objc_msgSend(a3, "xValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = FIUIChartXAxisFloatValue(v4);

  v6 = FIUIChartXAxisFloatValue(self->_minXValue);
  v7 = FIUIChartXAxisFloatValue(self->_maxXValue);
  v8 = FIUIChartRelativePositionForXPlaneValue(v5, v6, v7);
  -[FIUIChartSeries insetBounds](self, "insetBounds");
  return FIUIChartAbsolutePositionForXPlaneValue(self, v8, v9, v10, v11, v12);
}

- (double)yValueForPointFromChartPointValue:(id)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;

  objc_msgSend(a3, "doubleValue");
  v5 = v4;
  -[FIUIChartSeries minYValue](self, "minYValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValue");
  v8 = v7;

  -[FIUIChartSeries maxYValue](self, "maxYValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = v10;

  v12 = FIUIChartRelativePositionForYPlaneValue(v5, v8, v11);
  -[FIUIChartSeries insetBounds](self, "insetBounds");
  return FIUIChartAbsolutePositionForYPlaneValue(self, v12, v13, v14, v15, v16);
}

- (CGRect)insetBounds
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

  -[FIUIChartSeries bounds](self, "bounds");
  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_edgeInsets.right);
  v12 = v11 - (top + self->_edgeInsets.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (NSNumber)minYValue
{
  return self->_minYValue;
}

- (void)setMinYValue:(id)a3
{
  objc_storeStrong((id *)&self->_minYValue, a3);
}

- (NSNumber)maxYValue
{
  return self->_maxYValue;
}

- (void)setMaxYValue:(id)a3
{
  objc_storeStrong((id *)&self->_maxYValue, a3);
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (FIUIChartSeriesDataSource)dataSource
{
  return (FIUIChartSeriesDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (FIUIChartDataSet)dataSet
{
  return self->_dataSet;
}

- (void)setDataSet:(id)a3
{
  objc_storeStrong((id *)&self->_dataSet, a3);
}

- (BOOL)displayAboveAxisLabels
{
  return self->_displayAboveAxisLabels;
}

- (void)setDisplayAboveAxisLabels:(BOOL)a3
{
  self->_displayAboveAxisLabels = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_maxYValue, 0);
  objc_storeStrong((id *)&self->_minYValue, 0);
  objc_storeStrong((id *)&self->_maxXValue, 0);
  objc_storeStrong((id *)&self->_minXValue, 0);
}

@end
