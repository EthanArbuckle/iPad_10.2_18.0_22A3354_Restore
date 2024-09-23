@implementation BLSHWatchdogAbortParameters

- (BLSHWatchdogAbortParameters)initWithDelegate:(id)a3 abortContext:(id)a4 isPotentialHang:(BOOL)a5 hasSleepBeenRequested:(BOOL)a6 sleepImminent:(BOOL)a7 sleepImminentSinceScheduled:(BOOL)a8 timeInSleepImminent:(double)a9 explanation:(id)a10
{
  id v17;
  id v18;
  id v19;
  BLSHWatchdogAbortParameters *v20;
  BLSHWatchdogAbortParameters *v21;
  uint64_t v22;
  NSString *explanation;
  objc_super v25;

  v17 = a3;
  v18 = a4;
  v19 = a10;
  v25.receiver = self;
  v25.super_class = (Class)BLSHWatchdogAbortParameters;
  v20 = -[BLSHWatchdogAbortParameters init](&v25, sel_init);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_delegate, v17);
    objc_storeStrong((id *)&v21->_abortContext, a4);
    v21->_isPotentialHang = a5;
    v21->_hasSleepBeenRequested = a6;
    v21->_sleepImminent = a7;
    v21->_sleepImminentSinceScheduled = a8;
    v21->_timeInSleepImminent = a9;
    v22 = objc_msgSend(v19, "copy");
    explanation = v21->_explanation;
    v21->_explanation = (NSString *)v22;

  }
  return v21;
}

- (BLSHWatchdogDelegate)delegate
{
  return (BLSHWatchdogDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BLSHWatchdogAbortContext)abortContext
{
  return self->_abortContext;
}

- (void)setAbortContext:(id)a3
{
  objc_storeStrong((id *)&self->_abortContext, a3);
}

- (BOOL)isPotentialHang
{
  return self->_isPotentialHang;
}

- (void)setIsPotentialHang:(BOOL)a3
{
  self->_isPotentialHang = a3;
}

- (BOOL)hasSleepBeenRequested
{
  return self->_hasSleepBeenRequested;
}

- (void)setHasSleepBeenRequested:(BOOL)a3
{
  self->_hasSleepBeenRequested = a3;
}

- (BOOL)sleepImminent
{
  return self->_sleepImminent;
}

- (void)setSleepImminent:(BOOL)a3
{
  self->_sleepImminent = a3;
}

- (BOOL)sleepImminentSinceScheduled
{
  return self->_sleepImminentSinceScheduled;
}

- (void)setSleepImminentSinceScheduled:(BOOL)a3
{
  self->_sleepImminentSinceScheduled = a3;
}

- (double)timeInSleepImminent
{
  return self->_timeInSleepImminent;
}

- (void)setTimeInSleepImminent:(double)a3
{
  self->_timeInSleepImminent = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (void)setExplanation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_abortContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
