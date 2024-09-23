@implementation HKGraphViewPointSelectionContext

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HKGraphViewPointSelectionContext;
  -[HKGraphViewPointSelectionContext debugDescription](&v15, sel_debugDescription);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKGraphViewPointSelectionContext selectedSeries](self, "selectedSeries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" {\n    selectedSeries:          %@\n"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphViewPointSelectionContext selectedRangeXValues](self, "selectedRangeXValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR("    selectedRangeXValues:    %@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphViewPointSelectionContext selectedPathIndexRange](self, "selectedPathIndexRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("    selectedPathIndexRange:  %@\n"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphViewPointSelectionContext selectedPointValueRange](self, "selectedPointValueRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingFormat:", CFSTR("    selectedPointValueRange: %@\n"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKGraphViewPointSelectionContext pointIntervalComponents](self, "pointIntervalComponents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("    pointIntervalComponents: %@\n}"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (HKGraphSeries)selectedSeries
{
  return self->_selectedSeries;
}

- (void)setSelectedSeries:(id)a3
{
  objc_storeStrong((id *)&self->_selectedSeries, a3);
}

- (HKValueRange)selectedRangeXValues
{
  return self->_selectedRangeXValues;
}

- (void)setSelectedRangeXValues:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRangeXValues, a3);
}

- (HKValueRange)selectedPathIndexRange
{
  return self->_selectedPathIndexRange;
}

- (void)setSelectedPathIndexRange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPathIndexRange, a3);
}

- (HKValueRange)selectedPointValueRange
{
  return self->_selectedPointValueRange;
}

- (void)setSelectedPointValueRange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedPointValueRange, a3);
}

- (NSDateComponents)pointIntervalComponents
{
  return self->_pointIntervalComponents;
}

- (void)setPointIntervalComponents:(id)a3
{
  objc_storeStrong((id *)&self->_pointIntervalComponents, a3);
}

- (NSArray)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (double)xDistanceFromFirstTouchPoint
{
  return self->_xDistanceFromFirstTouchPoint;
}

- (void)setXDistanceFromFirstTouchPoint:(double)a3
{
  self->_xDistanceFromFirstTouchPoint = a3;
}

- (double)xDistanceFromSecondTouchPoint
{
  return self->_xDistanceFromSecondTouchPoint;
}

- (void)setXDistanceFromSecondTouchPoint:(double)a3
{
  self->_xDistanceFromSecondTouchPoint = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_pointIntervalComponents, 0);
  objc_storeStrong((id *)&self->_selectedPointValueRange, 0);
  objc_storeStrong((id *)&self->_selectedPathIndexRange, 0);
  objc_storeStrong((id *)&self->_selectedRangeXValues, 0);
  objc_storeStrong((id *)&self->_selectedSeries, 0);
}

@end
