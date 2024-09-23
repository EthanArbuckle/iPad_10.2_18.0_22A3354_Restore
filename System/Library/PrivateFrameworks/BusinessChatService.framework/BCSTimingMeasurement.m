@implementation BCSTimingMeasurement

+ (id)newTimingMeasurement:(int64_t)a3 withHandlers:(id)a4
{
  id v6;
  BCSTimingMeasurement *v7;
  id v8;
  BCSTimingMeasurement *v9;
  objc_super v11;

  v6 = a4;
  v7 = [BCSTimingMeasurement alloc];
  v8 = v6;
  if (v7)
  {
    v11.receiver = v7;
    v11.super_class = (Class)BCSTimingMeasurement;
    v9 = (BCSTimingMeasurement *)objc_msgSendSuper2(&v11, sel__init);
    v7 = v9;
    if (v9)
    {
      v9->_timingMeasurementType = a3;
      objc_storeStrong((id *)&v9->_realTimeMeasurementHandlers, a4);
    }
  }

  return v7;
}

- (void)begin
{
  void *v3;
  const char *v4;
  void *v5;
  NSArray *realTimeMeasurementHandlers;
  _QWORD v7[5];

  if (!self || !objc_getProperty(self, a2, 8, 1))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v3;
    if (self)
    {
      objc_setProperty_atomic(self, v4, v3, 8);

      realTimeMeasurementHandlers = self->_realTimeMeasurementHandlers;
    }
    else
    {

      realTimeMeasurementHandlers = 0;
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __29__BCSTimingMeasurement_begin__block_invoke;
    v7[3] = &unk_24C39CD30;
    v7[4] = self;
    -[NSArray enumerateObjectsUsingBlock:](realTimeMeasurementHandlers, "enumerateObjectsUsingBlock:", v7);
  }
}

uint64_t __29__BCSTimingMeasurement_begin__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timingMeasurementDidBegin:", *(_QWORD *)(a1 + 32));
}

- (void)end
{
  id v3;
  const char *v4;
  void *v5;
  id Property;
  void *v7;
  SEL v8;
  NSArray *realTimeMeasurementHandlers;
  _QWORD v10[5];

  if (self)
  {
    v3 = objc_getProperty(self, a2, 8, 1);
    if (v3)
    {
      v5 = v3;
      Property = objc_getProperty(self, v4, 16, 1);

      if (!Property)
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_setProperty_atomic(self, v8, v7, 16);

        realTimeMeasurementHandlers = self->_realTimeMeasurementHandlers;
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __27__BCSTimingMeasurement_end__block_invoke;
        v10[3] = &unk_24C39CD30;
        v10[4] = self;
        -[NSArray enumerateObjectsUsingBlock:](realTimeMeasurementHandlers, "enumerateObjectsUsingBlock:", v10);
      }
    }
  }
}

uint64_t __27__BCSTimingMeasurement_end__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "timingMeasurementDidEnd:", *(_QWORD *)(a1 + 32));
}

- (double)duration
{
  id v3;
  const char *v4;
  void *v5;
  id Property;
  const char *v7;
  id v8;
  SEL v9;
  double v10;
  double v11;

  if (!self)
    return 0.0;
  v3 = objc_getProperty(self, a2, 8, 1);
  if (!v3)
    return 0.0;
  v5 = v3;
  Property = objc_getProperty(self, v4, 16, 1);

  if (!Property)
    return 0.0;
  v8 = objc_getProperty(self, v7, 16, 1);
  objc_msgSend(v8, "timeIntervalSinceDate:", objc_getProperty(self, v9, 8, 1));
  v11 = v10;

  return v11;
}

- (int64_t)timingMeasurementType
{
  return self->_timingMeasurementType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_realTimeMeasurementHandlers, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
