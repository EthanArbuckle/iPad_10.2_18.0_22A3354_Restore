@implementation LBFBitacoraStateTransition

- (LBFBitacoraStateTransition)initWithBitcoraState:(int64_t)a3 previousState:(int64_t)a4 timestamp:(id)a5 timedelta:(double)a6
{
  id v11;
  LBFBitacoraStateTransition *v12;
  LBFBitacoraStateTransition *v13;
  NSObject *v14;
  objc_super v16;
  uint8_t buf[4];
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)LBFBitacoraStateTransition;
  v12 = -[LBFBitacoraStateTransition init](&v16, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_state = a3;
    v12->_previousState = a4;
    objc_storeStrong((id *)&v12->_timestamp, a5);
    v13->_timedelta = a6;
    if (a6 < 0.0)
    {
      v14 = LBFLogContextBitacoraStateTransition;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateTransition, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        v18 = a3;
        _os_log_impl(&dword_2402DE000, v14, OS_LOG_TYPE_INFO, "trial events are tracked earlier than the bucket %d", buf, 8u);
      }
    }
  }

  return v13;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)previousState
{
  return self->_previousState;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (double)timedelta
{
  return self->_timedelta;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
}

@end
