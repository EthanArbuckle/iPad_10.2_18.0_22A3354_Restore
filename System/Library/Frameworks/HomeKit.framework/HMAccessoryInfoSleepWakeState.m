@implementation HMAccessoryInfoSleepWakeState

- (HMAccessoryInfoSleepWakeState)initWithSleepWakeState:(unint64_t)a3
{
  HMAccessoryInfoSleepWakeState *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HMAccessoryInfoSleepWakeState;
  result = -[HMAccessoryInfoSleepWakeState init](&v5, sel_init);
  if (result)
    result->_sleepWakeState = a3;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)HMAccessoryInfoSleepWakeState;
  -[HMAccessoryInfoSleepWakeState description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HMAccessoryInfoSleepWakeState sleepWakeState](self, "sleepWakeState"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, sws: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)protoPayload
{
  HMAccessoryInfoProtoSleepWakeStateEvent *v3;

  v3 = objc_alloc_init(HMAccessoryInfoProtoSleepWakeStateEvent);
  -[HMAccessoryInfoProtoSleepWakeStateEvent setSleepWakeState:](v3, "setSleepWakeState:", -[HMAccessoryInfoSleepWakeState sleepWakeState](self, "sleepWakeState"));
  return v3;
}

- (id)protoData
{
  void *v2;
  void *v3;

  -[HMAccessoryInfoSleepWakeState protoPayload](self, "protoPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMAccessoryInfoSleepWakeState)initWithProtoPayload:(id)a3
{
  return -[HMAccessoryInfoSleepWakeState initWithSleepWakeState:](self, "initWithSleepWakeState:", objc_msgSend(a3, "sleepWakeState"));
}

- (HMAccessoryInfoSleepWakeState)initWithProtoData:(id)a3
{
  id v4;
  HMAccessoryInfoProtoSleepWakeStateEvent *v5;
  HMAccessoryInfoSleepWakeState *v6;

  v4 = a3;
  v5 = -[HMAccessoryInfoProtoSleepWakeStateEvent initWithData:]([HMAccessoryInfoProtoSleepWakeStateEvent alloc], "initWithData:", v4);

  v6 = -[HMAccessoryInfoSleepWakeState initWithProtoPayload:](self, "initWithProtoPayload:", v5);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMAccessoryInfoSleepWakeState *v4;
  HMAccessoryInfoSleepWakeState *v5;
  HMAccessoryInfoSleepWakeState *v6;
  unint64_t v7;
  BOOL v8;

  v4 = (HMAccessoryInfoSleepWakeState *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      v7 = -[HMAccessoryInfoSleepWakeState sleepWakeState](self, "sleepWakeState");
      v8 = v7 == -[HMAccessoryInfoSleepWakeState sleepWakeState](v6, "sleepWakeState");
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (unint64_t)sleepWakeState
{
  return self->_sleepWakeState;
}

@end
