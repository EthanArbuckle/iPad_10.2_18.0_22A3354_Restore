@implementation HKHorizontalTimePeriodChartPoint

- (id)xValueAsGenericType
{
  return self->_xStart;
}

- (id)minXValueAsGenericType
{
  return self->_xStart;
}

- (id)maxXValueAsGenericType
{
  return self->_xEnd;
}

- (id)yValueForKey:(id)a3
{
  return self->_yValue;
}

- (id)minYValue
{
  return self->_yValue;
}

- (id)maxYValue
{
  return self->_yValue;
}

- (id)allYValues
{
  void *v2;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  if (self->_yValue)
  {
    v4[0] = self->_yValue;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = (void *)MEMORY[0x1E0C9AA60];
  }
  return v2;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKHorizontalTimePeriodChartPoint;
  -[HKHorizontalTimePeriodChartPoint description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { (%@ - %@), %@ }"), v4, self->_xStart, self->_xEnd, self->_yValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSDate)xStart
{
  return self->_xStart;
}

- (void)setXStart:(id)a3
{
  objc_storeStrong((id *)&self->_xStart, a3);
}

- (NSDate)xEnd
{
  return self->_xEnd;
}

- (void)setXEnd:(id)a3
{
  objc_storeStrong((id *)&self->_xEnd, a3);
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (void)setYValue:(id)a3
{
  objc_storeStrong((id *)&self->_yValue, a3);
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xEnd, 0);
  objc_storeStrong((id *)&self->_xStart, 0);
}

@end
