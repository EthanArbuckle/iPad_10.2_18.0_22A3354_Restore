@implementation HKAbstractMinimumRangeScalingRule

- (void)setAxisBounds:(id)a3
{
  objc_storeStrong((id *)&self->_axisBounds, a3);
}

- (HKAbstractMinimumRangeScalingRule)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKAbstractMinimumRangeScalingRule;
  return -[HKAbstractMinimumRangeScalingRule init](&v3, sel_init);
}

- (id)yValueRangeForRange:(id)a3 zoomLevel:(int64_t)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  NSNumber *anchorValue;
  double v16;
  double v17;
  HKValueRange *axisBounds;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;

  v6 = a3;
  objc_msgSend(v6, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  objc_msgSend(v6, "maxValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "doubleValue");
  v12 = v11;

  -[HKAbstractMinimumRangeScalingRule _rangeForZoomLevel:](self, "_rangeForZoomLevel:", a4);
  v14 = v13;
  anchorValue = self->_anchorValue;
  if (anchorValue)
  {
    -[NSNumber doubleValue](anchorValue, "doubleValue");
    v17 = v12 - v16;
    if (v12 - v16 < v16 - v9)
      v17 = v16 - v9;
    if (v17 < 0.0)
      v17 = 0.0;
    v9 = v16 - v17;
    v12 = v16 + v17;
  }
  axisBounds = self->_axisBounds;
  if (axisBounds)
  {
    -[HKValueRange minValue](axisBounds, "minValue");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKValueRange maxValue](self->_axisBounds, "maxValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      if (v9 < v21)
        v9 = v21;
    }
    if (v20)
    {
      objc_msgSend(v20, "doubleValue");
      if (v12 >= v22)
        v12 = v22;
    }
  }
  else
  {
    v20 = 0;
    v19 = 0;
  }
  if (v12 - v9 < v14)
  {
    v23 = (v14 - (v12 - v9)) * 0.5;
    v9 = v9 - v23;
    v12 = v12 + v23;
    if (v19)
    {
      objc_msgSend(v19, "doubleValue");
      if (v9 < v24)
      {
        objc_msgSend(v19, "doubleValue");
        v26 = vabdd_f64(v9, v25);
        v9 = v9 + v26;
        v12 = v12 + v26;
      }
    }
    if (v20)
    {
      objc_msgSend(v20, "doubleValue");
      if (v12 > v27)
      {
        objc_msgSend(v20, "doubleValue");
        v29 = vabdd_f64(v12, v28);
        v9 = v9 - v29;
        v12 = v12 - v29;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v12);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  return v32;
}

- (id)yAxisBounds
{
  return self->_axisBounds;
}

- (id)noDataStartingRange
{
  return 0;
}

- (double)_rangeForZoomLevel:(int64_t)a3
{
  NSDictionary *axisRangeOverrides;
  void *v5;
  void *v6;
  double v7;
  double defaultYAxisRange;

  axisRangeOverrides = self->_axisRangeOverrides;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](axisRangeOverrides, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    defaultYAxisRange = v7;
  }
  else
  {
    defaultYAxisRange = self->_defaultYAxisRange;
  }

  return defaultYAxisRange;
}

- (double)defaultYAxisRange
{
  return self->_defaultYAxisRange;
}

- (HKValueRange)axisBounds
{
  return self->_axisBounds;
}

- (NSNumber)anchorValue
{
  return self->_anchorValue;
}

- (NSDictionary)axisRangeOverrides
{
  return self->_axisRangeOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_axisBounds, 0);
  objc_storeStrong((id *)&self->_anchorValue, 0);
  objc_storeStrong((id *)&self->_axisRangeOverrides, 0);
}

@end
