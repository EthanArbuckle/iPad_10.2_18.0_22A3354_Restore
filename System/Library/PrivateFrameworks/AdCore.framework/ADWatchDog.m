@implementation ADWatchDog

- (ADWatchDog)initWithReason:(id)a3 andDelay:(unint64_t)a4
{
  id v7;
  ADWatchDog *v8;
  ADWatchDog *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADWatchDog;
  v8 = -[ADWatchDog init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_delayTime = a4;
  }

  return v9;
}

- (void)updateReason:(id)a3
{
  NSString *v4;
  void *v5;
  NSString *reason;

  v4 = (NSString *)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Updating watchdog reason from '%@' to '%@'."), self->_reason, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _ADLog(CFSTR("ToroLogging"), v5, 0);

  reason = self->_reason;
  self->_reason = v4;

}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (unint64_t)delayTime
{
  return self->_delayTime;
}

- (void)setDelayTime:(unint64_t)a3
{
  self->_delayTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
}

@end
