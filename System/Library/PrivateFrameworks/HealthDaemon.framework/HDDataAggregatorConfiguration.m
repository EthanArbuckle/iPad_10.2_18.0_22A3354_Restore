@implementation HDDataAggregatorConfiguration

- (void)setHasForegroundObserver:(BOOL)a3
{
  self->_hasForegroundObserver = a3;
}

- (id)description
{
  const char *v2;
  const char *v3;

  v2 = "YES";
  if (self->_hasActiveWorkout)
    v3 = "YES";
  else
    v3 = "no";
  if (!self->_hasForegroundObserver)
    v2 = "no";
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<Interval: %0.1lfs, Latency: %0.1lfs, Duration: %0.1lfs, Workout: %s, Foreground: %s>"), *(_QWORD *)&self->_aggregationInterval, *(_QWORD *)&self->_collectionLatency, *(_QWORD *)&self->_maximumSeriesDuration, v3, v2);
}

- (BOOL)hasForegroundObserver
{
  return self->_hasForegroundObserver;
}

- (BOOL)isEqual:(id)a3
{
  HDDataAggregatorConfiguration *v4;
  BOOL v5;

  v4 = (HDDataAggregatorConfiguration *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && vabdd_f64(self->_collectionLatency, v4->_collectionLatency) < 2.22044605e-16
      && vabdd_f64(self->_aggregationInterval, v4->_aggregationInterval) < 2.22044605e-16
      && vabdd_f64(self->_maximumSeriesDuration, v4->_maximumSeriesDuration) < 2.22044605e-16
      && self->_hasActiveWorkout == v4->_hasActiveWorkout
      && self->_hasForegroundObserver == v4->_hasForegroundObserver;
  }

  return v5;
}

- (BOOL)hasActiveWorkout
{
  return self->_hasActiveWorkout;
}

+ (HDDataAggregatorConfiguration)configurationWithLatency:(double)a3 interval:(double)a4 seriesDuration:(double)a5 activeWorkout:(BOOL)a6 foregroundObserver:(BOOL)a7
{
  HDDataAggregatorConfiguration *v12;
  double v13;
  objc_super v15;

  v12 = [HDDataAggregatorConfiguration alloc];
  if (v12)
  {
    v15.receiver = v12;
    v15.super_class = (Class)HDDataAggregatorConfiguration;
    v12 = objc_msgSendSuper2(&v15, sel_init);
    if (v12)
    {
      v12->_collectionLatency = fmax(a3, 0.0);
      v12->_aggregationInterval = fmax(a4, 0.0);
      if (a5 >= a4)
        v13 = a5;
      else
        v13 = a4;
      v12->_maximumSeriesDuration = v13;
      v12->_hasActiveWorkout = a6;
      v12->_hasForegroundObserver = a7;
    }
  }
  return v12;
}

- (double)collectionLatency
{
  return self->_collectionLatency;
}

- (double)aggregationInterval
{
  return self->_aggregationInterval;
}

- (double)maximumSeriesDuration
{
  return self->_maximumSeriesDuration;
}

@end
