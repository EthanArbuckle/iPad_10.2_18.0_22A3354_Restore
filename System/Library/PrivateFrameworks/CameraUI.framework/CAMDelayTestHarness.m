@implementation CAMDelayTestHarness

- (CAMDelayTestHarness)initWithTestName:(id)a3 secondsDelay:(int64_t)a4
{
  CAMDelayTestHarness *v5;
  CAMDelayTestHarness *v6;
  CAMDelayTestHarness *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CAMDelayTestHarness;
  v5 = -[CAMPerformanceTestHarness initWithTestName:](&v9, sel_initWithTestName_, a3);
  v6 = v5;
  if (v5)
  {
    v5->__delay = a4;
    v7 = v5;
  }

  return v6;
}

- (void)startTesting
{
  dispatch_time_t v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMDelayTestHarness;
  -[CAMPerformanceTestHarness startTesting](&v5, sel_startTesting);
  v3 = dispatch_time(0, 1000000000 * -[CAMDelayTestHarness _delay](self, "_delay"));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CAMDelayTestHarness_startTesting__block_invoke;
  block[3] = &unk_1EA328868;
  block[4] = self;
  dispatch_after(v3, MEMORY[0x1E0C80D38], block);
}

uint64_t __35__CAMDelayTestHarness_startTesting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopTesting");
}

- (int64_t)_delay
{
  return self->__delay;
}

- (void)set_delay:(int64_t)a3
{
  self->__delay = a3;
}

@end
