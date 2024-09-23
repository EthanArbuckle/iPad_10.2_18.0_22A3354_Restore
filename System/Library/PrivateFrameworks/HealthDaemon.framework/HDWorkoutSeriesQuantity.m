@implementation HDWorkoutSeriesQuantity

- (HDWorkoutSeriesQuantity)initWithQuantity:(id)a3 dateInterval:(id)a4 series:(id)a5
{
  id v9;
  id v10;
  id v11;
  HDWorkoutSeriesQuantity *v12;
  HDWorkoutSeriesQuantity *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HDWorkoutSeriesQuantity;
  v12 = -[HDWorkoutSeriesQuantity init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_quantity, a3);
    objc_storeStrong((id *)&v13->_dateInterval, a4);
    objc_storeStrong((id *)&v13->_series, a5);
  }

  return v13;
}

- (HKQuantity)hdw_quantity
{
  return self->_quantity;
}

- (HKQuantityType)hdw_type
{
  return -[HKQuantitySample quantityType](self->_series, "quantityType");
}

- (NSDateInterval)hdw_dateInterval
{
  return self->_dateInterval;
}

- (double)hdw_startTimestamp
{
  void *v2;
  double v3;
  double v4;

  -[NSDateInterval startDate](self->_dateInterval, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (double)hdw_endTimestamp
{
  void *v2;
  double v3;
  double v4;

  -[NSDateInterval endDate](self->_dateInterval, "endDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (HKQuantitySample)hdw_sample
{
  return self->_series;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ @ %@, from %@>"), self->_quantity, self->_dateInterval, self->_series);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_series, 0);
  objc_storeStrong((id *)&self->_dateInterval, 0);
  objc_storeStrong((id *)&self->_quantity, 0);
}

@end
