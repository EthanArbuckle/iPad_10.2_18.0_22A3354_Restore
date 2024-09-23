@implementation HKFixedValueDateSpanChartPoint

- (HKFixedValueDateSpanChartPoint)initWithTrendSpan:(id)a3 styleIdentifier:(int64_t)a4 localizableTrendDescription:(id)a5 fixedValueScalingBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  HKFixedValueDateSpanChartPoint *v13;
  void *v14;
  uint64_t v15;
  NSDate *xStart;
  void *v17;
  uint64_t v18;
  NSDate *xEnd;
  uint64_t v20;
  HKQuantity *averageValue;
  void *v22;
  id fixedValueScalingBlock;
  objc_super v25;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)HKFixedValueDateSpanChartPoint;
  v13 = -[HKFixedValueDateSpanChartPoint init](&v25, sel_init);
  if (v13)
  {
    objc_msgSend(v10, "trendDateInterval");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "startDate");
    v15 = objc_claimAutoreleasedReturnValue();
    xStart = v13->_xStart;
    v13->_xStart = (NSDate *)v15;

    objc_msgSend(v10, "trendDateInterval");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "endDate");
    v18 = objc_claimAutoreleasedReturnValue();
    xEnd = v13->_xEnd;
    v13->_xEnd = (NSDate *)v18;

    objc_msgSend(v10, "trendAverage");
    v20 = objc_claimAutoreleasedReturnValue();
    averageValue = v13->_averageValue;
    v13->_averageValue = (HKQuantity *)v20;

    v13->_styleIdentifier = a4;
    objc_storeStrong((id *)&v13->_localizableTrendDescription, a5);
    v22 = _Block_copy(v12);
    fixedValueScalingBlock = v13->_fixedValueScalingBlock;
    v13->_fixedValueScalingBlock = v22;

  }
  return v13;
}

- (id)_buildSinglePointData
{
  HKInteractiveChartSinglePointData *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(HKInteractiveChartSinglePointData);
  -[HKFixedValueDateSpanChartPoint preferredUnit](self, "preferredUnit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HKFixedValueDateSpanChartPoint preferredUnit](self, "preferredUnit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKFixedValueDateSpanChartPoint averageValue](self, "averageValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_unit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HKFixedValueDateSpanChartPoint averageValue](self, "averageValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValueForUnit:", v5);
  -[HKInteractiveChartSinglePointData setValue:](v3, "setValue:");

  -[HKInteractiveChartSinglePointData setUnit:](v3, "setUnit:", v5);
  -[HKInteractiveChartSinglePointData setRepresentsRange:](v3, "setRepresentsRange:", 0);

  return v3;
}

- (id)xValueAsGenericType
{
  void *v3;
  void *v4;
  void *v5;

  -[HKFixedValueDateSpanChartPoint xStart](self, "xStart");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFixedValueDateSpanChartPoint xEnd](self, "xEnd");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HKDateMidpoint(v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)yValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD);
  uint64_t v12;

  -[HKFixedValueDateSpanChartPoint preferredUnit](self, "preferredUnit");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HKFixedValueDateSpanChartPoint preferredUnit](self, "preferredUnit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[HKFixedValueDateSpanChartPoint averageValue](self, "averageValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_unit");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[HKFixedValueDateSpanChartPoint averageValue](self, "averageValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "doubleValueForUnit:", v4);
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKFixedValueDateSpanChartPoint fixedValueScalingBlock](self, "fixedValueScalingBlock");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[HKFixedValueDateSpanChartPoint fixedValueScalingBlock](self, "fixedValueScalingBlock");
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v11)[2](v11, v9);
    v12 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v12;
  }

  return v9;
}

- (id)allYValues
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  -[HKFixedValueDateSpanChartPoint yValue](self, "yValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDate)xStart
{
  return self->_xStart;
}

- (NSDate)xEnd
{
  return self->_xEnd;
}

- (HKQuantity)averageValue
{
  return self->_averageValue;
}

- (NSString)localizableTrendDescription
{
  return self->_localizableTrendDescription;
}

- (int64_t)styleIdentifier
{
  return self->_styleIdentifier;
}

- (HKUnit)preferredUnit
{
  return self->_preferredUnit;
}

- (void)setPreferredUnit:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (id)fixedValueScalingBlock
{
  return self->_fixedValueScalingBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fixedValueScalingBlock, 0);
  objc_storeStrong((id *)&self->_preferredUnit, 0);
  objc_storeStrong((id *)&self->_localizableTrendDescription, 0);
  objc_storeStrong((id *)&self->_averageValue, 0);
  objc_storeStrong((id *)&self->_xEnd, 0);
  objc_storeStrong((id *)&self->_xStart, 0);
}

@end
