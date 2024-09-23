@implementation VCPTimeMeasurement

- (VCPTimeMeasurement)init
{
  VCPTimeMeasurement *v2;
  VCPTimeMeasurement *v3;
  VCPTimeMeasurement *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPTimeMeasurement;
  v2 = -[VCPTimeMeasurement init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_elapsedTimeSeconds = 0.0;
    v2->_timebase = 0;
    v2->_started = 0;
    v4 = v2;
  }

  return v3;
}

- (int)start
{
  int result;
  mach_timebase_info *p_timebase;
  uint32_t numer;
  uint64_t v6;

  if (self->_started)
    return -18;
  numer = self->_timebase.numer;
  p_timebase = &self->_timebase;
  if (numer || self->_timebase.denom || (result = mach_timebase_info(p_timebase)) == 0)
  {
    self->_started = 1;
    v6 = mach_absolute_time();
    result = 0;
    self->_start = v6;
  }
  return result;
}

- (int)stop
{
  uint64_t v3;
  int result;
  unint64_t v5;
  unint64_t v6;

  if (!self->_started)
    return -18;
  v3 = mach_absolute_time();
  result = 0;
  v5 = (v3 - self->_start) * self->_timebase.numer;
  self->_started = 0;
  LODWORD(v6) = self->_timebase.denom;
  self->_elapsedTimeSeconds = self->_elapsedTimeSeconds + (double)v5 / (double)v6 / 1000000000.0;
  return result;
}

- (void)reset
{
  self->_started = 0;
  self->_elapsedTimeSeconds = 0.0;
}

- (double)elapsedTimeSeconds
{
  return self->_elapsedTimeSeconds;
}

- (BOOL)started
{
  return self->_started;
}

@end
