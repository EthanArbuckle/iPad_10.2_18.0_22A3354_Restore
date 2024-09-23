@implementation IRReplayEventDescriptor

- (IRReplayEventDescriptor)initWithDate:(id)a3 withContextChangeReason:(id)a4 withSystemState:(id)a5
{
  id v9;
  id v10;
  id v11;
  IRReplayEventDescriptor *v12;
  IRReplayEventDescriptor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)IRReplayEventDescriptor;
  v12 = -[IRReplayEventDescriptor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a3);
    objc_storeStrong((id *)&v13->_contextChangeReason, a4);
    objc_storeStrong((id *)&v13->_systemState, a5);
  }

  return v13;
}

- (NSDate)date
{
  return self->_date;
}

- (NSString)contextChangeReason
{
  return self->_contextChangeReason;
}

- (IRSystemStateDO)systemState
{
  return self->_systemState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemState, 0);
  objc_storeStrong((id *)&self->_contextChangeReason, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
