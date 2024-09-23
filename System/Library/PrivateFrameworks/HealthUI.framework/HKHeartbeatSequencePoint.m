@implementation HKHeartbeatSequencePoint

- (HKHeartbeatSequencePoint)initWithTimeInterval:(double)a3 beatsPerMinute:(double)a4
{
  HKHeartbeatSequencePoint *v6;
  uint64_t v7;
  NSNumber *xValue;
  uint64_t v9;
  NSNumber *yValue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HKHeartbeatSequencePoint;
  v6 = -[HKHeartbeatSequencePoint init](&v12, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    xValue = v6->_xValue;
    v6->_xValue = (NSNumber *)v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
    v9 = objc_claimAutoreleasedReturnValue();
    yValue = v6->_yValue;
    v6->_yValue = (NSNumber *)v9;

  }
  return v6;
}

- (id)xValueAsGenericType
{
  return self->_xValue;
}

- (id)minXValueAsGenericType
{
  return self->_xValue;
}

- (id)maxXValueAsGenericType
{
  return self->_xValue;
}

- (id)yValueForKey:(id)a3
{
  return self->_yValue;
}

- (id)allYValues
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = self->_yValue;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)minYValue
{
  return self->_yValue;
}

- (id)maxYValue
{
  return self->_yValue;
}

- (NSNumber)xValue
{
  return self->_xValue;
}

- (NSNumber)yValue
{
  return self->_yValue;
}

- (HKGraphSeriesBlockCoordinateInfo)userInfo
{
  return self->_userInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_yValue, 0);
  objc_storeStrong((id *)&self->_xValue, 0);
}

@end
