@implementation IDSCurrentServerTimePair

- (IDSCurrentServerTimePair)initWithInitialProcessMonotonicTimeInNanoSeconds:(unint64_t)a3 initialServerTimeInNanoSeconds:(unint64_t)a4 isAccurate:(BOOL)a5
{
  IDSCurrentServerTimePair *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)IDSCurrentServerTimePair;
  result = -[IDSCurrentServerTimePair init](&v9, sel_init);
  if (result)
  {
    result->_initialProcessMonotonicTimeInNanoSeconds = a3;
    result->_initialServerTimeInNanoSeconds = a4;
    result->_isAccurate = a5;
  }
  return result;
}

- (unint64_t)initialProcessMonotonicTimeInNanoSeconds
{
  return self->_initialProcessMonotonicTimeInNanoSeconds;
}

- (unint64_t)initialServerTimeInNanoSeconds
{
  return self->_initialServerTimeInNanoSeconds;
}

- (BOOL)isAccurate
{
  return self->_isAccurate;
}

@end
