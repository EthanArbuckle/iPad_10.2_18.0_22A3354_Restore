@implementation _HKSampleQueryResult

- (_HKSampleQueryResult)initWithStartDate:(id)a3 endDate:(id)a4 samples:(id)a5
{
  id v9;
  id v10;
  id v11;
  _HKSampleQueryResult *v12;
  _HKSampleQueryResult *v13;
  uint64_t v14;
  NSArray *samples;
  uint64_t v16;
  NSDateInterval *dateInterval;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_HKSampleQueryResult;
  v12 = -[_HKSampleQueryResult init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_startDate, a3);
    objc_storeStrong((id *)&v13->_endDate, a4);
    v14 = objc_msgSend(v11, "copy");
    samples = v13->_samples;
    v13->_samples = (NSArray *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
    dateInterval = v13->_dateInterval;
    v13->_dateInterval = (NSDateInterval *)v16;

  }
  return v13;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (NSDate)endDate
{
  return self->_endDate;
}

- (NSDateInterval)dateInterval
{
  return self->_dateInterval;
}

- (NSArray)samples
{
  return self->_samples;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
