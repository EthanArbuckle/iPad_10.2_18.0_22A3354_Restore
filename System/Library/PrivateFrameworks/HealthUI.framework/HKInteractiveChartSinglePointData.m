@implementation HKInteractiveChartSinglePointData

- (double)minValue
{
  uint64_t v2;

  v2 = 40;
  if (!self->_representsRange)
    v2 = 16;
  return *(double *)((char *)&self->super.isa + v2);
}

- (double)maxValue
{
  uint64_t v2;

  v2 = 48;
  if (!self->_representsRange)
    v2 = 16;
  return *(double *)((char *)&self->super.isa + v2);
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  if (self->_representsRange)
  {
    -[HKInteractiveChartSinglePointData minValue](self, "minValue");
    v5 = v4;
    -[HKInteractiveChartSinglePointData maxValue](self, "maxValue");
    v7 = v6;
    -[HKInteractiveChartSinglePointData unit](self, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("HKInteractiveChartSinglePointData(%lg - %lg, %@)"), v5, v7, v9);
  }
  else
  {
    -[HKInteractiveChartSinglePointData value](self, "value");
    v11 = v10;
    -[HKInteractiveChartSinglePointData unit](self, "unit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unitString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("HKInteractiveChartSinglePointData(%lg, %@)"), v11, v9, v14);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v12;
}

- (double)value
{
  return self->_value;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void)setUnit:(id)a3
{
  objc_storeStrong((id *)&self->_unit, a3);
}

- (BOOL)representsRange
{
  return self->_representsRange;
}

- (void)setRepresentsRange:(BOOL)a3
{
  self->_representsRange = a3;
}

- (int64_t)recordCount
{
  return self->_recordCount;
}

- (void)setRecordCount:(int64_t)a3
{
  self->_recordCount = a3;
}

- (void)setMinValue:(double)a3
{
  self->_minValue = a3;
}

- (void)setMaxValue:(double)a3
{
  self->_maxValue = a3;
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void)setStatisticsInterval:(id)a3
{
  objc_storeStrong((id *)&self->_statisticsInterval, a3);
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
