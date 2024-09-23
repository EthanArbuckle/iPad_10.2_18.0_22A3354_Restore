@implementation HMDUserActivityType3StateLogEvent

- (HMDUserActivityType3StateLogEvent)initWithState:(unint64_t)a3 oldState:(unint64_t)a4 logReason:(unint64_t)a5
{
  HMDUserActivityType3StateLogEvent *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDUserActivityType3StateLogEvent;
  result = -[HMMLogEvent init](&v9, sel_init);
  if (result)
  {
    result->_state = a3;
    result->_oldState = a4;
    result->_logReason = a5;
  }
  return result;
}

- (BOOL)didEnterTransition
{
  return -[HMDUserActivityType3StateLogEvent state](self, "state") - 3 <= 1
      && -[HMDUserActivityType3StateLogEvent oldState](self, "oldState") - 5 < 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)didEnterType5
{
  unint64_t v3;

  v3 = -[HMDUserActivityType3StateLogEvent state](self, "state");
  return v3 != -[HMDUserActivityType3StateLogEvent oldState](self, "oldState")
      && -[HMDUserActivityType3StateLogEvent state](self, "state") == 5;
}

- (unint64_t)state
{
  return self->_state;
}

- (unint64_t)oldState
{
  return self->_oldState;
}

- (unint64_t)logReason
{
  return self->_logReason;
}

@end
