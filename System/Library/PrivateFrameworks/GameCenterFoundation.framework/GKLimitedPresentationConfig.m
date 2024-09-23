@implementation GKLimitedPresentationConfig

- (GKLimitedPresentationConfig)init
{
  GKLimitedPresentationConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKLimitedPresentationConfig;
  result = -[GKLimitedPresentationConfig init](&v3, sel_init);
  if (result)
  {
    result->_limit = -1;
    result->_initialLimit = -1;
    *(_OWORD *)&result->_resetPeriod = xmmword_1BCF3F540;
    result->_enabled = 1;
  }
  return result;
}

- (int64_t)initialLimit
{
  if (self->_initialLimit < 0)
    return -[GKLimitedPresentationConfig limit](self, "limit");
  else
    return self->_initialLimit;
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void)setInitialLimit:(int64_t)a3
{
  self->_initialLimit = a3;
}

- (double)resetPeriod
{
  return self->_resetPeriod;
}

- (void)setResetPeriod:(double)a3
{
  self->_resetPeriod = a3;
}

- (double)minTimeBetweenAppearances
{
  return self->_minTimeBetweenAppearances;
}

- (void)setMinTimeBetweenAppearances:(double)a3
{
  self->_minTimeBetweenAppearances = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

@end
