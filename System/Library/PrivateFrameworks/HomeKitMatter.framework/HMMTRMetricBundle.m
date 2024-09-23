@implementation HMMTRMetricBundle

- (HMMTRMetricBundle)initWithTime:(id)a3 name:(id)a4
{
  id v7;
  id v8;
  HMMTRMetricBundle *v9;
  HMMTRMetricBundle *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMMTRMetricBundle;
  v9 = -[HMMTRMetricBundle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_time, a3);
    objc_storeStrong((id *)&v10->_name, a4);
  }

  return v10;
}

- (double)durationWithDate:(id)a3
{
  double result;

  objc_msgSend(a3, "timeIntervalSinceDate:", self->_time);
  return result;
}

- (NSDate)time
{
  return self->_time;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_time, 0);
}

@end
