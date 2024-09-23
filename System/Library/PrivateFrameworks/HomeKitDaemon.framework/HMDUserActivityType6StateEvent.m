@implementation HMDUserActivityType6StateEvent

- (HMDUserActivityType6StateEvent)initWithState:(unint64_t)a3 stateEnd:(id)a4 changedTimestamp:(id)a5 withReason:(unint64_t)a6
{
  id v11;
  id v12;
  HMDUserActivityType6StateEvent *v13;
  HMDUserActivityType6StateEvent *v14;
  objc_super v16;

  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HMDUserActivityType6StateEvent;
  v13 = -[HMDUserActivityType6StateEvent init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_state = a3;
    objc_storeStrong((id *)&v13->_stateEnd, a4);
    objc_storeStrong((id *)&v14->_changedTimestamp, a5);
    v14->_reason = a6;
  }

  return v14;
}

- (unint64_t)state
{
  return self->_state;
}

- (NSDate)stateEnd
{
  return self->_stateEnd;
}

- (NSDate)changedTimestamp
{
  return self->_changedTimestamp;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedTimestamp, 0);
  objc_storeStrong((id *)&self->_stateEnd, 0);
}

@end
