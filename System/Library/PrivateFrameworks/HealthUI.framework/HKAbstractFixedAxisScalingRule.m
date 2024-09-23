@implementation HKAbstractFixedAxisScalingRule

- (id)yValueRangeForRange:(id)a3 zoomLevel:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSNumber *minimumValue;
  void *v10;
  uint64_t v11;
  NSNumber *maximumValue;
  void *v13;
  uint64_t v14;

  v6 = a3;
  -[HKAbstractFixedAxisScalingRule _valueRangeForZoomLevel:](self, "_valueRangeForZoomLevel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_shouldExpandBoundsForOutliers)
    objc_msgSend(v7, "unionRange:", v6);
  minimumValue = self->_minimumValue;
  if (minimumValue)
  {
    objc_msgSend(v8, "minValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSNumber compare:](minimumValue, "compare:", v10);

    if (v11 == 1)
      objc_msgSend(v8, "setMinValue:", self->_minimumValue);
  }
  maximumValue = self->_maximumValue;
  if (maximumValue)
  {
    objc_msgSend(v8, "maxValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSNumber compare:](maximumValue, "compare:", v13);

    if (v14 == -1)
      objc_msgSend(v8, "setMaxValue:", self->_maximumValue);
  }

  return v8;
}

- (id)_valueRangeForZoomLevel:(int64_t)a3
{
  NSDictionary *axisBoundsOverrides;
  void *v5;
  HKValueRange *v6;
  HKValueRange *defaultAxisBounds;
  HKValueRange *v8;
  void *v9;

  axisBoundsOverrides = self->_axisBoundsOverrides;
  if (!axisBoundsOverrides
    || (objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSDictionary objectForKeyedSubscript:](axisBoundsOverrides, "objectForKeyedSubscript:", v5),
        v6 = (HKValueRange *)objc_claimAutoreleasedReturnValue(),
        v5,
        (defaultAxisBounds = v6) == 0))
  {
    v6 = 0;
    defaultAxisBounds = self->_defaultAxisBounds;
  }
  v8 = defaultAxisBounds;

  v9 = (void *)-[HKValueRange copy](v8, "copy");
  return v9;
}

- (HKAbstractFixedAxisScalingRule)init
{
  HKAbstractFixedAxisScalingRule *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKAbstractFixedAxisScalingRule;
  result = -[HKAbstractFixedAxisScalingRule init](&v3, sel_init);
  if (result)
    result->_shouldExpandBoundsForOutliers = 1;
  return result;
}

- (void)setShouldExpandBoundsForOutliers:(BOOL)a3
{
  self->_shouldExpandBoundsForOutliers = a3;
}

- (id)yAxisBounds
{
  return +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", self->_minimumValue, self->_maximumValue);
}

- (id)noDataStartingRange
{
  return 0;
}

- (BOOL)shouldExpandBoundsForOutliers
{
  return self->_shouldExpandBoundsForOutliers;
}

- (HKValueRange)defaultAxisBounds
{
  return self->_defaultAxisBounds;
}

- (NSDictionary)axisBoundsOverrides
{
  return self->_axisBoundsOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
  objc_storeStrong((id *)&self->_axisBoundsOverrides, 0);
  objc_storeStrong((id *)&self->_defaultAxisBounds, 0);
}

@end
