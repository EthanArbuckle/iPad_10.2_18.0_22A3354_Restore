@implementation _WDSleepStageSampleObject

- (_WDSleepStageSampleObject)initWithSample:(id)a3
{
  id v5;
  _WDSleepStageSampleObject *v6;
  _WDSleepStageSampleObject *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_WDSleepStageSampleObject;
  v6 = -[_WDSleepStageSampleObject init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sample, a3);

  return v7;
}

- (NSDateInterval)dateInterval
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x24BDD1508]);
  -[HKCategorySample startDate](self->_sample, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKCategorySample endDate](self->_sample, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithStartDate:endDate:", v4, v5);

  return (NSDateInterval *)v6;
}

- (id)sourceRevision
{
  return 0;
}

- (id)device
{
  return 0;
}

- (HKCategorySample)sample
{
  return self->_sample;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sample, 0);
}

@end
