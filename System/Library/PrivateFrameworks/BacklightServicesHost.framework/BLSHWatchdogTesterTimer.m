@implementation BLSHWatchdogTesterTimer

- (BLSHWatchdogTesterTimer)initWithExplanation:(id)a3
{
  id v4;
  BLSHWatchdogTesterTimer *v5;
  uint64_t v6;
  NSString *explanation;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHWatchdogTesterTimer;
  v5 = -[BLSHWatchdogTesterTimer init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;

  }
  return v5;
}

- (void)invalidate:(unint64_t)a3
{
  self->_invalidated = 1;
  self->_invalidationReason = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (unint64_t)invalidationReason
{
  return self->_invalidationReason;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)hasSleepBeenImminentSinceScheduled
{
  return self->_sleepImminentSinceScheduled;
}

- (void)setSleepImminentSinceScheduled:(BOOL)a3
{
  self->_sleepImminentSinceScheduled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
}

@end
