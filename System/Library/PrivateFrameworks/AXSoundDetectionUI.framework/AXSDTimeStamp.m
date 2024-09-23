@implementation AXSDTimeStamp

- (AXSDTimeStamp)initWithTime:(double)a3 andDuration:(double)a4
{
  AXSDTimeStamp *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AXSDTimeStamp;
  result = -[AXSDTimeStamp init](&v7, sel_init);
  if (result)
  {
    result->_duration = a4;
    result->_time = a3;
  }
  return result;
}

- (AXSDTimeStamp)initWithResult:(id)a3
{
  id v4;
  AXSDTimeStamp *v5;
  double v6;
  double v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AXSDTimeStamp;
  v5 = -[AXSDTimeStamp init](&v9, sel_init);
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "timeRange");
      v6 = (double)0 / (double)0;
      v7 = v6;
    }
    else
    {
      v6 = NAN;
      v7 = NAN;
    }
    v5->_duration = v7;
    v5->_time = v6;
  }

  return v5;
}

- (double)time
{
  return self->_time;
}

- (double)duration
{
  return self->_duration;
}

@end
