@implementation HKSleepPeriodChartPointOffset

+ (id)chartPointOffsetWithValue:(id)a3 continuation:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithValue:continuation:", v6, v4);

  return v7;
}

- (HKSleepPeriodChartPointOffset)initWithValue:(id)a3 continuation:(BOOL)a4
{
  id v7;
  HKSleepPeriodChartPointOffset *v8;
  HKSleepPeriodChartPointOffset *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKSleepPeriodChartPointOffset;
  v8 = -[HKSleepPeriodChartPointOffset init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_value, a3);
    v9->_continuation = a4;
  }

  return v9;
}

- (NSNumber)value
{
  return self->_value;
}

- (BOOL)continuation
{
  return self->_continuation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
