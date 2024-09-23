@implementation HMDUserActivityType3Schedule

- (HMDUserActivityType3Schedule)initWithState:(unint64_t)a3 stateChangedReason:(unint64_t)a4 stateChangedTime:(id)a5
{
  id v9;
  HMDUserActivityType3Schedule *v10;
  HMDUserActivityType3Schedule *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HMDUserActivityType3Schedule;
  v10 = -[HMDUserActivityType3Schedule init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_state = a3;
    v10->_stateChangedReason = a4;
    objc_storeStrong((id *)&v10->_stateChangedTime, a5);
  }

  return v11;
}

- (unint64_t)stateChangedReason
{
  return self->_stateChangedReason;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDate)stateChangedTime
{
  return self->_stateChangedTime;
}

- (BMStoreEvent)biomeEvent
{
  return self->_biomeEvent;
}

- (void)setBiomeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_biomeEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeEvent, 0);
  objc_storeStrong((id *)&self->_stateChangedTime, 0);
}

@end
